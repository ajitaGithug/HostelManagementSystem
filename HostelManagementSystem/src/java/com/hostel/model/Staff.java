/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model;

/**
 *
 * @author hazee
 */
public class Staff extends User {
    private String position;
    private String contactNo;
    private int minMeritRequired;
    private String photo;
    
    public Staff () {}
    
    public Staff(String userID, String userName, String userEmail, String userPassword, String role,
                 String position, String contactNo, int minMeritRequired, String photo) {
        super(userID, userName, userEmail, userPassword, role);
        this.position = position;
        this.contactNo = contactNo;
        this.minMeritRequired = minMeritRequired;
        this.photo = photo;
    }

    public void scanQRCode() {
        
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public int getMinMeritRequired() {
        return minMeritRequired;
    }

    public void setMinMeritRequired(int minMeritRequired) {
        this.minMeritRequired = minMeritRequired;
    }
    
    public String getPhoto() {
        return photo;
    }
    
    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
    public String getID() {
        return super.getUserID();
    }

    public String getUsername() {
        return super.getUserName();
    }

    public String getEmail() {
        return super.getUserEmail();
    }

    public String getPassword() {
        return super.getUserPassword();
    }
}
