package com.scc.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Guardians implements java.io.Serializable {
    private int ID;
    private String name;
    private String phone;
    private String gender;
    private String address;
    private String dateOfBirth;

    public Guardians(int ID, String name, String phone, String gender, String address, String dateOfBirth) {
        this.ID = ID;
        this.name = name;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
    }

    public int getGuardianID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getGender() {
        return gender;
    }

    public String getAddress() {
        return address;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setGuardianID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    // Retrieve guardian by ID
    public static Guardians getGuardianById(int id) {
        Guardians guardian = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM guardians WHERE id = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    guardian = new Guardians(
                            rs.getInt("ID"),
                            rs.getString("NAME"),
                            rs.getString("PHONE"),
                            rs.getString("GENDER"),
                            rs.getString("ADDRESS"),
                            rs.getString("DATEOFBIRTH")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guardian;
    }

    // Update guardian
    public boolean update() {
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE GUARDIANS SET NAME = ?, PHONE = ?, GENDER = ?, ADDRESS = ?, DATEOFBIRTH = ? WHERE ID = ?")) {
            stmt.setString(1, name);
            stmt.setString(2, phone);
            stmt.setString(3, gender);
            stmt.setString(4, address);
            stmt.setString(5, dateOfBirth);
            stmt.setInt(6, ID); // Fix for missing binding of ID
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve all guardians
    public static List<Guardians> getAllGuardians() {
        List<Guardians> guardiansList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM GUARDIANS");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Guardians guardian = new Guardians(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("PHONE"), // Fix: PHONE is an int
                        rs.getString("GENDER"),
                        rs.getString("ADDRESS"),
                        rs.getString("DATEOFBIRTH")
                );
                guardiansList.add(guardian);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guardiansList;
    }
}
