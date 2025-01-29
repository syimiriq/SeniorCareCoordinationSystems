
<%@page import="com.scc.model.Caretakers"%>
<%@page import="com.scc.model.Seniors"%>

<%
               
            if(session == null || session.getAttribute("Caretaker")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
    String seniorIdParam = request.getParameter("id");
    if (seniorIdParam == null || !seniorIdParam.matches("\\d+")) {
        out.println("<p style='color:red;'>Invalid Senior ID.</p>");
        return;
    }

    int seniorID = Integer.parseInt(seniorIdParam);
    Seniors senior = Seniors.getSeniorById(seniorID);
    
    if(senior.takenMedicalReport(seniorID)){
        response.sendRedirect("medicalReport.jsp");
        return;
    }

    if (senior == null) {
        out.println("<p style='color:red;'>No senior found for the provided ID.</p>");
        return;
    }
            

%>
<!DOCTYPE html>
<html>
<head>
    <title>Take Medical Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 1.8em;
            color: #333;
        }
        .info-item {
            margin-bottom: 10px;
        }
        .info-item label {
            font-weight: bold;
            display: inline-block;
            width: 120px;
            color: #333;
        }
        .edit-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
        </style>
</head>
<body>
    <form>
        <button class="edit-btn" type="button" onclick="window.location.href='medicalReport.jsp';">Back</button>
    </form>
    <div class="container">
        <div class="header">
    <h1>Fill Medical Report</h1>
        </div>
    <form action="AddMedicalReportServlet" method="post">
        <p>Caretaker ID:<%= senior.getID() %>, Name: <%= senior.getName()%></p>
        <div class="info-item">
        <label for="height">Height(CM):</label>
        <input type="number" name="height" required><br>
        </div>
        <div class="info-item">
        <label for="weight">Weight(KG):</label>
        <input type="number" name="weight" required><br>
        </div>
        <div class="info-item">
        <label for="hr">Heart Rate(BPM):</label>
        <input type="number" name="hr" required><br>
        </div>
        <div class="info-item">
        <label for="bp">Blood Pressure(mm):</label>
        <input type="number" name="bp" required><br>
        </div>
        <div class="info-item">
        <label for="bt">Body Temperature(Celcius)</label>
        <input type="number" name="bt" required><br>
        <input type="hidden" name="seniorID" value="<%= senior.getID() %>">
        <input type="hidden" name="caretakerID" value="<%= caretaker.getID() %>">
        </div>

        <button class="edit-btn" type="submit">Add</button>
        <button class="edit-btn" type="reset">Reset</button>
    </form>
    </div>
</body>
</html>
