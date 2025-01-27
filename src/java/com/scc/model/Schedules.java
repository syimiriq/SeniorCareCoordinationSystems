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
    private String start_time ;
    private String end_time ;
    private String date;
    private boolean status;
    private int caretakerid;
    
    
    //constructor
    public Schedules (int activityid, int seniorid, String start_time, String end_time, String date, boolean status, int caretakerid){
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
    public String getStart_time(){return start_time;}
    public void setStart_time(String start_time){this.start_time = start_time;}
    public String getEnd_time(){return end_time;}
    public void setEnd_time(String end_time){this.end_time = end_time;}
    public String getDate(){return date;}
    public void setDate(String date){this.date = date;}
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
                        rs.getString("START_TIME"),
                        rs.getString("END_TIME"),
                        rs.getString("DATE"),
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
            
            stmt.setString(1, start_time);
            stmt.setString(2, end_time);
            stmt.setString(3, date);
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
    public static List<Schedules> getAllSchedules() {
        List<Schedules> schedulesList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
             PreparedStatement stmt = conn.prepareStatement("SELECT activityID, seniorID, caretakerID, start_time, end_time, schedule_date, status FROM SCHEDULES");
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Schedules schedule = new Schedules(
                        rs.getInt("activityID"),
                        rs.getInt("seniorID"),
                        rs.getString("start_time"),
                        rs.getString("end_time"),
                        rs.getString("schedule_date"),
                        rs.getBoolean("status"),
                        rs.getInt("caretakerID")
                );
                schedulesList.add(schedule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schedulesList;
    } 
}

