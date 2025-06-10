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
}
