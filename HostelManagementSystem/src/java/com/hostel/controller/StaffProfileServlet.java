package com.hostel.controller;

import com.hostel.model.DAO.StaffDAO;
import com.hostel.model.Staff;
import com.hostel.model.User;
import com.hostel.model.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

public class StaffProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            HttpSession session = request.getSession();
            User user = (User) request.getSession().getAttribute("user");
            String staffID = null;

            
            if (user != null && "STAFF".equalsIgnoreCase(user.getRole())) {
            staffID = user.getUserID();
    
            } else {
            response.sendRedirect("error.jsp"); // Optional: handle unauthorized access
            return;
            }


        try (Connection conn = DBConnection.getConnection()) {
            StaffDAO staffDAO = new StaffDAO();
            Staff staff = staffDAO.getStaffByUserID(staffID);
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("staff-profile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String staffID = request.getParameter("userID");

        Staff staff = new Staff();
        staff.setUserID(staffID);
        staff.setUserName(request.getParameter("userName"));
        staff.setUserEmail(request.getParameter("userEmail"));
        staff.setContactNo(request.getParameter("contactNo"));
        staff.setPosition(request.getParameter("position"));
        staff.setMinMeritRequired(Integer.parseInt(request.getParameter("minMeritRequired")));
        staff.setPhoto(request.getParameter("photo")); // Optional: use upload or default
        staff.setUserPassword(request.getParameter("userPassword")); // Ideally hash this!

        try (Connection conn = DBConnection.getConnection()) {
            StaffDAO staffDAO = new StaffDAO();
            boolean updated = staffDAO.updateStaffProfile(staff);
            if (updated) {
                request.setAttribute("message", "Profile updated successfully!");
            } else {
                request.setAttribute("message", "Profile update failed.");
            }
            request.setAttribute("staff", staff);
            request.getRequestDispatcher("/staff-profile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
