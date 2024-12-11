<%-- 
    Document   : login
    Created on : Dec 9, 2024, 9:05:36 AM
    Author     : Syamir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <form action="LoginServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>

    <form action="register.jsp" method="get">
        <button type="submit">Register</button>
    </form>

    <div>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid username or password!</p>
        <% } %>
    </div>
</body>
</html>