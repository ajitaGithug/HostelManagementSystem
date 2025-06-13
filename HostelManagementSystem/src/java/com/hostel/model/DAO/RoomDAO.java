package com.hostel.model.DAO;

import com.hostel.model.Room;
import com.hostel.model.DBConnection;
import java.sql.*;

public class RoomDAO {

    public boolean addRoom(Room room) {
        boolean result = false;

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO Room (roomID, blockName, status, capacity, currentOccupancy) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, room.getRoomID());
            stmt.setString(2, room.getBlockName());
            stmt.setString(3, room.getStatus());
            stmt.setInt(4, room.getCapacity());
            stmt.setInt(5, room.getCurrentOccupancy());

            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
    public static void incrementRoomOccupancy(String roomID) {
    String sql = "UPDATE Room SET currentOccupancy = currentOccupancy + 1 WHERE roomID = ?";
    
    try (Connection con = DBConnection.getConnection()) {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, roomID);
        int rowsUpdated = ps.executeUpdate();
        System.out.println("Occupancy updated for roomID: " + roomID + " → Rows affected: " + rowsUpdated);
    } catch (Exception e) {
        e.printStackTrace();
    }
}
    public static boolean isRoomAvailable(String roomID) {
    String sql = "SELECT capacity, currentOccupancy FROM Room WHERE roomID = ?";
    
    try (Connection con = DBConnection.getConnection()) {
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, roomID);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            int capacity = rs.getInt("capacity");
            int current = rs.getInt("currentOccupancy");
            return current < capacity;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}


}
