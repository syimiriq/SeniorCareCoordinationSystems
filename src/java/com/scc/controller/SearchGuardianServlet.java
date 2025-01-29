/**
 *
 * @author user
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

public class SearchGuardianServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Caretaker") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String query = request.getParameter("query");
        List<Map<String, Object>> results = new ArrayList<>();

        if (query != null && !query.trim().isEmpty()) {
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
                String sql = "SELECT * FROM GUARDIANS WHERE LOWER(NAME) LIKE ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                String searchPattern = "%" + query.toLowerCase() + "%";
                stmt.setString(1, searchPattern);

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    Map<String, Object> guardian = new HashMap<>();
                    guardian.put("ID", rs.getInt("ID"));
                    guardian.put("NAME", rs.getString("NAME"));
                    guardian.put("GENDER", rs.getString("GENDER"));
                    guardian.put("GENDER", rs.getString("GENDER"));
                    guardian.put("DATEOFBIRTH", rs.getString("DATEOFBIRTH"));  
                    guardian.put("ADDRESS", rs.getString("ADDRESS"));
                    results.add(guardian);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred while searching for caretakers. Please try again.");
            }
        } else {
            request.setAttribute("error", "Search query cannot be empty.");
        }
        
        request.setAttribute("results", results);
        request.getRequestDispatcher("searchGuardian.jsp").forward(request, response);
    }
}
