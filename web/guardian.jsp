<%-- 
    Document   : guardian
    Created on : Jan 17, 2025, 2:14:25 AM
    Author     : user
--%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.sql.*"%>
<%@page import="com.scc.model.Caretakers"%>

<html>
<head>
    <title>Manage Guardian</title>
</head>
<body>
    
    <form>
        <button type="button" onclick="window.location.href='home.jsp';">Back</button>
    </form>
    
    <h1>Manage Guardians</h1>
    
    <a href="addGuardian.jsp">Add New Guardian</a>
    <a href="searchGuardian.jsp">Search Guardian</a>
    
    <%
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        } else {
            Caretakers caretaker = (Caretakers) session.getAttribute("Caretaker");
        }
    %>
    
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Age</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            try {
                // Database connection
                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
                
                // Query to fetch guardians
                String query = "SELECT * FROM GUARDIANS";
                stmt = conn.prepareStatement(query);
                rs = stmt.executeQuery();
                
                while (rs.next()) {
                    // Fetch guardian data
                    int id = rs.getInt("ID");
                    String name = rs.getString("NAME");
                    String gender = rs.getString("GENDER");
                    String phone = rs.getString("PHONE");
                    String dobString = rs.getString("DATEOFBIRTH"); // Assuming "YYYY-MM-DD" format
                    
                    // Parse the date of birth to calculate age
                    LocalDate dob = LocalDate.parse(dobString);
                    LocalDate currentDate = LocalDate.now();
                    int age = Period.between(dob, currentDate).getYears();
        %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= gender %></td>
                <td><%= age %> years</td>
                <td><%= phone %></td>
                <td>
                    <a href="editGuardian.jsp?id=<%= id %>">Edit</a>
                    <a href="DeleteGuardianServlet?id=<%= id %>" 
                       onclick="return confirm('Are you sure you want to delete this guardian?');">Delete</a>
                </td>
            </tr>
        <%
                }
            } catch (SQLException e) {
                // Display error message in case of issues with database retrieval
                out.println("<tr><td colspan='6'>Error retrieving guardian records: " + e.getMessage() + "</td></tr>");
            } finally {
                // Close resources to prevent memory leaks
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        </tbody>
    </table>
</body>
</html>



