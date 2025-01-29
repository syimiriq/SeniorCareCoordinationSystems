
package com.scc.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Activities implements java.io.Serializable{
    private int id;
    private String name;
    private String type;
    private String description;
    private String location;
    
    //constractor
    public Activities(int id, String name,String type,String description,String location){
        this.id = id;
        this.name = name;
        this.type = type;
        this.description = description;
        this.location = location;
    }
    //Getter and Setter
    public int getId(){return id;}
    public String getName(){return name;}
    public void setName(String name){this.name = name;}
    public String getType(){return type;}
    public void setType(String type){this.type = type;}
    public String getDescription(){return description;}
    public void setDescription(String description){this.description = description;}
    public String getLocation(){return location;}
    public void setLocation(String location){this.location = location;}
    
    //method to retrieve a activity by ID
    public static Activities getActivityById(int id) {
        Activities activity = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM activities WHERE id = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    activity = new Activities(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("TYPE"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("LOCATION")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activity;
    }
    //method to update activity
     public boolean update() {
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("UPDATE ACTIVITIES SET NAME = ?, TYPE = ?, DESCRIPTION = ?, LOCATION = ? WHERE ID = ?")) {
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setString(3, description);
            stmt.setString(4, location);
            stmt.setInt(5, id);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
     //Static method to fetch all activities from database
      public static List<Activities> getAllActivities() {
        List<Activities> activitiesList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM ACTIVITIES");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Activities activity = new Activities(
                        rs.getInt("ID"),
                        rs.getString("NAME"),
                        rs.getString("TYPE"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("LOCATION")
                );
                activitiesList.add(activity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return activitiesList;
    }
}
  

