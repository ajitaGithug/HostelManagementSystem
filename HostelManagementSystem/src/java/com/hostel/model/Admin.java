/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model;

/**
 *
 * @author hazee
 */
public class Admin extends User {
    private String contactNo;
    private String position;
    private int minMeritRequired;
    
    public Admin () {}
    
    public Admin(String userID, String userName, String userEmail, String userPassword, String role, String contactNo, String position, int minMeritRequired) {
        super(userID, userName, userEmail, userPassword, role);
        this.contactNo = contactNo;
        this.position = position;
        this.minMeritRequired = minMeritRequired;
    }
    
    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getMinMeritRequired() {
        return minMeritRequired;
    }

    public void setMinMeritRequired(int minMeritRequired) {
        this.minMeritRequired = minMeritRequired;
    }
}
