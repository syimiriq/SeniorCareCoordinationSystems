
package com.scc.controller;

import com.scc.model.Schedules;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

public class editScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Check session for authentication
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Retrieve input parameters from the request
            int activityid = Integer.parseInt(request.getParameter("activityid"));
            int seniorid = Integer.parseInt(request.getParameter("seniorid"));
            String start_time = request.getParameter("start_name");
            String end_time = request.getParameter("end_time");
            String date = request.getParameter("date");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            int caretakerid = Integer.parseInt(request.getParameter("caretakerid"));

            // Load the caretaker data using the ID
            Schedules schedule = Schedules.getScheduleById(activityid, seniorid, caretakerid);
            if (schedule == null) {
                response.getWriter().println("Error: activity not found.");
                return;
            }

            // Update the caretaker's properties
            schedule.setStart_time(start_time);
            schedule.setEnd_time(end_time);
            schedule.setDate(date);
            schedule.setStatus(status);

       

            // Save the updated caretaker back to the database
            boolean success = schedule.update();
            if (!success) {
                response.getWriter().println("Error: Failed to update schedule.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        // Redirect to caretakers management page
        response.sendRedirect("schedule.jsp");
    }
}