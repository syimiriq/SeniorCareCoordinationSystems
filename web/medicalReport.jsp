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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            margin: 10px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
        }
        .table-container {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        td a {
            color: #333;
            font-weight: bold;
            text-decoration: none;
            margin-right: 10px;
        }
        td a:hover {
            color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <button type="button" class="button" onclick="window.location.href='home.jsp';">Back</button>
    <div class="container">
    <div class="header">
<h1>Take a Medical Report for:-</h1>
</div>
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
</div>
</body>
</html>
