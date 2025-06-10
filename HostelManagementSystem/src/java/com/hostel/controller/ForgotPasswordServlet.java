/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.hostel.controller;

import com.hostel.model.DAO.UserDAO;
import com.hostel.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hazee
 */


    

public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userID = request.getParameter("userID");
        UserDAO dao = new UserDAO();
        User user = dao.getUserByUserID(userID);

        if (user != null) {
            String resetLink = "http://localhost:8080/HostelSystem/reset-password.jsp?userID=" + userID;

            // Send email (optional) or show link on screen (for testing)
            //EmailUtil.send(user.getUserEmail(), "Password Reset",
                //"Click here to reset your password: " + resetLink);

            request.setAttribute("msg", "Password reset:" + resetLink);
        } else {
            request.setAttribute("error", "User ID not found.");
        }

        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
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
