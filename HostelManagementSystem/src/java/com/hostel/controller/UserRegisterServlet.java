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
import java.sql.*;
import java.sql.SQLException;

import com.hostel.model.User;
import com.hostel.model.DAO.UserDAO;

import com.hostel.model.DBConnection;

/**
 *
 * @author hazee
 */
public class UserRegisterServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userid = request.getParameter("userid");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        User user = new User();
        user.setUserID(userid);
        user.setUserName(name);
        user.setUserEmail(email);
        user.setUserPassword(password);
        user.setRole(role);
        
        try{
        UserDAO userDB = new UserDAO();
        userDB.registerUser(user);
        response.sendRedirect("register-success.jsp");
        } catch(IOException e) {
            response.sendRedirect("register-fail.jsp");
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
