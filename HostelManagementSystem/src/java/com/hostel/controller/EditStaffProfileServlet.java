package com.hostel.controller;

import com.hostel.model.DAO.StaffDAO;
import com.hostel.model.Staff;
import com.hostel.model.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;

@MultipartConfig(maxFileSize = 1024 * 1024 * 5) // Max 5MB photo
public class EditStaffProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String staffID = request.getParameter("userID");
        String position = request.getParameter("position");
        String contactNo = request.getParameter("contactNo");
        int minMeritRequired = Integer.parseInt(request.getParameter("minMeritRequired"));

        // Handle uploaded photo
        Part filePart = request.getPart("photo");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Create upload folder if not exist
        String uploadPath = getServletContext().getRealPath("") + File.separator + "staff_photos";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Save file to disk
        String photoPath = "staff_photos/" + fileName;
        filePart.write(uploadPath + File.separator + fileName);

        // Populate Staff object
        Staff staff = new Staff();
        staff.setUserID(staffID);
        staff.setPosition(position);
        staff.setContactNo(contactNo);
        staff.setMinMeritRequired(minMeritRequired);
        staff.setPhoto(photoPath);

        // Update in DB using DAO
        try (Connection conn = DBConnection.getConnection()) {
            StaffDAO dao = new StaffDAO();
            dao.updateStaffProfile(staff);
            response.sendRedirect("staff-profile.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("staff-profile.jsp?error=true");
        }
    }

    @Override
    public String getServletInfo() {
        return "Handles staff profile update including photo upload.";
    }
}
