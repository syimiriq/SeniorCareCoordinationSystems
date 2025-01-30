<%-- 
    Document   : searchSenior
    Created on : Jan 20, 2025, 1:39:55 AM
    Author     : user
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<html>
<head>
    <title>Search Senior</title>
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
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
        }
        .table-container {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .form-group {
            margin-bottom: 15px;
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
        <button type="button" class="button" onclick="window.location.href='senior.jsp';">Back</button>
    </form>
    <div class="container">
        
    <div class="header">
    
    <h1>Search Senior</h1>
    </div>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p style="color:red;"><%= error %></p>
    <%
        }
    %>
    
    <form action="SearchSeniorServlet" method="get">
        <label for="searchField">Search senior by Name:</label>
        <input type="text" name="query" id="searchField" required>
        <button type="submit" class="button">Search</button>
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
            <th>Gender</th>
            <th>Date of Birth</th>
            <th>Guardian ID</th>
           
        </tr>
        <% for (Map<String, Object> senior : searchResults) { %>
        <tr>
            <td><%= senior.get("ID") %></td>
            <td><%= senior.get("NAME") %></td>
            <td><%= senior.get("GENDER") %></td>
            <td><%= senior.get("DATEOFBIRTH") %></td>
            <td><%= senior.get("GUARDIANID") %></td>

        </tr>
        <% } %>
    </table>
    <% } else if (searchResults != null) { %>
    <p>No results found.</p>
    <% } %>
    </div>
</body>
</html>
