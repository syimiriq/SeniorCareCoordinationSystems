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


public class addActivityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           

        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String location = request.getParameter("location");

        
        // Validate inputs
        
        /*if (name == null || type == null || description == null || location == null){
            response.getWriter().println("All fields are required!");
            return;
        }*/

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "INSERT INTO ACTIVITIES (NAME, TYPE, DESCRIPTION, LOCATION) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setString(3, description);
            stmt.setString(4, location);
            stmt.executeUpdate();
            
            response.sendRedirect("activities.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while adding activity information.");
        }

        
    }
}