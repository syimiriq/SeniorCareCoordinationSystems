<%-- 
    Document   : editSeniorGuardian
    Created on : Jan 16, 2025, 3:34:09 AM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Senior & Guardian</title>
</head>
<body>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        String type = request.getParameter("type"); // "senior" or "guardian"
        Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
        PreparedStatement stmt;
        ResultSet rs;

        if ("senior".equals(type)) {
            stmt = conn.prepareStatement("SELECT * FROM SENIORS WHERE ID = ?");
        } else {
            stmt = conn.prepareStatement("SELECT * FROM GUARDIANS WHERE ID = ?");
        }
        stmt.setInt(1, id);
        rs = stmt.executeQuery();

        if (rs.next()) {
    %>
    <h2>Edit <%= type.equals("senior") ? "Senior" : "Guardian" %> Details</h2>
    <form action="<%= type.equals("senior") ? "UpdateSeniorServlet" : "UpdateGuardianServlet" %>" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <div>
            <label for="name">Name:</label>
            <input type="text" name="name" value="<%= rs.getString("name") %>" required>
        </div>
        <div>
            <label for="dob">Date of Birth:</label>
            <input type="date" name="dob" value="<%= rs.getDate("birth_date") %>" required>
        </div>
        <%
            if ("senior".equals(type)) {
        %>
        <div>
            <label for="gender">Gender:</label>
            <select name="gender" required>
                <option value="male" <%= rs.getString("gender").equals("male") ? "selected" : "" %>>Male</option>
                <option value="female" <%= rs.getString("gender").equals("female") ? "selected" : "" %>>Female</option>
                <option value="other" <%= rs.getString("gender").equals("other") ? "selected" : "" %>>Other</option>
            </select>
        </div>
        <%
            } else {
        %>
        <div>
            <label for="phone">Phone:</label>
            <input type="text" name="phone" value="<%= rs.getString("phone") %>" required>
        </div>
        <div>
            <label for="address">Address:</label>
            <textarea name="address" rows="3" required><%= rs.getString("address") %></textarea>
        </div>
        <%
            }
        %>
        <button type="submit">Update</button>
    </form>
    <%
        }
        conn.close();
    %>
</body>
</html>

