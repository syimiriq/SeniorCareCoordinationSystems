<%-- 
    Document   : searchCaretaker
    Created on : Jan 15, 2025, 11:53:37 PM
    Author     : Ichiro
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Caretakers</title>
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
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Search Caretakers</h1>
            <button class="button" onclick="window.location.href='caretakers.jsp';">Back</button>
        </div>
        
        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <p style="color:red;"><%= error %></p>
        <% } %>
        
        <form action="SearchCaretakerServlet" method="get">
            <div class="form-group">
                <label for="searchField">Search by Name, Email, or Role:</label>
                <input type="text" name="query" id="searchField" required>
                <button type="submit" class="button">Search</button>
            </div>
        </form>
        
        <div class="table-container">
            <% List<Map<String, Object>> searchResults = (List<Map<String, Object>>) request.getAttribute("results"); %>
            <% if (searchResults != null && !searchResults.isEmpty()) { %>
                <h2>Search Results</h2>
                <table>
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
        </div>
    </div>
</body>
</html>
