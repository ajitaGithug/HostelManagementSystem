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


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;

public class StaffDAO {
    

    public boolean updateStaffProfile(Staff staff) throws SQLException {
        String sql = "UPDATE users SET userName=?, userEmail=?, contactNo=?, position=?, minMeritRequired=?, photo=?, userPassword=? WHERE userID=?";
        try(Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
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
    
    public boolean InsertStaffDetails(Staff staff) {
    boolean status = false;
    String sql = "INSERT INTO staff (userID, position, contactNo, minMeritRequired, photo) VALUES (?, ?, ?, ?, ?)";
        
    try (Connection conn = DBConnection.getConnection()) {
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
        try (   Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, staff.getUserID());
            stmt.setString(2, staff.getPosition());
            stmt.setString(3, staff.getContactNo());
            stmt.setInt(4, staff.getMinMeritRequired());
            stmt.setString(5, staff.getPhoto());
            return stmt.executeUpdate() > 0;
        }
    }
    
    /*
    public Staff getStaffByID(String userID) throws SQLException {
        String sql = "SELECT u.*, s.position, s.contactNo, s.minMeritRequired, s.photo " +
                     "FROM users u JOIN staff s ON u.userID = s.staffID WHERE u.userID = ?";
        try (   Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, userID);
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
    */
    
    public boolean insertStaff(Staff staff) {
        String sql = "INSERT INTO Staff (userID, position, contactNo, minMeritRequired, photo) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, staff.getUserID());
            stmt.setString(2, staff.getPosition());
            stmt.setString(3, staff.getContactNo());
            stmt.setInt(4, staff.getMinMeritRequired());
            stmt.setString(5, staff.getPhoto());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with better error logging in production
            return false;
        }
    }
    
    public Staff getStaffByUserID(String userID) {
        Staff staff = null;
        String sql = "SELECT u.userID, u.userName, u.userEmail, u.userPassword, u.role, "
                   + "s.position, s.contactNo, s.minMeritRequired, s.photo "
                   + "FROM user u INNER JOIN staff s ON u.userID = s.userID "
                   + "WHERE u.userID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                staff = new Staff(
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        return staff;
    }
    
    public static int getLatestMinMeritRequired() {
    String sql = "SELECT minMeritRequired FROM staff ORDER BY userID DESC FETCH FIRST 1 ROWS ONLY";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {
        if (rs.next()) {
            return rs.getInt("minMeritRequired");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0; // default if none found
}

    

}
