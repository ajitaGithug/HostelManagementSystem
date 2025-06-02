/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hostel.model.DAO;

/**
 *
 * @author hazee
 */
import com.hostel.model.User;
import com.hostel.model.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    
    public boolean registerUser(User user) {
        String sql = "INSERT INTO user (userID, userName, userEmail, userPassword, role) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUserID());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getUserEmail());
            stmt.setString(4, user.getUserPassword());
            stmt.setString(5, user.getRole());
            int result = stmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM user WHERE userEmail = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                    rs.getString("userID"),
                    rs.getString("userName"),
                    rs.getString("userEmail"),
                    rs.getString("userPassword"),
                    rs.getString("role")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int getRoleCount(String role) {
        String sql = "SELECT COUNT(*) FROM user WHERE role = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, role);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1); // return count
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    /*public String getNextUserId(String role) {
    String prefix = role.equalsIgnoreCase("STUDENT") ? "STU" :
                    role.equalsIgnoreCase("STAFF") ? "STA" :
                    role.equalsIgnoreCase("ADMIN") ? "ADM" : "";

    String query = "SELECT userID FROM user WHERE role = ? AND userID LIKE ? ORDER BY userID DESC LIMIT 1";

    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {

        stmt.setString(1, role);
        stmt.setString(2, prefix + "%");

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            String lastId = rs.getString("userID"); // e.g., STU007
            int number = Integer.parseInt(lastId.substring(3)); // get 007 as int
            return prefix + String.format("%03d", number + 1);  // STU008
        } else {
            return prefix + "001"; // first ID if none exist
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return prefix + "001"; // fallback
}
*/
    public static User login(String userId, String password) {
    String sql = "SELECT * FROM user WHERE userID = ? AND userPassword = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, userId);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            return new User(
                rs.getString("userID"),
                rs.getString("userName"),
                rs.getString("userEmail"),    
                rs.getString("userPassword"),    
                rs.getString("role")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

    
}
