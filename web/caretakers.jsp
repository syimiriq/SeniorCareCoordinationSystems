<%-- 
    Document   : caretakers
    Created on : Jan 8, 2025, 10:24:40 AM
    Author     : Ichiro
--%>

<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Caretakers"%>
<%
    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM CARETAKERS");
%>
<html>
<head>
    <title>Manage Caretakers</title>
</head>
<body>
    <h1>Manage Caretakers</h1>
    <a href="addCaretaker.jsp">Add New Caretaker</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("NAME") %></td>
            <td><%= rs.getString("EMAIL") %></td>
            <td><%= rs.getString("PHONE") %></td>
            <td><%= rs.getString("ROLE") %></td>
            <td><%= rs.getBoolean("STATUS") ? "Active" : "Inactive" %></td>
            <td>
                <a href="editCaretaker.jsp?id=<%= rs.getInt("ID") %>">Edit</a>
                <a href="deleteCaretaker?id=<%= rs.getInt("ID") %>">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
