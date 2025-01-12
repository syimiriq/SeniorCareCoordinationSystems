<%-- 
    Document   : Activities
    Created on : Jan 12, 2025, 1:47:24 AM
    Author     : NITRO
--%>
<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Activities"%>
<%
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM ACTIVITY");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Activities</title>
    </head>
    <body>
        <table border="1">
        <tr>
            <th>Activities ID</th>
            <th>Activities Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Location</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("ACTIVITYID") %></td>
            <td><%= rs.getString("ACTIVITY_NAME") %></td>
            <td><%= rs.getString("ACTIVITY_TYPE") %></td>
            <td><%= rs.getString("ACTIVITY_DESCRIPTION") %></td>
            <td><%= rs.getString("LOCATION") %></td>
            <td>
                <a href="editActivities.jsp?id=<%= rs.getInt("ID") %>">Edit</a>
                <a href="deleteActivities.jsp?id=<%= rs.getInt("ID") %>">Delete</a>
            </td>
        </tr>
        <% } %>
        </table>
        <button type="button" onclick="location.href='addActivities.jsp'">Add New Acitivites</button>
    </body>
</html>
