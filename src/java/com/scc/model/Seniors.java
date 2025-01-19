package com.scc.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Seniors implements java.io.Serializable {
    private int ID;
    private String name;
    private String gender;
    private String dateOfBirth;

    // Constructor
    public Seniors(int ID, String name, String gender, String dateOfBirth) {
        this.ID = ID;
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
    }

    // Getters
    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    // Setters
    public void setID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    // Retrieve a senior by ID
    public static Seniors getSeniorById(int id) {
        Seniors senior = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM SENIORS WHERE ID = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    senior = new Seniors(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("GENDER"),
                        rs.getString("DATEOFBIRTH") // Fix: include dateOfBirth
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return senior;
    }

    // Update senior
    public boolean update() {
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("UPDATE SENIORS SET NAME = ?, GENDER = ?, DATEOFBIRTH = ? WHERE ID = ?")) {
            stmt.setString(1, name);
            stmt.setString(2, gender);
            stmt.setString(3, dateOfBirth);
            stmt.setInt(4, ID); // Fix: bind ID
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Retrieve all seniors
    public static List<Seniors> getAllSeniors() {
        List<Seniors> seniorsList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM SENIORS");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Seniors senior = new Seniors(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("GENDER"),
                        rs.getString("DATEOFBIRTH") // Fix: match constructor and table structure
                );
                seniorsList.add(senior);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seniorsList;
    }
}
