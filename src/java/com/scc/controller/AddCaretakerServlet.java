package com.scc.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

public class AddCaretakerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // **Ensure Admin is logged in**
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }      

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = true; // Active by default
        
        // Hash the password
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Validate inputs
        if (name == null || email == null || phone == null || role == null || username == null || password == null) {
            request.setAttribute("errorMessage", "All fields are required!");
            request.getRequestDispatcher("addCaretaker.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {

            // **Check if username already exists**
            String checkQuery = "SELECT * FROM caretakers WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // **Username exists, redirect back with an error message**
                request.setAttribute("errorMessage", "Username already exists! Please choose another.");
                request.getRequestDispatcher("addCaretaker.jsp").forward(request, response);
            } else {
                // **Username is unique, proceed with insertion**
                String query = "INSERT INTO caretakers (name, email, phone, username, password, role, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, name);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, username);
                stmt.setString(5, hashedPassword);
                stmt.setString(6, role);
                stmt.setBoolean(7, status);
                stmt.executeUpdate();

                // **Redirect to caretakers list after successful addition**
                response.sendRedirect("caretakers.jsp?success=1");
            }

            // Close resources
            rs.close();
            checkStmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<html><body><h2>Error: " + e.getMessage() + "</h2></body></html>");
        }
    }
}
