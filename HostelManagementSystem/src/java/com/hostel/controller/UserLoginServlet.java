package com.hostel.controller;

// Import necessary classes
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.hostel.model.User;
import com.hostel.model.DAO.UserDAO; // Make sure this path matches your project structure

/**
 * Servlet for handling user login.
 */
public class UserLoginServlet extends HttpServlet {

    /**
     * Handles HTTP GET requests.
     * Usually, login is POST, but you can show the login page here if needed.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to login page if someone tries to access via GET
        response.sendRedirect("login.jsp");
    }

    /**
     * Handles HTTP POST requests (login form submission).
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Retrieve login form parameters
        String userid = request.getParameter("userid"); // User ID from form
        String password = request.getParameter("password"); // Password from form
        String role = request.getParameter("role"); // Role from form (optional, depends on your form)

        // 2. Authenticate user using DAO
        //loginUser not static, so have to create instance of UserDAO
        UserDAO dao = new UserDAO();
        User user = dao.loginUser(userid, password);

        // 3. Check if user exists and role matches
        if (user != null && (role == null || user.getRole().equalsIgnoreCase(role))) {

            // 4. Store user in session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // 5. Redirect to dashboard based on role
            String userRole = user.getRole().toLowerCase();
            switch (userRole) {
                case "admin":
                    response.sendRedirect("admin-dashboard.jsp");
                    break;
                case "staff":
                    response.sendRedirect("staff-dashboard.jsp");
                    break;
                case "student":
                    response.sendRedirect("student-dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("error.jsp");
            }
        } else {
            // 6. If login fails, show error on login page
            request.setAttribute("error", "Invalid user ID or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     */
    @Override
    public String getServletInfo() {
        return "Handles user login authentication and session management.";
    }
}
