<%-- 
    Document   : addCaretaker
    Created on : Jan 8, 2025, 10:05:43 AM
    Author     : Ichiro
--%>

<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Admins"%>
<%
    int caretakerCount = 0;
    int seniorCount = 0;

    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
        // Count caretakers
        PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) AS count FROM CARETAKERS");
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            caretakerCount = rs.getInt("count");
        }
        
        // Count seniors
        stmt = conn.prepareStatement("SELECT COUNT(*) AS count FROM SENIORS");
        rs = stmt.executeQuery();
        if (rs.next()) {
            seniorCount = rs.getInt("count");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h1>Dashboard</h1>
    <p>Number of Caretakers: <%= caretakerCount %></p>
    <p>Number of Seniors: <%= seniorCount %></p>
    <a href="caretakers.jsp">Manage Caretakers</a>
</body>
</html>
