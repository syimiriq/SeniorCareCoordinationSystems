<%-- 
    Document   : welcome
    Created on : Dec 9, 2024, 9:09:57 AM
    Author     : Syamir
--%>

<%@page import="com.scc.model.Caretakers"%>
<%@page import="com.scc.model.Seniors"%>
<%@page import="com.scc.model.Guardians"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
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
        
    <a href="senior.jsp" class="button">Manage Senior</a>
    <a href="guardian.jsp" class="button">Manage Guardian</a>
    <a href="medicalReport.jsp" class="button">Take Medical Report for today</a>
    <a href="activities.jsp" class="button">Manage Activity</a>
    <a href="schedule.jsp" class="button">Manage Schedule</a>
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
        <h2>Total Seniors</h2>
            <%
                int totalSeniors = Seniors.getAllSeniors().size();
            %>
            <p><%= totalSeniors %></p>
        </div>
        <div class="card">
        <h2>Total Guardians</h2>
            <%
                int totalGuardians = Guardians.getAllGuardians().size();
            %>
            <p><%= totalGuardians %></p>
        </div>
    </div>
      <form action="LogoutServlet" method="get">
            <button type="submit" class="button">Logout</button>
        </form>   
    </div>
        
</body>
</html>