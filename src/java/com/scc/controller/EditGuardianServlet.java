package com.scc.controller;

import com.scc.model.Guardians;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditGuardianServlet")
public class EditGuardianServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form parameters
        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String phoneParam = request.getParameter("phone");
        String dateOfBirth = request.getParameter("dateofbirth");
        String address = request.getParameter("address");

        // Validate and parse the parameters
        if (idParam == null || !idParam.matches("\\d+")) {
            response.sendRedirect("editGuardian.jsp?error=Invalid ID");
            return;
        }

        int id = Integer.parseInt(idParam);

        if (phoneParam == null || !phoneParam.matches("\\d{10,15}")) {
            response.sendRedirect("editGuardian.jsp?error=Invalid phone number");
            return;
        }

        int phone = Integer.parseInt(phoneParam);

        if (name == null || name.trim().isEmpty() ||
            gender == null || (!gender.equalsIgnoreCase("male") && !gender.equalsIgnoreCase("female")) ||
            dateOfBirth == null || dateOfBirth.trim().isEmpty() ||
            address == null || address.trim().isEmpty()) {
            response.sendRedirect("editGuardian.jsp?error=Missing or invalid fields");
            return;
        }

        // Fetch the existing guardian
        Guardians guardian = Guardians.getGuardianById(id);
        if (guardian == null) {
            response.sendRedirect("editGuardian.jsp?error=Guardian not found");
            return;
        }

        // Update the guardian details
        guardian.setName(name);
        guardian.setGender(gender);
        guardian.setPhone(phone);
        guardian.setDateofbirth(dateOfBirth);
        guardian.setAddress(address);

        // Save the changes to the database
        boolean updateSuccess = guardian.update();

        if (updateSuccess) {
            response.sendRedirect("guardian.jsp?success=Guardian updated successfully");
        } else {
            response.sendRedirect("editGuardian.jsp?error=Failed to update guardian");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("editGuardian.jsp");
    }
}
