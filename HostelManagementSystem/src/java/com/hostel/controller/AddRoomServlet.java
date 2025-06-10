package com.hostel.controller;

import com.hostel.model.DAO.RoomDAO;
import com.hostel.model.Room;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AddRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String roomID = request.getParameter("roomID");
        String blockName = request.getParameter("blockName");
        String status = request.getParameter("status");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        int currentOccupancy = Integer.parseInt(request.getParameter("currentOccupancy"));

        Room room = new Room(roomID, blockName, status, capacity, currentOccupancy);
        RoomDAO dao = new RoomDAO();
        boolean success = dao.addRoom(room);

        if (success) {
            request.setAttribute("message", "Room registered successfully.");
            
        } else {
            request.setAttribute("message", "Room registration failed.");
        }

        RequestDispatcher rd = request.getRequestDispatcher("add_room.jsp");
        rd.forward(request, response);
    }
}
