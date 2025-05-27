/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model;

/**
 *
 * @author hazee
 */
public class User {
    private String userID;
    private String userName;
    private String userEmail;
    private String userPassword;
    private String role;

    public User() {}

    public User(String userID, String userName, String userEmail, String userPassword, String role) {
        this.userID = userID;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.role = role;
    }

    
    public String getUserID() { 
        return userID; 
    }
    public void setUserID(String userID) { 
        this.userID = userID; 
    }

    public String getUserName() { 
        return userName; 
    }
    public void setUserName(String userName) { 
        this.userName = userName; 
    }

    public String getUserEmail() { 
        return userEmail; 
    }
    public void setUserEmail(String userEmail) { 
        this.userEmail = userEmail; 
    }

    public String getUserPassword() { 
        return userPassword; 
    }
    public void setUserPassword(String userPassword) { 
        this.userPassword = userPassword; 
    }

    public String getRole() { 
        return role; 
    }
    public void setRole(String role) { 
        this.role = role; 
    }
}

