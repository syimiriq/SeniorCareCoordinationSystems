<%-- 
    Document   : welcome
    Created on : Dec 9, 2024, 9:09:57 AM
    Author     : Syamir
--%>

<%@page import="com.scc.model.Caretakers"%>
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
               
            if(session == null || session.getAttribute("Caretaker")==null) {
                response.sendRedirect("login.jsp");
                return;
            }
            else{
                       Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
                        %>

                        <h1>Welcome, <%= caretaker.getName()%>!</h1>
    <%
    }
    %>
        
    <a href="senior.jsp">Manage Senior</a>
    <a href="guardian.jsp">Manage Guardian</a>
    

        <form action="LogoutServlet" method="get">
            <br>
        <button type="submit">Logout</button>
    </form>
</body>
</html>