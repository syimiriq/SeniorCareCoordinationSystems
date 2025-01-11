/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.model;

/**
 *
 * @author NITRO
 */
public class Activities implements java.io.Serializable{
    private int activityID;
    private String activity_name;
    private String activity_type;
    private String activity_description;
    private String activity_location;
    
 public Activities(int activityID, String activity_name,String activity_type,String activity_description,String activity_location){
    this.activityID = activityID;
    this.activity_name = activity_name;
    this.activity_type = activity_type;
    this.activity_description = activity_description;
    this.activity_location = activity_location;
    }
 public int getactivityID(){
        return activityID;
    }
    public String getactivity_name(){
        return activity_name;
    }
    public String getactivity_type(){
        return activity_type;
    }
    public String getactivity_description(){
        return activity_description;
    }
    public String getactivity_location() {
        return activity_location;
    }
}
