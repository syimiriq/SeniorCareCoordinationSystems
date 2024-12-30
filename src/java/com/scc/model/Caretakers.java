/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.scc.model;

/**
 *
 * @author Syamir
 */
public class Caretakers implements java.io.Serializable {
    private int ID;
    private String name;
    private String email;
    private int phone;
    private String username;
    private String role;
    private boolean status;
    
    public Caretakers(int ID, String name,String email,int phone,String username,String role,boolean status){
    this.ID = ID;
    this.name = name;
    this.email = email;
    this.phone = phone;
    this.username = username;
    this.role = role;
    this.status = status;
    }
    
    public int getID(){
        return ID;
    }
    public String getName(){
        return name;
    }
    public String getEmail(){
        return email;
    }
    public int getPhone(){
        return phone;
    }
    public String getUsername() {
        return username;
    }
    public String getRole() {
        return role;
    }
    public boolean getStatus(){
        return status;
    }
}