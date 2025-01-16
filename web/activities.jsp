<%-- 
    Document   : Activities
    Created on : Jan 12, 2025, 1:47:24 AM
    Author     : NITRO
--%>
<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Activities"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Activities</title>
    </head>
    <body>
        <h1>Manage Activities</h1>
        <a href="searchActivities.jsp" src="">Search Activities</a>
        <table border="1">
        <tr>
            <th>Activities ID</th>
            <th>Activities Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Location</th>
        </tr>
        <% 
            
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
                String query = "SELECT * FROM ACTIVITIES";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();
                
                while (rs.next()) {    
      
           
        %>
        <tr>
            <td><%= rs.getInt("ID") %></td>
            <td><%= rs.getString("NAME") %></td>
            <td><%= rs.getString("TYPE") %></td>
            <td><%= rs.getString("DESCRIPTION") %></td>
            <td><%= rs.getString("LOCATION") %></td>
            <td>
                <a href="editActivities.jsp?id=<%= rs.getInt("ID") %>">Edit</a>
                <a href="deleteActivities.jsp?id=<%= rs.getInt("ID") %>">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                out.println("Error retrieving activity records: " + e.getMessage());
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
        <button type="button" onclick="location.href='addActivities.jsp'">Add New Acitivites</button>
    </body>
</html>
