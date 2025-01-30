<%@page import="java.util.List"%>
<%@page import="com.scc.model.Activities"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
    String seniorIdParam = request.getParameter("id");
    if (seniorIdParam == null) {
        out.println("<p style='color:red;'>Invalid senior ID.</p>");
        return;
    }
    int seniorid = Integer.parseInt(seniorIdParam);
    
    List<Activities> activityList = Activities.getAllActivities();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Schedule</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 350px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            width: 97%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group select {
            width: 103%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>

    </head>
    <body onload="setTimestamp()">
        
        
        <div class="container">
        <button class="button" type="button" onclick="location.href='scheduleSenior.jsp?id=<%=seniorid%>'">Back</button>
        <div class="header">
        <h1>Create New Schedule</h1>
        </div>
        <form action="addScheduleServlet" method="post">
            <input type="hidden" name="seniorID" value="<%=seniorid%>" required><br>

            <div class="form-group">
                <label>Activity ID:</label><br>
                <select name='activityID'>
                    <% for (Activities activity : activityList) { %>
                    <option value='<%=activity.getId()%>'><%=activity.getName()%></option>
                    <% } %>
                </select>
            </div>

            <div class="form-group">
                <label for="start">Start Time:</label>
                <input type="time" name="start" required><br>
            </div>

            <div class="form-group">
                <label for="end">End Time:</label>
                <input type="time" name="end" required><br>
            </div>

            <input type="hidden" name="caretakerID" value="<%= caretaker.getID() %>" required><br>

            <button class="button" type="submit">Add</button>
        </form>
        </div>
    </body>
</html>
