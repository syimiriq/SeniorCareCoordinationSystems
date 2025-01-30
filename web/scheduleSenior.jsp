<%@page import="com.scc.model.Seniors"%>
<%@page import="com.scc.model.Caretakers"%>
<%@page import="java.util.List"%>
<%@page import="com.scc.model.Schedules"%>
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
    // Fetch the list of seniors
    List<Schedules> scheduleList = Schedules.getAllSchedules(seniorid);
    Seniors senior = Seniors.getSeniorById(seniorid);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Schedule</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                padding: 20px;
                margin: 0;
                background-color: #f4f4f9;
            }

            h1 {
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tr:hover {
                background-color: #ddd;
            }

            .button {
                padding: 10px 20px;
                margin: 10px;
                text-decoration: none;
                background-color: #4CAF50;
                color: white;
                border-radius: 5px;
                font-size: 16px;
            }

            .button:hover {
                background-color: #45a049;
            }

            .action-link {
                color: #007BFF;
                text-decoration: none;
            }

            .action-link:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <button type="button" class="button" onclick="location.href='schedule.jsp'">Back</button>
        <br><br>
        <a href="addSchedule.jsp?id=<%= senior.getID()%>" class="button">Add New Schedule</a>
        <h1>Manage Schedules for:</h1>
        <p><strong>SENIOR ID:</strong> <%= senior.getID() %> </p>
        <p><strong>NAME:</strong> <%= senior.getName() %></p>
        <p><strong>GENDER:</strong> <%= senior.getGender() %></p>
        <p><strong>DATE OF BIRTH:</strong> <%= senior.getDateOfBirth()%></p>

        <table>
            <thead>
                <tr>
                    <th>Activity Name</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Created At</th>
                    <th>Status</th>
                    <th>Person In Charge</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <% for (Schedules schedule : scheduleList) { %>
                <tr>
                    <td><%= schedule.activityName(schedule.getActivityid()) %></td>
                    <td><%= schedule.getStart_time() %></td>
                    <td><%= schedule.getEnd_time() %></td>
                    <td><%= schedule.getDate() %></td>
                    <td>
                        <%= schedule.getStatus() == false ? "<span style='color: red;'>In Progress</span>" : "<span style='color: green;'>Done</span>" %>
                    </td>

                    <td><%= schedule.caretakerName(schedule.getCaretakerid())%></td>
                    <td>
                        <% if(schedule.getStatus() == false) { %>
                           <form action="editScheduleServlet" method="POST">
                                <input type="hidden" name="actID" value="<%= schedule.getActivityid() %>">
                                <input type="hidden" name="senID" value="<%= senior.getID() %>">
                                <input type="hidden" name="starttime" value="<%= schedule.getStart_time() %>">
                                <input type="submit" value="Completed">
                            </form>
                            
                        <% } %>
                        <form action="DeleteScheduleServlet" method="POST">
                            <input type="hidden" name="actID" value="<%=schedule.getActivityid()%>">
                            <input type="hidden" name="senID" value="<%=senior.getID()%>">
                            <input type="hidden" name="starttime" value="<%=schedule.getStart_time()%>">
                            <input type="submit" value="DELETE">
                        </form>
                    </td>
                
                </tr>
               <% } %>
            </tbody>
        </table>
    </body>
</html>
