package com.scc.controller;

import com.scc.model.Seniors;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditSeniorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Check session for authentication
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Retrieve input parameters from the request
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dateOfBirth = request.getParameter("dateofbirth");
            int guardianID = Integer.parseInt(request.getParameter("guardianID"));

            // Load the senior data using the ID
            Seniors senior = Seniors.getSeniorById(id);
            if (senior == null) {
                response.getWriter().println("Error: Senior not found.");
                return;
            }

            // Update the senior's properties
            senior.setName(name);
            senior.setGender(gender);
            senior.setDateOfBirth(dateOfBirth);
            senior.setGuardianID(guardianID);

            // Save the updated senior back to the database
            boolean success = senior.update();
            if (!success) {
                response.getWriter().println("Error: Failed to update senior.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        // Redirect to seniors management page
        response.sendRedirect("seniors.jsp");
    }
}
