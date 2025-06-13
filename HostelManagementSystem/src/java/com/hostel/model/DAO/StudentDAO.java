/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model.DAO;

/**
 *
 * @author hazee
 */

import com.hostel.model.Student;
import com.hostel.model.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.*;

public class StudentDAO {
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT s.*, u.userName FROM student s JOIN user u ON s.userID = u.userID";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setUserID(rs.getString("userID"));
                s.setUserName(rs.getString("userName"));
                s.setMatricNo(rs.getString("matricNo"));
                // If you have IC number, add: s.setIcNumber(rs.getString("icNumber"));
                s.setProgram(rs.getString("program"));
                s.setYearOfStudy(rs.getInt("yearOfStudy"));
                s.setPhoneNo(rs.getString("phoneNo"));
                // If you have approvalStatus in DB, add: s.setApprovalStatus(rs.getString("approvalStatus"));
                students.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }
    
    public void updateStudentProfile(Student student) {
    String sql = "UPDATE student SET phoneNo=?, address=?, gender=?, program=?, yearOfStudy=?, internship=?, guardianName=?, guardianContact=?, emergencyContact=? WHERE userID=?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, student.getPhoneNo());
        stmt.setString(2, student.getAddress());
        stmt.setString(3, student.getGender());
        stmt.setString(4, student.getProgram());
        stmt.setInt(5, student.getYearOfStudy());
        stmt.setBoolean(6, student.isInternship());
        stmt.setString(7, student.getGuardianName());
        stmt.setString(8, student.getGuardianContact());
        stmt.setString(9, student.getEmergencyContact());
        stmt.setString(10, student.getUserID());
        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    public Student getStudentByUserID(String userID) {
    String sql = "SELECT s.*, u.userName, u.userEmail, u.userPassword, u.role FROM student s JOIN user u ON s.userID = u.userID WHERE s.userID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, userID);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            Student s = new Student();
            s.setUserID(rs.getString("userID"));
            s.setUserName(rs.getString("userName"));
            s.setUserEmail(rs.getString("userEmail"));
            s.setUserPassword(rs.getString("userPassword"));
            s.setRole(rs.getString("role"));
            s.setMatricNo(rs.getString("matricNo"));
            s.setPhoneNo(rs.getString("phoneNo"));
            s.setAddress(rs.getString("address"));
            s.setGender(rs.getString("gender"));
            s.setProgram(rs.getString("program"));
            s.setYearOfStudy(rs.getInt("yearOfStudy"));
            s.setInternship(rs.getBoolean("internship"));
            s.setGuardianName(rs.getString("guardianName"));
            s.setGuardianContact(rs.getString("guardianContact"));
            s.setEmergencyContact(rs.getString("emergencyContact"));
            s.setRoomID(rs.getString("roomID"));
            return s;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
    
    public void insertStudentDetails(Student student) throws SQLException {
        String sql = "INSERT INTO Student (userID, matricNo, phoneNo, address, gender, program, yearOfStudy, internship, guardianName, guardianContact, emergencyContact, roomID) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, student.getUserID());
        stmt.setString(2, student.getMatricNo());
        stmt.setString(3, student.getPhoneNo());
        stmt.setString(4, student.getAddress());
        stmt.setString(5, student.getGender());
        stmt.setString(6, student.getProgram());
        stmt.setInt(7, student.getYearOfStudy());
        stmt.setBoolean(8, student.isInternship());
        stmt.setString(9, student.getGuardianName());
        stmt.setString(10, student.getGuardianContact());
        stmt.setString(11, student.getEmergencyContact());
        stmt.setString(12, student.getRoomID());  // Can be null if not yet assigned
        stmt.executeUpdate();
        }
    }
    
    public boolean registerStudent(Student s) {
        boolean success = false;
        try (Connection con = DBConnection.getConnection()) {
            
            // Insert into User table
            String sql1 = "INSERT INTO user (userID, userName, userEmail, userPassword, role) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setString(1, s.getUserID());
            ps1.setString(2, s.getUserName());
            ps1.setString(3, s.getUserEmail());
            ps1.setString(4, s.getUserPassword());
            ps1.setString(5, "student");
            ps1.executeUpdate();

            // Insert into Student table
            String sql2 = "INSERT INTO student (userID, matricNo, phoneNo, address, gender, program, yearOfStudy, internship, guardianName, guardianContact, emergencyContact, roomID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, s.getUserID());
            ps2.setString(2, s.getMatricNo());
            ps2.setString(3, s.getPhoneNo());
            ps2.setString(4, s.getAddress());
            ps2.setString(5, s.getGender());
            ps2.setString(6, s.getProgram());
            ps2.setInt(7, s.getYearOfStudy());
            ps2.setBoolean(8, s.isInternship());
            ps2.setString(9, s.getGuardianName());
            ps2.setString(10, s.getGuardianContact());
            ps2.setString(11, s.getEmergencyContact());
            ps2.setString(12, s.getRoomID());
            ps2.executeUpdate();
            
            
            success = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public void insertStudent(Student student) {
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "INSERT INTO Student (userID, matricNo, phoneNo, address, gender, program, yearOfStudy, internship, guardianName, guardianContact, emergencyContact) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, student.getUserID());
        stmt.setString(2, student.getMatricNo());
        stmt.setString(3, student.getPhoneNo());
        stmt.setString(4, student.getAddress());
        stmt.setString(5, student.getGender());
        stmt.setString(6, student.getProgram());
        stmt.setInt(7, student.getYearOfStudy());
        stmt.setBoolean(8, student.isInternship());
        stmt.setString(9, student.getGuardianName());
        stmt.setString(10, student.getGuardianContact());
        stmt.setString(11, student.getEmergencyContact());

        stmt.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
    
    public void updateStudentDetails(Student student) throws SQLException {
    String sql = "UPDATE Student SET matricNo=?, phoneNo=?, address=?, gender=?, program=?, yearOfStudy=?, internship=?, guardianName=?, guardianContact=?, emergencyContact=? WHERE userID=?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, student.getMatricNo());
        stmt.setString(2, student.getPhoneNo());
        stmt.setString(3, student.getAddress());
        stmt.setString(4, student.getGender());
        stmt.setString(5, student.getProgram());
        stmt.setInt(6, student.getYearOfStudy());
        stmt.setBoolean(7, student.isInternship());
        stmt.setString(8, student.getGuardianName());
        stmt.setString(9, student.getGuardianContact());
        stmt.setString(10, student.getEmergencyContact());
        stmt.setString(11, student.getUserID());
        stmt.executeUpdate();
    }
}


    
    

}
