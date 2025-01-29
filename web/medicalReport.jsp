<%@page import="com.scc.model.Seniors"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>

            <%
               
            if(session == null || session.getAttribute("Caretaker")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                       Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
                       

    List<Seniors> seniorList = Seniors.getAllSeniors();
  
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Caretakers</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>

<form>
    <button type="button" onclick="window.location.href='home.jsp';">Back</button>
</form> 

<h1>Take a Medical Report for:-</h1>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Date of Birth</th>
        <th>Actions</th>
        <th>History</th>
    </tr>
    <%
       for (Seniors senior : seniorList) {
    %>
    
    <tr>
        <td><%= senior.getID() %></td>
        <td><%= senior.getName() %></td>
        <td><%= senior.getGender() %></td>
        <td><%= senior.getDateOfBirth() %></td>
        <td>
        <% if(senior.takenMedicalReport(senior.getID())){ %>
        Taken
            <% }else{ %>
            <a href="addMedicalReport.jsp?id=<%= senior.getID() %>">Not Taken</a>
        <% } %>
        </td>
        <td> <a href="medicalReportHistory.jsp?id=<%= senior.getID() %>">Check</a></td>
       
    </tr>
    <%
        }
    }
    %>
</table>

</body>
</html>
