/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

import com.scc.model.Schedules;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "DeleteScheduleServlet", urlPatterns = {"/DeleteScheduleServlet"})
public class DeleteScheduleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String actID = request.getParameter("actID");  // Activity ID
            String senID = request.getParameter("senID");  // Senior ID
            String starttimeStr = request.getParameter("starttime");  // Start time as a String

            // Check if any value is missing
            if (actID == null || senID == null || starttimeStr == null) {
                response.getWriter().println("Error: Missing parameter(s).");
                return;
            }

            try {
                // Convert the starttime string to a Timestamp
                Timestamp starttime = Timestamp.valueOf(starttimeStr); // Convert the string to Timestamp

                // Now, you can use these values to delete the schedule from the database
                boolean deletionSuccess = Schedules.deleteSchedule(Integer.parseInt(actID), Integer.parseInt(senID), starttime);

                // Handle the result (success or failure)
                if (deletionSuccess) {
                    // Redirect back to the schedule management page or show a success message
                    response.sendRedirect("scheduleSenior.jsp?id=" + senID);
                } else {
                    // If deletion failed, show an error message
                    response.getWriter().println("Error: Could not delete the schedule.");
                }
            } catch (IllegalArgumentException e) {
                // Handle any invalid value issues
                response.getWriter().println("Error: Invalid parameter(s) format.");
            } catch (Exception e) {
                // Log the exception
                e.printStackTrace();
                response.getWriter().println("Error: An unexpected error occurred.");
            }

    }
        
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
