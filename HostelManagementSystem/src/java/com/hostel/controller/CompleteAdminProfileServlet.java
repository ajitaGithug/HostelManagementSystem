package com.hostel.controller;

import com.hostel.model.Admin;
import com.hostel.model.DAO.AdminDAO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class CompleteAdminProfileServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userID = request.getParameter("userID");
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPassword = request.getParameter("userPassword");
        String role = request.getParameter("role");
        
        String contactNo = request.getParameter("contactNo");
        String position = request.getParameter("position");
        int minMeritRequired = Integer.parseInt(request.getParameter("minMeritRequired"));
        //String photo = request.getParameter("photo");
        
        Admin admin = new Admin(userID, userName, userEmail, userPassword, role,
                                contactNo, position, minMeritRequired);
        
        AdminDAO dao = new AdminDAO();
        boolean success = dao.insertAdmin(admin);
        
        if(success) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            response.sendRedirect("admin-dashboard.jsp");
        } else {
            request.setAttribute("error","Profile completion failed. Please try again.");
            request.getRequestDispatcher("admin-complete-profile.jsp").forward(request, response);
        }
    }
}