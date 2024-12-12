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
public class Admins {
    private int ID;
    private String username;
    private String email;
    private String role;
    
    public Admins(int ID,String username,String email,String role){
        this.ID = ID;
        this.username = username;
        this.email = email;
        this.role = role;
    }
    public String getUsername() {
        return username;
    }
    public int getID() {
        return ID;
    }
    public String getEmail() {
        return email;
    }
    public String getRole() {
        return role;
    }
}