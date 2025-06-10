package com.hostel.controller;

import com.hostel.model.Student;
import com.hostel.model.DAO.StudentDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CompleteStudentProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student student = new Student();

        student.setUserID(request.getParameter("userID"));
        student.setUserName(request.getParameter("userName"));
        student.setUserEmail(request.getParameter("userEmail"));
        student.setUserPassword(request.getParameter("userPassword"));
        student.setRole(request.getParameter("role"));

        student.setMatricNo(request.getParameter("matricNo"));
        student.setPhoneNo(request.getParameter("phoneNo"));
        student.setAddress(request.getParameter("address"));
        student.setGender(request.getParameter("gender"));
        student.setProgram(request.getParameter("program"));
        student.setYearOfStudy(Integer.parseInt(request.getParameter("yearOfStudy")));
        student.setInternship(Boolean.parseBoolean(request.getParameter("internship")));
        student.setGuardianName(request.getParameter("guardianName"));
        student.setGuardianContact(request.getParameter("guardianContact"));
        student.setEmergencyContact(request.getParameter("emergencyContact"));

        // Save to DB
        StudentDAO dao = new StudentDAO();
        dao.insertStudent(student);

        // Set session and redirect
        HttpSession session = request.getSession();
        session.setAttribute("student", student);

        response.sendRedirect("student-dashboard.jsp");
    }
}
