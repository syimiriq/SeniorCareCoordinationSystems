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
    </head>
    <body>
        <button type="button" onclick="location.href='activities.jsp'">Back</button>
       <h1>Edit Activity</h1>
    <form action="editActivityServlet" method="post">
        <input type="hidden" name="id" value="<%= activity.getId() %>">

        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= activity.getName() %>" required><br>

        <label for="type">Type:</label>
        <input type="text" name="type" value="<%= activity.getType() %>" required><br>

        <label for="description">Description:</label>
        <input type="text" name="description" value="<%= activity.getDescription() %>" required><br>

        <label for="location">Location:</label>
        <input type="text" name="location" value="<%= activity.getLocation() %>" required><br>

        <button type="submit">Save Changes</button>
    </form>
    </body>
</html>
