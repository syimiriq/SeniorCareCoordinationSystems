<%-- 
    Document   : searchGuardian
    Created on : Jan 20, 2025, 9:13:55 AM
    Author     : User
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
<head>
    <title>Search Guardian</title>
</head>
<body>
    <form>
        <button type="button" onclick="window.location.href='guardian.jsp';">Back</button>
    </form>
    <h1>Search Guardians</h1>
    
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>
    
    <form action="SearchGuardianServlet" method="get">
        <label for="searchField">Search by Name:</label>
        <input type="text" name="query" id="searchField" required>
        <button type="submit">Search</button>
    </form>

    <%
        // Retrieve search results (if any) from the request attribute
        List<Map<String, Object>> searchResults = (List<Map<String, Object>>) request.getAttribute("results");

        if (searchResults != null && !searchResults.isEmpty()) {
    %>
    <h2>Search Results</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Address</th>
            
        </tr>
        <% for (Map<String, Object> senior : searchResults) { %>
        <tr>
            <td><%= senior.get("ID") %></td>
            <td><%= senior.get("NAME") %></td>
            <td><%= senior.get("PHONE") %></td>
            <td><%= senior.get("GENDER") %></td>
            <td><%= senior.get("DATEOFBIRTH") %></td>
            <td><%= senior.get("ADDRESS") %></td>
          
        </tr>
        <% } %>
    </table>
    <% } else if (searchResults != null) { %>
    <p>No results found.</p>
    <% } %>
</body>
</html>
