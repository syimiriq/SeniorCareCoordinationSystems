<%-- 
    Document   : senior
    Created on : Jan 17, 2025, 1:09:02 AM
    Author     : user
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Caretakers"%>

<html>
<head>
    <title>Manage Senior</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
            color: #333;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            margin: 10px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
        }
        .button:hover {
            background-color: #555;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        td a {
            color: #333;
            font-weight: bold;
            text-decoration: none;
            margin-right: 10px;
        }
        td a:hover {
            color: #555;
        }
    </style>
</head>
<body>
    
<form>
    <button type="button" class="button" onclick="window.location.href='home.jsp';">Back</button>
</form>
    <div class="container">
    <div class="header">
    <h1>Manage Senior</h1>
    
    <a href="addSenior.jsp" class="button">Add New Senior</a>
    <a href="searchSenior.jsp" class="button">Search Senior</a>
    </div>
    <%
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        } else {
            Caretakers caretaker = (Caretakers) session.getAttribute("Caretaker");
        }
    %>

    
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Gender</th>
        <th>Age</th>
        <th>Guardian</th>
        <th>Actions</th>
    </tr>

    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
            String query = "SELECT s.ID, s.NAME, s.GENDER, s.DATEOFBIRTH, g.NAME AS GUARDIAN_NAME " +
                           "FROM SENIORS s " +
                           "LEFT JOIN GUARDIANS g ON s.GUARDIANID = g.ID";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("NAME");
                String gender = rs.getString("GENDER");
                String dobString = rs.getString("DATEOFBIRTH");
                String guardianName = rs.getString("GUARDIAN_NAME"); // Guardian name or NULL

                LocalDate dob = LocalDate.parse(dobString);
                LocalDate currentDate = LocalDate.now();
                int age = Period.between(dob, currentDate).getYears();
    %>

    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= gender %></td>
        <td><%= age %> years</td>
        <td><%= (guardianName != null) ? guardianName : "None" %></td>  <!-- Display Guardian or 'None' -->
        <td>
            <a href="editSenior.jsp?id=<%= id %>">Edit</a>
            <a href="DeleteSeniorServlet?id=<%= id %>" onclick="return confirm('Delete <%= name %> senior?');">Delete</a>
        </td>
    </tr>

    <%
            }
        } catch (SQLException e) {
            out.println("Error retrieving senior records: " + e.getMessage());
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
</div>
</body>
</html>

