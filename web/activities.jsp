<%-- 
    Document   : Activities
    Created on : Jan 12, 2025, 1:47:24 AM
    Author     : NITRO
--%>
<%@page import="java.util.List"%>
<%@page import="com.scc.model.Activities"%>
<%
    /*if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }*/

    // Fetch the list of caretakers
    List<Activities> activitiesList = Activities.getAllActivities();
%>
<html>
    <head>
        <title>Manage Activities</title>
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
        <button type="button" onclick="location.href=''">Back</button>
        <h1>Manage Activities</h1>
        <button type="button" onclick="location.href='addActivities.jsp'">Add New Activities</button>
        <button type="button" onclick="location.href='searchActivities.jsp'">Search Activities</button>
        <br>
        <table>
        <tr>
            <th>Activities ID</th>
            <th>Activities Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Location</th>
        </tr>
        <% 
            for (Activities activity : activitiesList){

        %>
        <tr>
        <td><%= activity.getid() %></td>
        <td><%= activity.getname() %></td>
        <td><%= activity.gettype() %></td>
        <td><%= activity.getdescription() %></td>
        <td><%= activity.getlocation() %></td>
        <td>
                <a href="editActivities.jsp?id=<%= activity.getid() %>">Edit</a>
                 <a href="deleteActivityServlet?id=<%= activity.getid() %>" onclick="return confirm('Are you sure you want to delete this caretaker?');">Delete</a>
            </td>
        </tr>
        
       /<%
              }
        %>
        </table>
        
    </body>
</html>
