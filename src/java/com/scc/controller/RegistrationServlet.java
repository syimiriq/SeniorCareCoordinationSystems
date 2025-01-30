package com.scc.controller;

import org.mindrot.jbcrypt.BCrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = false;
        
        // Hash the password for storage
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); 

        // Database connection
        try (PrintWriter out = response.getWriter()) {
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");

            // **Check if username already exists**
            String checkQuery = "SELECT * FROM caretakers WHERE username = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, username);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // **Username exists, redirect back with an error message**
                request.setAttribute("errorMessage", "Username already exists! Please choose another.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
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

                // **Redirect to login page after successful registration**
                response.sendRedirect("login.jsp?success=1");
            }

            // Close connections
            rs.close();
            checkStmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<html><body><h2>Error: " + e.getMessage() + "</h2></body></html>");
        }
    }
}
