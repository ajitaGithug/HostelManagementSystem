package com.hostel.controller;

import com.hostel.model.Staff;
import com.hostel.model.DAO.StaffDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class CompleteStaffProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Get values from form
        String userID = request.getParameter("userID");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPassword = request.getParameter("userPassword");
        String role = request.getParameter("role");

        String contactNo = request.getParameter("contactNo");
        String position = request.getParameter("position");
        int minMeritRequired = Integer.parseInt(request.getParameter("minMeritRequired"));
        String photo = request.getParameter("photo");

        // Create Staff object
        Staff staff = new Staff(userID, userName, userEmail, userPassword, role,
                                position, contactNo, minMeritRequired, photo);

        // Save to DB
        StaffDAO dao = new StaffDAO();
        boolean success = dao.insertStaff(staff);

        if (success) {
            // Set session attribute and redirect
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            response.sendRedirect("staff-dashboard.jsp");
        } else {
            request.setAttribute("error", "Profile completion failed. Please try again.");
            request.getRequestDispatcher("staff-complete-profile.jsp").forward(request, response);
        }
    }
}
