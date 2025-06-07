/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.hostel.controller;

import com.hostel.model.DAO.StudentDAO;
import com.hostel.model.Student;
import com.hostel.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

/**
 *
 * @author hazee
 */
public class CompleteProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null || !"student".equals(user.getRole())) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        // Read form inputs
        String matricNo = request.getParameter("matricNo");
        String phoneNo = request.getParameter("phoneNo");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String program = request.getParameter("program");
        int yearOfStudy = Integer.parseInt(request.getParameter("yearOfStudy"));
        boolean internship = "on".equals(request.getParameter("internship"));
        String guardianName = request.getParameter("guardianName");
        String guardianContact = request.getParameter("guardianContact");
        String emergencyContact = request.getParameter("emergencyContact");
        
        // create Student object from session + form
        Student student = new Student();
        student.setUserID(user.getUserID());
        student.setUserName(user.getUserName());
        student.setUserEmail(user.getUserEmail());
        student.setUserPassword(user.getUserPassword());
        student.setRole("student");

        student.setMatricNo(matricNo);
        student.setPhoneNo(phoneNo);
        student.setAddress(address);
        student.setGender(gender);
        student.setProgram(program);
        student.setYearOfStudy(yearOfStudy);
        student.setInternship(internship);
        student.setGuardianName(guardianName);
        student.setGuardianContact(guardianContact);
        student.setEmergencyContact(emergencyContact);
        student.setRoomID(null); // Not assigned yet

        
        try {
            StudentDAO studentDAO = new StudentDAO();
            studentDAO.insertStudentDetails(student);
            response.sendRedirect("student-dashboard.jsp");
            
        } catch (SQLException | IOException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
            }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
}
