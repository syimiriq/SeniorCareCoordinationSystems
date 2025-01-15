<%-- 
    Document   : searchCaretaker
    Created on : Jan 15, 2025, 11:53:37 PM
    Author     : Ichiro
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
<head>
    <title>Search Caretakers</title>
</head>
<body>
    <h1>Search Caretakers</h1>
    
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>
    
    <form action="SearchCaretakerServlet" method="get">
        <label for="searchField">Search by Name, Email, or Role:</label>
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
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
        </tr>
        <% for (Map<String, Object> caretaker : searchResults) { %>
        <tr>
            <td><%= caretaker.get("ID") %></td>
            <td><%= caretaker.get("NAME") %></td>
            <td><%= caretaker.get("EMAIL") %></td>
            <td><%= caretaker.get("PHONE") %></td>
            <td><%= caretaker.get("ROLE") %></td>
            <td><%= (Boolean) caretaker.get("STATUS") ? "Active" : "Inactive" %></td>
        </tr>
        <% } %>
    </table>
    <% } else if (searchResults != null) { %>
    <p>No results found.</p>
    <% } %>
</body>
</html>
