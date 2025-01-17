<%-- 
    Document   : welcome
    Created on : Dec 9, 2024, 9:09:57 AM
    Author     : Syamir, Ichiro
--%>

<%@page import="java.util.List"%>
<%@page import="com.scc.model.Admins"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;  /* White background */
            color: #333;  /* Dark text for contrast */
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
            background-color: #333;  /* Black background */
            color: #fff;  /* White text */
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            border: none;
        }
        .button:hover {
            background-color: #555;  /* Dark gray when hovered */
        }
        .card {
            background-color: #fff;  /* White background for cards */
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #ccc;  /* Light gray border */
            margin: 10px 0;
            display: inline-block;
            width: 28%;
            text-align: center;
            box-sizing: border-box;
        }
        .card h2 {
            color: #333;  /* Dark text for headings */
        }
        .card p {
            font-size: 1.2em;
            color: #333;  /* Dark text for values */
        }
        .dashboard {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .dashboard .card {
            width: 32%;  /* Adjust card width for three columns */
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <%
            if(session == null || session.getAttribute("Admin") == null) {
                response.sendRedirect("login.jsp");
                return;
            } else {
                Admins admin = (Admins)session.getAttribute("Admin");
        %>
        <h1>Welcome, <%= admin.getUsername() %></h1>
        <%
            }
        %>

        <a href="caretakers.jsp" class="button">Manage Caretakers</a> 
        
    </div>

    <div class="dashboard">
        <div class="card">
            <h2>Total Caretakers</h2>
            <%
                int totalCaretakers = Caretakers.getAllCaretakers().size();
            %>
            <p><%= totalCaretakers %></p>
        </div>

        <div class="card">
            <h2>Active Caretakers</h2>
            <%
                int activeCaretakers = 0;
                List<Caretakers> caretakersList = Caretakers.getAllCaretakers();
                for(Caretakers caretaker : caretakersList) {
                    if(caretaker.getStatus()) {
                        activeCaretakers++;
                    }
                }
            %>
            <p><%= activeCaretakers %></p>
        </div>

        <div class="card">
            <h2>Inactive Caretakers</h2>
            <%
                int inactiveCaretakers = totalCaretakers - activeCaretakers;
            %>
            <p><%= inactiveCaretakers %></p>
        </div>
    </div>
        <div>    
        <form action="LogoutServlet" method="get">
            <button type="submit" class="button">Logout</button>
        </form>
    </div>

</div>
     
        
</body>
</html>
