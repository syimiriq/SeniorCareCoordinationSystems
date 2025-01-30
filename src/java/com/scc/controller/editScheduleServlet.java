
package com.scc.controller;

import com.scc.model.Schedules;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class editScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 // Get the parameters from the request
        String actID = request.getParameter("actID");  // Activity ID
        String senID = request.getParameter("senID");  // Senior ID
        String starttimeStr = request.getParameter("starttime");  // Start time
        
        // Optionally, print the received parameters for debugging
        System.out.println("Activity ID: " + actID);
        System.out.println("Senior ID: " + senID);
        System.out.println("Start Time: " + starttimeStr);

        // Validate the parameters
        if (actID == null || senID == null || starttimeStr == null) {
            response.getWriter().println("Error: Missing parameter(s).");
            return;
        }

        try {
            // Convert the starttime string to a Timestamp
            Timestamp starttime = Timestamp.valueOf(starttimeStr);  // Assuming the starttime format is valid

            // Call the method to update the status of the schedule in the database
            boolean updateSuccess = Schedules.updateScheduleStatus(Integer.parseInt(actID), Integer.parseInt(senID), starttime);

            // Redirect or show appropriate response
            if (updateSuccess) {
                // Redirect back to the manage schedule page
                response.sendRedirect("scheduleSenior.jsp?id=" + senID);
            } else {
                // Handle the failure case
                response.getWriter().println("Error: Could not update schedule status.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: An unexpected error occurred.");
        }
    }
}