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
import java.util.*;
import javax.servlet.http.HttpSession;


public class SearchActivitiesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String query = request.getParameter("query");
        List<Map<String, Object>> results = new ArrayList<>();

        if (query != null && !query.trim().isEmpty()) {
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
                String sql = "SELECT * FROM ACTIVITIES WHERE LOWER(NAME) LIKE ? OR LOWER(TYPE) LIKE ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                String searchPattern = "%" + query.toLowerCase() + "%";
                stmt.setString(1, searchPattern);
                stmt.setString(2, searchPattern);

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    Map<String, Object> activities = new HashMap<>();
                    activities.put("ID", rs.getInt("ID"));
                    activities.put("NAME", rs.getString("NAME"));
                    activities.put("TYPE", rs.getString("TYPE"));
                    activities.put("DESCRIPTION", rs.getString("DESCRIPTION"));
                    activities.put("LOCATION", rs.getString("LOCATION"));
                    results.add(activities);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("results", results);
        request.getRequestDispatcher("searchActivities.jsp").forward(request, response);
    }
}