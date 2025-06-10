package com.hostel.controller;

import com.hostel.model.DAO.StudentDAO;
import com.hostel.model.Student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class RegisterStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Student s = new Student();
        s.setUserID(req.getParameter("userID"));
        s.setUserName(req.getParameter("userName"));
        s.setUserEmail(req.getParameter("userEmail"));
        s.setUserPassword(req.getParameter("userPassword"));

        s.setMatricNo(req.getParameter("matricNo"));
        s.setPhoneNo(req.getParameter("phoneNo"));
        s.setAddress(req.getParameter("address"));
        s.setGender(req.getParameter("gender"));
        s.setProgram(req.getParameter("program"));
        s.setYearOfStudy(Integer.parseInt(req.getParameter("yearOfStudy")));
        s.setInternship(Boolean.parseBoolean(req.getParameter("internship")));
        s.setGuardianName(req.getParameter("guardianName"));
        s.setGuardianContact(req.getParameter("guardianContact"));
        s.setEmergencyContact(req.getParameter("emergencyContact"));
        s.setRoomID(req.getParameter("roomID"));

        StudentDAO dao = new StudentDAO();
        boolean success = dao.registerStudent(s);

        if (success) {
            res.sendRedirect("register-student.jsp?status=success");
        } else {
            res.sendRedirect("register-student.jsp?status=fail");
        }
    }
}
