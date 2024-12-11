/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;

/**
 *
 * @author Syamir
 */
import com.scc.model.Admins;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Verify credentials
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "SELECT * FROM admins WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    String storedPassword = rs.getString("password");

                    // Verify hashed password
                    if (BCrypt.checkpw(password, storedPassword)) {
                        // Create session for user
                        HttpSession session = request.getSession();
                        session.setAttribute("username", username);
                        response.sendRedirect("home.jsp"); // Redirect to home page after successful login
                    } else {
                        response.sendRedirect("login.jsp?error=invalid"); // Invalid credentials
                    }
                } else {
                    response.sendRedirect("login.jsp?error=notfound"); // User not found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        Admins admin = new Admins();
//        admin.setUsername(username);
//        admin.setPassword(password);
//
//        // For now, simply forward to a success page
//        request.setAttribute("admin", admin);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
//        dispatcher.forward(request, response);
    }
}
