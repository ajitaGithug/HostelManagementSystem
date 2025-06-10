package com.hostel.model.DAO;

import com.hostel.model.Admin;
import com.hostel.model.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {

    /**
     * Inserts additional details into the admin table.
     */
    public boolean insertAdmin(Admin admin) {
        String sql = "INSERT INTO admin (userID, contactNo, position, minMeritRequired) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, admin.getUserID());
            stmt.setString(2, admin.getContactNo());
            stmt.setString(3, admin.getPosition());
            stmt.setInt(4, admin.getMinMeritRequired());
            
            int rows = stmt.executeUpdate();

            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Updates admin profile in the admin table.
     */
    public boolean updateAdminProfile(Admin admin) {
        String sql = "UPDATE admin SET contactNo = ?, position = ?, minMeritRequired = ? WHERE userID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, admin.getContactNo());
            stmt.setString(2, admin.getPosition());
            stmt.setInt(3, admin.getMinMeritRequired());
            stmt.setString(4, admin.getUserID());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Retrieves an Admin object by userID (JOIN with user table).
     */
    public Admin getAdminByUserID(String userID) {
        String sql = "SELECT u.userID, u.userName, u.userEmail, u.userPassword, u.role, " +
                     "a.contactNo, a.position, a.minMeritRequired " +
                     "FROM user u JOIN admin a ON u.userID = a.userID WHERE u.userID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, userID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Admin(
                    rs.getString("userID"),
                    rs.getString("userName"),
                    rs.getString("userEmail"),
                    rs.getString("userPassword"),
                    rs.getString("role"),
                    rs.getString("contactNo"),
                    rs.getString("position"),
                    rs.getInt("minMeritRequired")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
