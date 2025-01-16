/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;


public class AddCaretakerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("Admin")==null) {
            response.sendRedirect("login.jsp");
            return;
        }      

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = true; // default active status
        
        password = BCrypt.hashpw(password, BCrypt.gensalt());
        
        // Validate inputs
        if (name == null || email == null || phone == null || role == null || username == null || password == null) {
            response.getWriter().println("All fields are required!");
            return;
        }

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "INSERT INTO CARETAKERS (NAME, EMAIL, PHONE, USERNAME, PASSWORD, ROLE, STATUS) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, username);
            stmt.setString(5, password); // Hash the password in production
            stmt.setString(6, role); 
            stmt.setBoolean(7, status);
            stmt.executeUpdate();
            
            response.sendRedirect("caretakers.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while adding caretakers information.");
        }

        
    }
}
