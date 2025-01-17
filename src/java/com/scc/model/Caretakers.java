
package com.scc.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Caretakers implements java.io.Serializable {
    private int id;
    private String name;
    private String email;
    private int phone;
    private String username;
    private String password;
    private String role;
    private boolean status;

    // Constructor
    public Caretakers(int id, String name, String email, int phone, String username, String password, String role, boolean status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.role = role;
        this.status = status;
    }
    public Caretakers(int ID, String name, String email, int phone, String username, String role, boolean status) {
        this.id = ID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.username = username;
        this.role = role;
        this.status = status;
    }
   

    // Getters and Setters
    public int getID() { return id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public int getPhone() { return phone; }
    public void setPhone(int phone) { this.phone = phone; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public boolean getStatus() { return status; }
    public void setStatus(boolean status) { this.status = status; }

    // Method to retrieve a caretaker by ID
    public static Caretakers getCaretakerById(int id) {
        Caretakers caretaker = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM CARETAKERS WHERE ID = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    caretaker = new Caretakers(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("EMAIL"),
                        rs.getInt("PHONE"),
                        rs.getString("USERNAME"),
                        rs.getString("PASSWORD"),
                        rs.getString("ROLE"),
                        rs.getBoolean("STATUS")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return caretaker;
    }

    // Method to update caretaker details
    public boolean update() {
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("UPDATE CARETAKERS SET NAME = ?, EMAIL = ?, PHONE = ?, USERNAME = ?, PASSWORD = ?, ROLE = ?, STATUS = ? WHERE ID = ?")) {
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setInt(3, phone);
            stmt.setString(4, username);
            stmt.setString(5, password);
            stmt.setString(6, role);
            stmt.setBoolean(7, status);
            stmt.setInt(8, id);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

   
    // Static method to fetch all caretakers from the database
    public static List<Caretakers> getAllCaretakers() {
        List<Caretakers> caretakersList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM CARETAKERS");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Caretakers caretaker = new Caretakers(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("EMAIL"),
                        rs.getInt("PHONE"),
                        rs.getString("USERNAME"),
                        rs.getString("ROLE"),
                        rs.getBoolean("STATUS")
                );
                caretakersList.add(caretaker);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return caretakersList;
    }
}

