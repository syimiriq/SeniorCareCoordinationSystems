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
import javax.servlet.http.HttpSession;

/**
 *
 * @author NITRO
 */
public class editActivityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        /*HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("Admin")== null) {
            response.sendRedirect("login.jsp");
            return;
        }*/
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            
            System.out.println("Activity ID: " + id);
            System.out.println("Activity name: " + name);
            System.out.println("Type: " + type);
            System.out.println("Description: " + description);
            System.out.println("Location: " + location); 
            
            
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc");
           


            
            // Corrected SQL query with commas between fields
            String sql = "UPDATE ACTIVITIES SET NAME = ?, TYPE = ?, DESCRIPTION = ?, LOCATION = ? WHERE ID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setString(3, description);
            stmt.setString(4, location);
            stmt.setInt(8, id); // Set the ID of the record to update
            stmt.executeUpdate();
            
            conn.close();   
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        response.sendRedirect("activity.jsp");
    }
}
