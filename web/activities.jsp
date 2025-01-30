<%-- 
    Document   : Activities
    Created on : Jan 12, 2025, 1:47:24 AM
    Author     : NITRO
--%>
<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>
<%@page import="com.scc.model.Activities"%>
<%
    
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
    // Fetch the list of activities
    List<Activities> activitiesList = Activities.getAllActivities();
%>
<html>
    <head>
        
        <title>Manage Activities</title>
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
        }
        .button:hover {
            background-color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
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
    </style>
    </head>
    <body>
        <button type="button" class="button" onclick="location.href='home.jsp'">Back</button>
        <div class="container">
        <div class="header">
        <h1>Manage Activities</h1>
        <button type="button" class="button" onclick="location.href='addActivities.jsp'">Add New Activities</button>
        <button type="button" class="button" onclick="location.href='searchActivities.jsp'">Search Activities</button>
        </div>
        <table>
        <tr>
            <th>Activities ID</th>
            <th>Activities Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Location</th>
            <th>Actions</th>
        </tr>
        <% 
            for (Activities activity : activitiesList){

        %>
        <tr>
        <td><%= activity.getId() %></td>
        <td><%= activity.getName() %></td>
        <td><%= activity.getType() %></td>
        <td><%= activity.getDescription() %></td>
        <td><%= activity.getLocation() %></td>
        <td>
                <a href="editActivities.jsp?id=<%= activity.getId() %>">Edit</a>
                 <a href="deleteActivityServlet?id=<%= activity.getId() %>" onclick="return confirm('Are you sure you want to delete this activity?');">Delete</a>
            </td>
        </tr>
        <%
              }
        %>
        </table>
     </div>   
    </body>
</html>
