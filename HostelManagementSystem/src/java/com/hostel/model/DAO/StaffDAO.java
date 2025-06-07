/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model.DAO;

/**
 *
 * @author hazee
 */

import com.hostel.model.Staff;
import com.hostel.model.DBConnection;
import com.hostel.model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

public class StaffDAO {
    private Connection conn;

    public StaffDAO(Connection conn) {
        this.conn = conn;
    }

    public Staff getStaffByID(String staffID) throws SQLException {
        String sql = "SELECT * FROM users WHERE userID = ? AND role = 'STAFF'";
        
        try(PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, staffID);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            Staff staff = new Staff();
            staff.setUserID(rs.getString("userID"));
            staff.setUserName(rs.getString("userName"));
            staff.setUserEmail(rs.getString("userEmail"));
            staff.setUserPassword(rs.getString("userPassword"));
            staff.setRole(rs.getString("role"));
            staff.setPosition(rs.getString("position"));
            staff.setContactNo(rs.getString("contactNo"));
            staff.setMinMeritRequired(rs.getInt("minMeritRequired"));
            staff.setPhoto(rs.getString("photo"));
            return staff;
        }
        return null;
    }
    }

    public boolean updateStaffProfile(Staff staff) throws SQLException {
        String sql = "UPDATE users SET userName=?, userEmail=?, contactNo=?, position=?, minMeritRequired=?, photo=?, userPassword=? WHERE userID=?";
        try(PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, staff.getUserName());
        stmt.setString(2, staff.getUserEmail());
        stmt.setString(3, staff.getContactNo());
        stmt.setString(4, staff.getPosition());
        stmt.setInt(5, staff.getMinMeritRequired());
        stmt.setString(6, staff.getPhoto());
        stmt.setString(7, staff.getUserPassword());
        stmt.setString(8, staff.getUserID());
        return stmt.executeUpdate() > 0;
        }
    }
    
    public boolean insertStaffDetails(Staff staff) {
    boolean status = false;
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "INSERT INTO staff (userID, position, contactNo, minMeritRequired, photo) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, staff.getUserID());
        ps.setString(2, staff.getPosition());
        ps.setString(3, staff.getContactNo());
        ps.setInt(4, staff.getMinMeritRequired());
        ps.setString(5, staff.getPhoto());
        
        status = ps.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return status;
}
    
    public boolean UpdateStaffProfile(Staff staff) throws SQLException {
        String sql = "REPLACE INTO staff (staffID, position, contactNo, minMeritRequired, photo) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staff.getUserID());
            stmt.setString(2, staff.getPosition());
            stmt.setString(3, staff.getContactNo());
            stmt.setInt(4, staff.getMinMeritRequired());
            stmt.setString(5, staff.getPhoto());
            return stmt.executeUpdate() > 0;
        }
    }
    
    public Staff GetStaffByID(String staffID) throws SQLException {
        String sql = "SELECT u.*, s.position, s.contactNo, s.minMeritRequired, s.photo " +
                     "FROM users u JOIN staff s ON u.userID = s.staffID WHERE u.userID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staffID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Staff(
                    rs.getString("userID"),
                    rs.getString("userName"),
                    rs.getString("userEmail"),
                    rs.getString("userPassword"),
                    rs.getString("role"),
                    rs.getString("position"),
                    rs.getString("contactNo"),
                    rs.getInt("minMeritRequired"),
                    rs.getString("photo")
                );
            }
        }
        return null;
    }
    

}
