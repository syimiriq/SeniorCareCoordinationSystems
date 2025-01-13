/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.controller;
import com.scc.model.Activities;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

public class addActivityServlet extends HttpServlet {
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset-UTF-8");
        
        String activity_name = request.getParameter("activity_name");
        String activity_type = request.getParameter("activity_type");
        String activity_description = request.getParameter("activity_description");
        String activity_location = request.getParameter("activity_location");
        

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "INSERT INTO ACTIVITY (ACTIVITY_NAME, ACTIVITY_TYPE, ACTIVITY_DESCRIPTION, ACTIVITY_LOCATION) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, activity_name);
            stmt.setString(2, activity_type);
            stmt.setString(3, activity_description);
            stmt.setString(4, activity_location);
            stmt.executeUpdate();
            response.sendRedirect("activities.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        }

        
    }
    }

    