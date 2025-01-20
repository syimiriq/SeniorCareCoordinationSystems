<%-- 
    Document   : searchActivities
    Created on : Jan 16, 2025, 9:58:02 PM
    Author     : NITRO
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>


<html>
<head>
    <title>Search Activities</title>
</head>
<body>
    <button type="button" onclick="location.href='activities.jsp'">Back</button>
    <h1>Search Activities</h1>
     <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>
    
    <form action="SearchActivitiesServlet" method="get">
        <label for="searchField">Search by Name or Type:</label><br>
        <input type="text" name="query" id="searchField" required>
        <button type="submit">Search</button>
    </form>

    <%
        // Retrieve search results (if any) from the request attribute
        List<Map<String, Object>> searchResults = (List<Map<String, Object>>) request.getAttribute("results");

        if (searchResults != null && !searchResults.isEmpty()) {
    %>
    <h2>Search Results</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Description</th>
            <th>Location</th>
        </tr>
        <% for (Map<String, Object> actitivities : searchResults) { %>
        <tr>
            <td><%= actitivities.get("ID") %></td>
            <td><%= actitivities.get("NAME") %></td>
            <td><%= actitivities.get("TYPE") %></td>
            <td><%= actitivities.get("DESCRIPTION") %></td>
            <td><%= actitivities.get("LOCATION") %></td>
       
        </tr>
        <% } %>
    </table>
    <% } else if (searchResults != null) { %>
    <p>No results found.</p>
    <% } %>
</body>
</html>
