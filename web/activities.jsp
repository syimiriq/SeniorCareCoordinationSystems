<%-- 
    Document   : Activities
    Created on : Jan 12, 2025, 1:47:24 AM
    Author     : NITRO
--%>
<%@page import="java.util.List"%>
<%@page import="com.scc.model.Activities"%>
<%
    if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch the list of activities
    List<Activities> activitiesList = Activities.getAllActivities();
%>
<html>
    <head>
        
        <title>Manage Activities</title>
       <style>
           body {
               font-family: Arial, sans-serif;
               background-color: #fff;  /* White background */
               color: #333;  /* Dark text for contrast */
            }
           table {
               width: 100%;
               border-collapse: collapse;
           }
           table, th, td {
               border: 1px solid black;
           }
           th, td {
               padding: 8px;
               text-align: center;
           }
           .button {
               padding: 10px 20px;
               margin: 10px;
               background-color: #333;  /* Black background */
               color: #fff;  /* White text */
               text-decoration: none;
               border-radius: 5px;
               font-weight: bold;
               border: none;
           }
           .button:hover {
               background-color: #555;  /* Dark gray when hovered */
           }
        </style>
    </head>
    <body>
        <button type="button" onclick="location.href='adminhome.jsp'">Back</button>
        <h1>Manage Activities</h1>
        <button type="button" class="button" onclick="location.href='addActivities.jsp'">Add New Activities</button>
        <button type="button" class="button" onclick="location.href='searchActivities.jsp'">Search Activities</button>
        <br><br>
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
        <%
              }
        %>
        </table>
        
    </body>
</html>
