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

public class SearchSeniorServlet extends HttpServlet {
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
                String sql = "SELECT * FROM SENIORS WHERE LOWER(NAME) LIKE ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                String searchPattern = "%" + query.toLowerCase() + "%";
                stmt.setString(1, searchPattern);

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    Map<String, Object> senior = new HashMap<>();
                    senior.put("ID", rs.getInt("ID"));
                    senior.put("NAME", rs.getString("NAME"));
                    senior.put("GENDER", rs.getString("GENDER"));
                    senior.put("DATEOFBIRTH", rs.getString("DATEOFBIRTH"));
                    senior.put("GUARDIANID", rs.getString("GUARDIANID"));               
                    results.add(senior);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("error", "An error occurred while searching for caretakers. Please try again.");
            }
        } else {
            request.setAttribute("error", "Search query cannot be empty.");
        }

        // Set search results to the request
        request.setAttribute("results", results);

        // Forward to JSP page
        request.getRequestDispatcher("searchSenior.jsp").forward(request, response);
    }
}
