/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Medicals {
        private int id;
    private Date dateTime;
    private double height;
    private double weight;
    private double bmiIndex;
    private double heartRate;
    private double bloodPressure;
    private double bodyTemperature;
    private int seniorID;
    private int caretakerID;
    // Default constructor
    public Medicals() {}

    // Parameterized constructor
    public Medicals(int id, Date dateTime, double height, double weight, double bmiIndex,
                    double heartRate, double bloodPressure, double bodyTemperature, int seniorID, int caretakerID) {
        this.id = id;
        this.dateTime = dateTime;
        this.height = height;
        this.weight = weight;
        this.bmiIndex = bmiIndex;
        this.heartRate = heartRate;
        this.bloodPressure = bloodPressure;
        this.bodyTemperature = bodyTemperature;
        this.seniorID = seniorID;
        this.caretakerID = caretakerID;
    }

    // Getters and setters
    public int getID() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getBmiIndex() {
        return bmiIndex;
    }

    public void setBmiIndex(double bmiIndex) {
        this.bmiIndex = bmiIndex;
    }

    public double getHeartRate() {
        return heartRate;
    }

    public void setHeartRate(double heartRate) {
        this.heartRate = heartRate;
    }

    public double getBloodPressure() {
        return bloodPressure;
    }

    public void setBloodPressure(double bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    public double getBodyTemperature() {
        return bodyTemperature;
    }

    public void setBodyTemperature(double bodyTemperature) {
        this.bodyTemperature = bodyTemperature;
    }

    public int getSeniorID() {
        return seniorID;
    }

    public void setSeniorID(int seniorID) {
           this.seniorID = seniorID;
    }
    public int getCaretakerID() {
        return caretakerID;
    }
     public void setCaretakerID(int caretakerID) {
           this.caretakerID = caretakerID;
    }
    
public static List<Medicals> getAllMedicalHistory(int id) {
    List<Medicals> medicalList = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/SeniorCareCoordination", "scc", "scc");
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM MEDICALS where SENIORID = ?")) {
        stmt.setInt(1, id);

        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Medicals medical = new Medicals(
                        rs.getInt("ID"),
                        rs.getDate("DATETIME"),
                        rs.getDouble("HEIGHT"),
                        rs.getDouble("WEIGHT"),
                        rs.getDouble("BMI"),
                        rs.getDouble("HEART_RATE"),
                        rs.getDouble("BLOOD_PRESSURE"),
                        rs.getDouble("BODY_TEMPERATURE"),
                        rs.getInt("SENIORID"),
                        rs.getInt("CARETAKERID")
                );
                medicalList.add(medical);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return medicalList;
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

}
