<%-- 
    Document   : editActivities
    Created on : Jan 19, 2025, 12:27:37 AM
    Author     : NITRO
--%>

<%@page import="com.scc.model.Caretakers"%>
<%@page import="com.scc.model.Activities"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    if (session == null || session.getAttribute("Caretaker") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Caretakers caretaker = (Caretakers)session.getAttribute("Caretaker");
    String activityIdParam = request.getParameter("id");
    if (activityIdParam == null) {
        out.println("<p style='color:red;'>Invalid activity ID.</p>");
        return;
    }

    
    int activityid = Integer.parseInt(activityIdParam);
    Activities activity = Activities.getActivityById(activityid);

    if (activity == null) {
        out.println(activity);
        out.println("<p style='color:red;'>No activity found for the provided ID.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Edit Activity</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }
        .container {
            max-width: 400px;
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
        .error {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
    </head>
    <body>
        <div class="container">
            <button class="button" type="button" onclick="location.href='activities.jsp'">Back</button>
            <div class="header">
        
       <h1>Edit Activity</h1>
            </div>
    <form action="editActivityServlet" method="post">
        <input type="hidden" name="id" value="<%= activity.getId() %>">
        <div class="form-group">
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= activity.getName() %>" required><br>
        </div>
        <div class="form-group">
        <label  for="type">Type:</label>
        <input type="text" name="type" value="<%= activity.getType() %>" required><br>
        </div>
        <div class="form-group">
        <label for="description">Description:</label>
        <input type="text" name="description" value="<%= activity.getDescription() %>" required><br>
        </div>
        <div class="form-group">
        <label  for="location">Location:</label>
        <input type="text" name="location" value="<%= activity.getLocation() %>" required><br>
        </div>
        <button type="submit" class="button">Save Changes</button>
    </form>
        </div>
    </body>
</html>
