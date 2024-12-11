<%-- 
    Document   : welcome
    Created on : Dec 9, 2024, 9:09:57 AM
    Author     : Syamir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
</head>
<body>
            <%
            if(session == null || session.getAttribute("username")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
            %>
    <h1>Welcome, <%= session.getAttribute("username") %>!</h1>
        <form action="LogoutServlet" method="get">
        <button type="submit">Logout</button>
    </form>
</body>
</html>