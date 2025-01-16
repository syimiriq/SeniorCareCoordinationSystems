<%-- 
    Document   : schedule
    Created on : Jan 12, 2025, 1:58:57 AM
    Author     : NITRO
--%>

<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Activities"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule</title>
    </head>
    <body>
        <table border="1">
        <tr>
            <th>Activities ID</th>
            <th>Senior ID</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Date</th>
            <th>Status</th>
            <th>Caretaker ID</th>
        </tr>
        <% 
            
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
                String query = "SELECT * FROM SCHEDULES";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();
                
                while (rs.next()) {    
      
           
        %>
        <%
                }
            } catch (SQLException e) {
                out.println("Error retrieving schedule records: " + e.getMessage());
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
        <button type="button" onclick="location.href='addSchedule.jsp'">Add New Schedule</button>
    </body>
</html>
