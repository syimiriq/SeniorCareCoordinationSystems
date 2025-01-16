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

/**
 *
 * @author NITRO
 */
public class addScheduleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
           

        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        
        // Validate inputs
        /*if (start == null || end == null || status == null){
            response.getWriter().println("All fields are required!");
            return;
        }*/

        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination","scc","scc")) {
            String query = "INSERT INTO ACTIVITIES (START_TIME, END_TIME, DATE, STATUS) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, start);
            stmt.setString(2, end);
            stmt.setString(3, date);
            stmt.setString(3, status);
            stmt.executeUpdate();
            
            response.sendRedirect("schedule.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred while adding schedule information.");
        }

        
    }
}