
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
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            width: 97%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
        

    <div class="container">
        <button class="button" type="button" onclick="window.location.href='medicalReport.jsp';">Back</button>
        <div class="header">
    <h1>Fill Medical Report</h1>
        </div>
    <form action="AddMedicalReportServlet" method="post">
        <p>Caretaker ID:<%= senior.getID() %>, Name: <%= senior.getName()%></p>
        <div class="form-group">
        <label for="height">Height(CM):</label>
        <input type="number" name="height" required><br>
        </div>
        <div class="form-group">
        <label for="weight">Weight(KG):</label>
        <input type="number" name="weight" required><br>
        </div>
        <div class="form-group">
        <label for="hr">Heart Rate(BPM):</label>
        <input type="number" name="hr" required><br>
        </div>
        <div class="form-group">
        <label for="bp">Blood Pressure(mm):</label>
        <input type="number" name="bp" required><br>
        </div>
        <div class="form-group">
        <label for="bt">Body Temperature(Celcius)</label>
        <input type="number" name="bt" required><br>
        <input type="hidden" name="seniorID" value="<%= senior.getID() %>">
        <input type="hidden" name="caretakerID" value="<%= caretaker.getID() %>">
        </div>

        <button class="button" type="submit">Add</button>
        <button class="button" type="reset">Reset</button>
    </form>
    </div>
</body>
</html>
