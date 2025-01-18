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
public class deleteActivityServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        /*HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }*/

        try {
            // Get the caretaker ID from the request
            int id = Integer.parseInt(request.getParameter("id"));

            // Establish a connection to the database
            Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
            
            // Delete the caretaker record from the database
            String sql = "DELETE FROM ACTIVITIES WHERE ID = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
            return;
        }

        // Redirect to caretakers page after successful deletion
        response.sendRedirect("activities.jsp");
    }
}