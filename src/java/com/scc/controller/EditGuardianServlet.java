package com.scc.controller;

import com.scc.model.Guardians;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EditGuardianServlet extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Retrieve input parameters from the request
            int ID = Integer.parseInt(request.getParameter("ID")); // Ensure it matches the form field name
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String dateOfBirth = request.getParameter("dateOfBirth"); // Ensure it matches the form field name

            // Load the guardian data using the ID
            Guardians guardian = Guardians.getGuardianById(ID);
            if (guardian == null) {
                response.getWriter().println("Error: Guardian not found.");
                return;
            }

            // Update the guardian's properties
            guardian.setName(name);
            guardian.setPhone(phone);
            guardian.setGender(gender);
            guardian.setAddress(address);
            guardian.setDateOfBirth(dateOfBirth);

            // Save the updated guardian back to the database
            boolean success = guardian.update();
            if (!success) {
                response.getWriter().println("Error: Failed to update guardian.");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        // Redirect to guardians management page
        response.sendRedirect("guardian.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
