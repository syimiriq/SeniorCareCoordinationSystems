<%-- 
    Document   : register
    Created on : Dec 11, 2024, 12:03:36 PM
    Author     : Syamir
--%>

<%@page import="com.scc.model.Admins"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
                <%--
            if(session == null || session.getAttribute("Admin")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
//           else{
//                        Admins admin = (Admins)session.getAttribute("Admin");

    --%>
    <form action="RegistrationServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" required><br><br>
        <label for="email">Email:</label>
        <input type="email" name="email" required><br><br>
        <label for="phone">Phone:</label>
        <input type="number" name="phone" required><br><br>
        <label for="username">Username:</label>
        <input type="text" name="username" required><br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" required><br><br>
        <label for="role">Role:</label>
        <input type="text" name="role" required><br><br>
        <button type="submit">Register</button>
    </form>

    <form action="login.jsp" method="get">
        <button type="submit">Back to Login</button>
    </form>
</body>
</html>