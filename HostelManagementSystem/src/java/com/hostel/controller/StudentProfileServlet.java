/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.hostel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hostel.model.Student;
import com.hostel.model.DAO.StudentDAO;
import java.io.IOException;

/**
 *
 * @author hazee
 */



public class StudentProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get current student from session
        Student student = (Student) request.getSession().getAttribute("currentUser");
        if (student == null) {
       // Redirect to login or error page
       response.sendRedirect("login.jsp");
       return;
   }
        
        // Optionally, fetch latest from DB:
         StudentDAO dao = new StudentDAO();
         student = dao.getStudentByUserID(student.getUserID());

        // Check if profile is complete (simple check: phoneNo or address is null/empty)
        boolean isComplete = student.getPhoneNo() != null && !student.getPhoneNo().isEmpty()
                && student.getAddress() != null && !student.getAddress().isEmpty()
                && student.getGender() != null && !student.getGender().isEmpty()
                && student.getProgram() != null && !student.getProgram().isEmpty()
                && student.getYearOfStudy() > 0
                && student.getGuardianName() != null && !student.getGuardianName().isEmpty()
                && student.getGuardianContact() != null && !student.getGuardianContact().isEmpty()
                && student.getEmergencyContact() != null && !student.getEmergencyContact().isEmpty();

        request.setAttribute("student", student);
        request.setAttribute("isComplete", isComplete);

        request.getRequestDispatcher("student-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Only allow first-time profile completion
        Student student = (Student) request.getSession().getAttribute("currentUser");

        // Get form data
        String phoneNo = request.getParameter("phoneNo");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String program = request.getParameter("program");
        int yearOfStudy = Integer.parseInt(request.getParameter("yearOfStudy"));
        boolean internship = "on".equals(request.getParameter("internship"));
        String guardianName = request.getParameter("guardianName");
        String guardianContact = request.getParameter("guardianContact");
        String emergencyContact = request.getParameter("emergencyContact");

        // Update student object
        student.setPhoneNo(phoneNo);
        student.setAddress(address);
        student.setGender(gender);
        student.setProgram(program);
        student.setYearOfStudy(yearOfStudy);
        student.setInternship(internship);
        student.setGuardianName(guardianName);
        student.setGuardianContact(guardianContact);
        student.setEmergencyContact(emergencyContact);

        // Update in DB
        StudentDAO dao = new StudentDAO();
        dao.updateStudentProfile(student);

        // Update session
        request.getSession().setAttribute("currentUser", student);

        // Redirect to GET to show profile
        response.sendRedirect("student-profile");
    }
}
