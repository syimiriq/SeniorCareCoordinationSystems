<%-- 
    Document   : searchSchedule
    Created on : Jan 28, 2025, 6:20:49 PM
    Author     : NITRO
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>


<html>
<head>
    <title>Search Schedules</title>
</head>
<body>
    <button type="button" onclick="location.href='schedule.jsp'">Back</button>
    <h1>Search Schedules</h1>
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
    
    <form action="SearchSchedulesServlet" method="get">
        <label for="searchField">Search by name:</label><br>
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
            <th>Activity ID</th>
            <th>Senior ID</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Date</th>
            <th>Status</th>
            <th>Caretaker ID</th>
        </tr>
        <% for (Map<String, Object> schedules : searchResults) { %>
        <tr>
            <td><%= schedules.get("ID") %></td>
            <td><%= schedules.get("ID") %></td>
            <td><%= schedules.get("START_TIME") %></td>
            <td><%= schedules.get("END_TIME") %></td>
            <td><%= schedules.get("DATE") %></td>
            <td><%= schedules.get("STATUS") %></td>
            <td><%= schedules.get("ID") %></td>
       
        </tr>
        <% } %>
    </table>
    <% } else if (searchResults != null) { %>
    <p>No results found.</p>
    <% } %>
</body>
</html>
