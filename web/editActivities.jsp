<%-- 
    Document   : editActivities
    Created on : Jan 19, 2025, 12:27:37 AM
    Author     : NITRO
--%>

<%@page import="com.scc.model.Activities"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>

<%
    /*if (session == null || session.getAttribute("Admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }*/

    String activityIdParam = request.getParameter("id");
    if (activityIdParam == null) {
        out.println("<p style='color:red;'>Invalid caretaker ID.</p>");
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
        <input type="hidden" name="id" value="<%= activity.getid() %>">

        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= activity.getname() %>" required><br>

        <label for="email">Email:</label>
        <input type="email" name="email" value="<%= activity.gettype() %>" required><br>

        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= activity.getdescription() %>" required><br>

        <label for="phone">Phone:</label>
        <input type="text" name="phone" value="<%= activity.getlocation() %>" required><br>

        <button type="submit">Save Changes</button>
    </form>
    </body>
</html>
