package com.hostel.model.DAO;

import com.hostel.model.Booking;
import com.hostel.model.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

public class BookingDAO {

    public static boolean saveBooking(Booking booking) {
        String sql = "INSERT INTO Booking (userID, roomID, bookingDate, status) VALUES (?, ?, ?, ?)";
            
        try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql))    {
            ps.setString(1, booking.getUserID());
            ps.setString(2, booking.getRoomID());
            ps.setString(3, booking.getBookingDate());
            ps.setString(4, booking.getStatus());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int getMinMeritFromStaff() {
        String sql = "SELECT MIN(minMeritRequired) AS minMerit FROM Staff";
            
        try (Connection con = DBConnection.getConnection();
             Statement stmt = con.createStatement()) {
            
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                return rs.getInt("minMerit");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Integer.MAX_VALUE; // no staff configured
    }

    public static void incrementRoomOccupancy(String roomID) {
        String sql = "UPDATE Room SET currentOccupancy = currentOccupancy + 1 WHERE roomID = ?";
            
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, roomID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
