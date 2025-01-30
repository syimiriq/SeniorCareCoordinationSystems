package com.scc.controller;

import com.scc.model.Caretakers;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

        // Check if Admin is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Get caretaker details from the form
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone"); // FIXED: Changed from int to String
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean status = "true".equals(request.getParameter("status")); // FIXED: Correct Boolean conversion

            // Load caretaker object from DB
            Caretakers caretaker = Caretakers.getCaretakerById(id);
            if (caretaker == null) {
                response.getWriter().println("Error: Caretaker not found.");
                return;
            }

            // **Check if the new username is already taken (except for the current caretaker)**
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
                String checkUsernameQuery = "SELECT ID FROM CARETAKERS WHERE USERNAME = ? AND ID <> ?";
                PreparedStatement checkStmt = conn.prepareStatement(checkUsernameQuery);
                checkStmt.setString(1, username);
                checkStmt.setInt(2, id);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    response.getWriter().println("<script>alert('Username already exists! Please choose another.'); window.history.back();</script>");
                    return;
                }
            }

            // Update fields
            caretaker.setName(name);
            caretaker.setEmail(email);
            caretaker.setPhone(phone);
            caretaker.setRole(role);
            caretaker.setUsername(username);
            caretaker.setStatus(status);

            // If new password is provided, hash and update it
            if (password != null && !password.trim().isEmpty()) {
                caretaker.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
            }

            // Save updated data
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

        // Redirect to caretaker management page
        response.sendRedirect("caretakers.jsp");
    }
}
