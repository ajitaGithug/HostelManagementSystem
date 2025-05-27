/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model;

/**
 *
 * @author hazee
 */
public class Student extends User {
    private String matricNo;
    private String phoneNo;
    private String address;
    private String gender;
    private String program;
    private int yearOfStudy;
    private boolean internship;
    private String guardianName;
    private String guardianContact;
    private String emergencyContact;
    private String roomID;

    public Student() {}

    public Student(String userID, String userName, String userEmail, String userPassword, String role,
                   String matricNo, String phoneNo, String address, String gender, String program,
                   int yearOfStudy, boolean internship, String guardianName, String guardianContact,
                   String emergencyContact, String roomID) {
        super(userID, userName, userEmail, userPassword, role);
        this.matricNo = matricNo;
        this.phoneNo = phoneNo;
        this.address = address;
        this.gender = gender;
        this.program = program;
        this.yearOfStudy = yearOfStudy;
        this.internship = internship;
        this.guardianName = guardianName;
        this.guardianContact = guardianContact;
        this.emergencyContact = emergencyContact;
        this.roomID = roomID;
    }

    public void updateProfile() {
        // logic to update profile
    }

    public Room viewRoomDetails() {
        // fetch Room details using roomID
        return null; // Replace with actual room
    }

    public String getMatricNo() {
        return matricNo;
    }

    public void setMatricNo(String matricNo) {
        this.matricNo = matricNo;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getProgram() {
        return program;
    }

    public void setProgram(String program) {
        this.program = program;
    }

    public int getYearOfStudy() {
        return yearOfStudy;
    }

    public void setYearOfStudy(int yearOfStudy) {
        this.yearOfStudy = yearOfStudy;
    }

    public boolean isInternship() {
        return internship;
    }

    public void setInternship(boolean internship) {
        this.internship = internship;
    }

    public String getGuardianName() {
        return guardianName;
    }

    public void setGuardianName(String guardianName) {
        this.guardianName = guardianName;
    }

    public String getGuardianContact() {
        return guardianContact;
    }

    public void setGuardianContact(String guardianContact) {
        this.guardianContact = guardianContact;
    }

    public String getEmergencyContact() {
        return emergencyContact;
    }

    public void setEmergencyContact(String emergencyContact) {
        this.emergencyContact = emergencyContact;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }
}
