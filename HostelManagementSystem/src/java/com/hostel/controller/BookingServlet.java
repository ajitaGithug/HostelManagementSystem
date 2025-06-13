package com.hostel.controller;

import com.hostel.model.DAO.BookingDAO;
import com.hostel.model.DAO.RoomDAO;
import com.hostel.model.DAO.StaffDAO;
import com.hostel.model.DAO.UserDAO;
import com.hostel.model.Booking;
import com.hostel.model.User;
import com.hostel.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;


public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Student student = (Student) session.getAttribute("student");
        
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }

        String roomID = request.getParameter("roomID");
        double studentMerit = student.getMerit(); // assume User model has merit
        int minMeritRequired = StaffDAO.getLatestMinMeritRequired(); // returns int
        String bookingStatus = (studentMerit >= minMeritRequired) ? "approved" : "pending";

        Booking booking = new Booking();
        booking.setUserID(user.getUserID());
        booking.setRoomID(roomID);
        booking.setBookingDate(LocalDate.now().toString());
        booking.setStatus(bookingStatus);

        boolean success = BookingDAO.saveBooking(booking);

        if (success) {
            if ("approved".equals(bookingStatus) && RoomDAO.isRoomAvailable(roomID)) {
                // optionally update room occupancy
                RoomDAO.incrementRoomOccupancy(roomID);
            }
            response.sendRedirect("bookingSuccess.jsp");
        } else {
            response.sendRedirect("bookingError.jsp");
        }
    }
}
