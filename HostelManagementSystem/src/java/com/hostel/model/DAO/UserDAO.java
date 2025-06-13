package com.hostel.model.DAO;

import com.hostel.model.User;
import com.hostel.model.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Data Access Object for User-related database operations.
 */
public class UserDAO {

    /**
     * Registers a new user in the database.
     * @param user The User object to register.
     * @return true if registration is successful, false otherwise.
     */
    public boolean registerUser(User user) {
        String sql = "INSERT INTO user (userID, userName, userEmail, userPassword, role) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
            
            // insert into user table
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUserID());
            stmt.setString(2, user.getUserName());
            stmt.setString(3, user.getUserEmail());
            stmt.setString(4, user.getUserPassword());
            stmt.setString(5, user.getRole());
            int result = stmt.executeUpdate();
            
            if( result > 0) {
                String roleInsertSql = null;
                switch(user.getRole().toLowerCase()){
                    case "admin":
                        roleInsertSql = "INSERT INTO admin(userID) VALUES (?)";
                        break;
                    case "staff":
                        roleInsertSql = "INSERT INTO staff(userID) VALUES (?)";
                        break;   
                    case "student":
                        roleInsertSql = "INSERT INTO student(userID) VALUES (?)";
                        break;
                    default:
                        return false;
                }
                
                PreparedStatement rolePs = conn.prepareStatement(roleInsertSql);
                rolePs.setString(1, user.getUserID());
                rolePs.executeUpdate();
                return true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Retrieves a user by email.
     * @param email The user's email.
     * @return User object if found, null otherwise.
     */
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

    /**
     * Counts the number of users with a specific role.
     * @param role The role to count.
     * @return The count of users with that role.
     */
    public int getRoleCount(String role) {
        String sql = "SELECT COUNT(*) FROM user WHERE role = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, role);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Authenticates a user by userID and password.
     * @param userid The user's ID.
     * @param password The user's password.
     * @return User object if credentials are correct, null otherwise.
     */
    public User loginUser(String userid, String password) {
        String sql = "SELECT * FROM user WHERE userID = ? AND userPassword = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, userid);
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public User getUserByUserID(String userID) {
    String sql = "SELECT * FROM user WHERE userID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, userID);
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
    
    public boolean updatePassword(String userID, String newPassword) {
    String sql = "UPDATE user SET userPassword = ? WHERE userID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, newPassword); // hash this in real systems
        stmt.setString(2, userID);
        return stmt.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
    
    public static boolean updatePasswordByUserID(String userID, String newPassword) {
    boolean updated = false;
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(
             "UPDATE user SET userPassword=? WHERE userID=?")) {

        stmt.setString(1, newPassword); // You should hash passwords in real apps
        stmt.setString(2, userID);

        int rows = stmt.executeUpdate();
        updated = rows > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return updated;
}


    
    
    
}
