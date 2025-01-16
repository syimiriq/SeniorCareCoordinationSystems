<%-- 
    Document   : editCaretaker
    Created on : Jan 15, 2025, 10:41:34 PM
    Author     : Ichiro
--%>

<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Admins"%>
<html>
<head>
    <title>Edit Caretaker</title>
</head>
<body>
    <h1>Edit Caretaker</h1>

    <%
        // Check session for admin authentication
        if (session == null || session.getAttribute("Admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        Admins admin = (Admins) session.getAttribute("Admin");
        
        // Get caretaker ID from request
        String caretakerId = request.getParameter("id");
        if (caretakerId == null) {
            out.println("No caretaker ID provided!");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        String name = "", email = "", phone = "", role = "", username = "", password = "";
        boolean status = false;
        
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
            String query = "SELECT * FROM CARETAKERS WHERE ID = ?";
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(caretakerId));
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                name = rs.getString("NAME");
                email = rs.getString("EMAIL");
                phone = rs.getString("PHONE");
                username = rs.getString("USERNAME");
                password = rs.getString("PASSWORD");
                role = rs.getString("ROLE");
                status = rs.getBoolean("STATUS");
            } else {
                out.println("No caretaker found with ID: " + caretakerId);
                return;
            }
        } catch (SQLException e) {
            out.println("Error retrieving caretaker details: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <!-- Form for editing caretaker details -->
    <form action="EditCaretakerServlet" method="post">
        <input type="hidden" name="id" value="<%= caretakerId %>">
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= name %>" required><br>
        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= email %>" required><br>
        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= username %>" required><br>
        <label for="phone">Phone:</label>
        <input type="text" name="phone" value="<%= phone %>" required><br>
        <label for="role">Role:</label>
        <input type="text" name="role" value="<%= role %>" required><br>
        <label for="status">Status:</label>
        <select name="status">
            <option value="true" <%= status ? "selected" : "" %>>Active</option>
            <option value="false" <%= !status ? "selected" : "" %>>Inactive</option>
        </select><br>
        <label for="password">New Password:</label>
        <input type="password" name="password" placeholder="Enter new password"><br>
        <button type="submit">Save Changes</button>
    </form>

    <a href="caretakers.jsp">Back to Caretakers</a>
</body>
</html>
