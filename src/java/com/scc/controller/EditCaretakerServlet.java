/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Ichiro
 */


@WebServlet("/EditCaretakerServlet")
public class EditCaretakerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("Admin")==null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            
            System.out.println("ID: " + id);
            System.out.println("Name: " + name);
            System.out.println("Email: " + email);
            System.out.println("Phone: " + phone);
            System.out.println("Username: " + username); 
            System.out.println("Password: " + password); 
            System.out.println("Status: " + status); 
            
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
            String sql = "UPDATE CARETAKERS SET NAME = ?, EMAIL = ?, PHONE = ?, USERNAME = ? PASSWORD = ? ROLE = ? STATUS = ? WHERE ID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, username);
            stmt.setString(5, password); // Hash the password in production
            stmt.setString(6, role); 
            stmt.setBoolean(7, status);
            stmt.executeUpdate();
            
            conn.close();   
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        response.sendRedirect("caretakers.jsp");
    }
}

