/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Schedules implements java.io.Serializable{
    private int activityid;
    private int seniorid;
    private Timestamp start_time ;
    private Timestamp end_time ;
    private Date date;
    private boolean status;
    private int caretakerid;
    
    
    //constructor
    public Schedules (int activityid, int seniorid, Timestamp start_time, Timestamp end_time, Date date, boolean status, int caretakerid){
        this.activityid = activityid;
        this.seniorid = seniorid;
        this.start_time = start_time;
        this.end_time = end_time;
        this.date = date;
        this.status = status;
        this.caretakerid = caretakerid;
    }
    
    //getters and setters
    public int getActivityid(){return activityid;}
    public int getSeniorid(){return seniorid;}
    public Timestamp getStart_time(){return start_time;}
    public void setStart_time(Timestamp start_time){this.start_time = start_time;}
    public Timestamp getEnd_time(){return end_time;}
    public void setEnd_time(Timestamp end_time){this.end_time = end_time;}
    public Date getDate(){return date;}
    public void setDate(Date date){this.date = date;}
    public boolean getStatus(){return status;}
    public void setStatus(boolean status){this.status = status;}
    public int getCaretakerid(){return caretakerid;}
    
    //to retrieve a schedule by activityid
    public static Schedules getScheduleById(int activityid, int seniorid, int caretakerid) {
        Schedules schedule = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT s.activityID, s.seniorID, s.caretakerID, s.start_time, s.end_time, s.schedule_date, s.status " +"FROM SCHEDULES s " +"JOIN Activities a ON s.activityID = a.activityID " +"JOIN Seniors sen ON s.seniorID = sen.seniorID " +"LEFT JOIN Caretakers c ON s.caretakerID = c.caretakerID " +"WHERE s.activityID = ? AND s.seniorID = ? AND c.caretakerID = ?")) {
            stmt.setInt(1, activityid);
            stmt.setInt(2, seniorid);
            stmt.setInt(3, caretakerid);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    schedule = new Schedules(
                        rs.getInt(activityid),
                        rs.getInt(seniorid),
                        rs.getTimestamp("START_TIME"),
                        rs.getTimestamp("END_TIME"),
                        rs.getDate("DATE"),
                        rs.getBoolean("STATUS"),
                        rs.getInt(caretakerid)
                    );
                } 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedule;
    }
      public boolean update() {
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("UPDATE SCHEDULES SET start_time = ?, end_time = ?, schedule_date = ?, status = ? " + "WHERE activityID = ? AND seniorID = ?")) {
            
            stmt.setTimestamp(1, start_time);
            stmt.setTimestamp(2, end_time);
            stmt.setDate(3, date);
            stmt.setBoolean(4, status);
            stmt.setInt(5, activityid);
            stmt.setInt(6, seniorid);
           
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static List<Schedules> getAllSchedules(int id) {
        List<Schedules> schedulesList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM SCHEDULES WHERE SENIORID= ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Schedules schedule = new Schedules(
                            rs.getInt("ACTIVITYID"),
                            rs.getInt("SENIORID"),
                            rs.getTimestamp("START_TIME"),
                            rs.getTimestamp("END_TIME"),
                            rs.getDate("DATE"),
                            rs.getBoolean("STATUS"),
                            rs.getInt("CARETAKERID")
                    );
                    schedulesList.add(schedule);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedulesList;
    }
        public String activityName(int id){
        String name = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT name FROM ACTIVITIES WHERE ID = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("NAME");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "NULL";
    }
        public String caretakerName(int id){
        String name = null;
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT name FROM CARETAKERS WHERE ID = ?")) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("NAME");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "NULL";
    }
        public static boolean deleteSchedule(int activityId, int seniorId, Timestamp startTime) {
        boolean success = false;
        
        // Example SQL query to delete the schedule based on activityId, seniorId, and startTime
        String sql = "DELETE FROM schedules WHERE activityid = ? AND seniorid = ? AND start_time = ?";
        
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, activityId);
            stmt.setInt(2, seniorId);
            stmt.setTimestamp(3, startTime); // Pass the Timestamp directly
            
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return success;
    }
        
         public static boolean updateScheduleStatus(int activityId, int seniorId, Timestamp starttime) {
        boolean success = false;
        
        // Database connection setup
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
             conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");

            // SQL query to update the status to 'true' (completed)
            String sql = "UPDATE schedules SET status = ? WHERE ACTIVITYID = ? AND SENIORID = ? AND START_TIME = ?";
            
            // Create a prepared statement
            stmt = conn.prepareStatement(sql);
            stmt.setBoolean(1, true);  // Set the status to true (completed)
            stmt.setInt(2, activityId);
            stmt.setInt(3, seniorId);
            stmt.setTimestamp(4, starttime);  // Set the start time

            // Execute the update
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }
    
}

