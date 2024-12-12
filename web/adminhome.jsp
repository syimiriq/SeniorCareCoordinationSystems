<%-- 
    Document   : welcome
    Created on : Dec 9, 2024, 9:09:57 AM
    Author     : Syamir
--%>

<%@page import="com.scc.model.Admins"%>
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
            if(session == null || session.getAttribute("Admin")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                        Admins admin = (Admins)session.getAttribute("Admin");
                        
            
            %>
    <h1>Welcome, <%= admin.getUsername()%></h1>
    <%
    }
    %>
        
    

        <form action="LogoutServlet" method="get">
        <button type="submit">Logout</button>
    </form>
</body>
</html>