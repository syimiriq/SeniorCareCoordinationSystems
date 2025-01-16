<%-- 
    Document   : caretakers
    Created on : Jan 8, 2025, 10:24:40 AM
    Author     : Ichiro
--%>

<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Admins"%>

<html>
<head>
    <title>Manage Caretakers</title>
</head>
<body>
    
<form>
    <button type="button" onclick="window.location.href='adminhome.jsp';">Back</button>
</form>

    <h1>Manage Caretakers</h1>
    
    <a href="addCaretaker.jsp">Add New Caretaker</a>
    <a href="searchCaretaker.jsp">Search Caretaker</a>
    
    <%
        if(session == null || session.getAttribute("Admin")==null) {
            response.sendRedirect("login.jsp");
            return;
        }
        else{ 
            Admins admin = (Admins)session.getAttribute("Admin");
        }               
            
    %>
    
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
        </tr>
        
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
                String query = "SELECT * FROM CARETAKERS";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();
                
                while (rs.next()) {    
        %>
        
        <tr> 
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("NAME") %></td>
            <td><%= rs.getString("EMAIL") %></td>
            <td><%= rs.getString("PHONE") %></td>
            <td><%= rs.getString("ROLE") %></td>
            <td><%= rs.getBoolean("STATUS") ? "Active" : "Inactive" %></td>
            <td>
                <a href="editCaretaker.jsp?id=<%= rs.getInt("ID") %>">Edit</a>
                <a href="DeleteCaretakerServlet?id=<%= rs.getInt("ID") %>" onclick="return confirm('Are you sure you want to delete this caretaker?');">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                out.println("Error retrieving caretaker records: " + e.getMessage());
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
    </table>
    
</body>
</html>
