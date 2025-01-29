
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
</head>
<body>
    <form>
        <button type="button" onclick="window.location.href='medicalReport.jsp';">Back</button>
    </form>

    <h1>Fill Medical Report</h1>
    <form action="AddMedicalReportServlet" method="post">
        <p>Caretaker ID:<%= senior.getID() %>, Name: <%= senior.getName()%></p>
        <label for="height">Height(CM):</label>
        <input type="number" name="height" required><br>

        <label for="weight">Weight(KG):</label>
        <input type="number" name="weight" required><br>

        <label for="hr">Heart Rate(BPM):</label>
        <input type="number" name="hr" required><br>

        <label for="bp">Blood Pressure(mm):</label>
        <input type="number" name="bp" required><br>

        <label for="bt">Body Temperature(Celcius)</label>
        <input type="number" name="bt" required><br>
        <input type="hidden" name="seniorID" value="<%= senior.getID() %>">
        <input type="hidden" name="caretakerID" value="<%= caretaker.getID() %>">
        

        <button type="submit">Add</button>
        <button type="reset">Reset</button>
    </form>
</body>
</html>
