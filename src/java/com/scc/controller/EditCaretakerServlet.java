package com.scc.controller;

import com.scc.model.Caretakers;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;




public class EditCaretakerServlet extends HttpServlet {
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
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            int phone = Integer.parseInt(request.getParameter("phone"));
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));

            // Load the caretaker data using the ID
            Caretakers caretaker = Caretakers.getCaretakerById(id);
            if (caretaker == null) {
                response.getWriter().println("Error: Caretaker not found.");
                return;
            }

            // Update the caretaker's properties
            caretaker.setName(name);
            caretaker.setEmail(email);
            caretaker.setPhone(phone);
            caretaker.setRole(role);
            caretaker.setUsername(username);
            caretaker.setStatus(status);

            // If a new password is provided, hash it; otherwise, retain the current password
            if (password != null && !password.isEmpty()) {
                password = BCrypt.hashpw(password, BCrypt.gensalt());
                caretaker.setPassword(password);
            }

            // Save the updated caretaker back to the database
            boolean success = caretaker.update();
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
        response.sendRedirect("caretakers.jsp");
    }
}
