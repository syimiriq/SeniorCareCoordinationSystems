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
        <label for="admin">Administrator</label>
        <input type="radio" id="admin" name="userType" value="admin" required>
        <label for="caretaker">Caretaker</label>
        <input type="radio" id="caretaker" name="userType" value="caretaker" required><br><br>
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>
        <button type="submit">Login</button>
    </form>

    <div>
        <% if (request.getParameter("error") != null) { %>
            <p style="color:red;">Invalid username or password!</p>
        <% }
            else if(request.getParameter("invalidate") != null) { %>
            <p style="color:red;">Your account is not validated. If you had just recently registered wait for an administrator to validate your account!</p>
       <%
           }
       %>
    </div>
    <form action="register.jsp" method="get">
        <button type="submit">Register as a caretaker</button>
    </form>
</body>
</html>