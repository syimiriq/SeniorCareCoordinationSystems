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

public class SearchCaretakerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String query = request.getParameter("query");
        List<Map<String, Object>> results = new ArrayList<>();

        if (query != null && !query.trim().isEmpty()) {
            try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc")) {
                String sql = "SELECT * FROM CARETAKERS WHERE LOWER(NAME) LIKE ? OR LOWER(EMAIL) LIKE ? OR LOWER(ROLE) LIKE ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                String searchPattern = "%" + query.toLowerCase() + "%";
                stmt.setString(1, searchPattern);
                stmt.setString(2, searchPattern);
                stmt.setString(3, searchPattern);

                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    Map<String, Object> caretaker = new HashMap<>();
                    caretaker.put("ID", rs.getInt("ID"));
                    caretaker.put("NAME", rs.getString("NAME"));
                    caretaker.put("EMAIL", rs.getString("EMAIL"));
                    caretaker.put("PHONE", rs.getString("PHONE"));
                    caretaker.put("ROLE", rs.getString("ROLE"));
                    caretaker.put("STATUS", rs.getBoolean("STATUS"));
                    results.add(caretaker);
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
        request.getRequestDispatcher("searchCaretaker.jsp").forward(request, response);
    }
}
