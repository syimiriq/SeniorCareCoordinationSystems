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
import com.scc.model.Caretakers;
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
        String userType = request.getParameter("userType");
        HttpSession session = request.getSession();
        
        if(userType.equals("admin")){
        // Verify credentials
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "SELECT * FROM admins WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    int ID = rs.getInt("ID");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String storedPassword = rs.getString("password");
                    
                    // Verify hashed password
                    if (BCrypt.checkpw(password, storedPassword)) {
                        // Create session for user
                        Admins admin = new Admins(ID,username,email,role);
//                        HttpSession session = request.getSession();
                        session.setAttribute("Admin", admin);
                        response.sendRedirect("adminhome.jsp"); // Redirect to home page after successful login
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
        }
        else if(userType.equals("caretaker")){
                   // Verify credentials
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "SELECT * FROM caretakers WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    int ID = rs.getInt("ID");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    int phone = rs.getInt("phone");
                    String role = rs.getString("role");
                    boolean status = rs.getBoolean("status");
                    String storedPassword = rs.getString("password");
                    // Verify hashed password
                    if (BCrypt.checkpw(password, storedPassword)) {
                     Caretakers caretaker = new Caretakers(ID,name,email,phone,username,role,status);
                     if(caretaker.getStatus()==true){
                     session.setAttribute("Caretaker", caretaker);
                     response.sendRedirect("home.jsp");// Redirect to home page after successful login
                     }
                     else{
                         response.sendRedirect("login.jsp?invalidate=account invalidated ");
                     }
                    } 
                    else {
                        response.sendRedirect("login.jsp?error=invalid"); // Invalid credentials
                    }
                } else {
                    response.sendRedirect("login.jsp?error=notfound"); // User not found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        }

    }
}
