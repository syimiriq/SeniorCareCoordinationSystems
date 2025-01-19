/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

import com.scc.model.Guardians;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author user
 */
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
            int ID = Integer.parseInt(request.getParameter("ID"));
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String dateOfBirth = request.getParameter("dateOfBirth");

            // Load the caretaker data using the ID
            Guardians guardian = Guardians.getGuardianById(ID);
            if (guardian == null) {
                response.getWriter().println("Error: Caretaker not found.");
                return;
            }

            // Update the caretaker's properties
            guardian.setName(name);
            guardian.setPhone(phone);
            guardian.setGender(gender);
            guardian.setAddress(address);
            guardian.setDateOfBirth(dateOfBirth);

            // Save the updated caretaker back to the database
            boolean success = guardian.update();
            if (!success) {
                response.getWriter().println("Error: Failed to update caretaker.");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        // Redirect to caretakers management page
        response.sendRedirect("guardian.jsp");
    }
        
        

}
