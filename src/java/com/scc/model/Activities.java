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
    private int ID;
    private String name;
    private String type;
    private String description;
    private String location;
    
 public Activities(int ID, String name,String type,String description,String location){
    this.ID = ID;
    this.name = name;
    this.type = type;
    this.description = description;
    this.location = location;
    }
 public int getID(){
        return ID;
    }
    public String getname(){
        return name;
    }
    public String get_type(){
        return type;
    }
    public String getdescription(){
        return description;
    }
    public String getlocation() {
        return location;
    }
}
