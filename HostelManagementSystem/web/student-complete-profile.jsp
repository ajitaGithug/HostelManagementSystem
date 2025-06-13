<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complete Student Profile</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f9f5ff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .register-container {
            background-color: white;
            padding: 40px;
            width: 500px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2 {
            color: #5d3f95;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label, select, input {
            display: block;
            width: 100%;
            font-size: 15px;
        }
        input, select {
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 6px;
        }
        .radio-group {
            display: flex;
            gap: 10px;
            margin-top: 8px;
        }
        .submit-btn {
            background-color: #5d3f95;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .submit-btn:hover {
            background-color: #4a2e7a;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>Complete Your Student Profile</h2>
        <form action="CompleteStudentProfileServlet" method="post">
            <input type="hidden" name="userID" value="<%= user.getUserID() %>">
            <input type="hidden" name="userName" value="<%= user.getUserName() %>">
            <input type="hidden" name="userEmail" value="<%= user.getUserEmail() %>">
            <input type="hidden" name="userPassword" value="<%= user.getUserPassword() %>">
            <input type="hidden" name="role" value="student">

            <div class="form-group">
                <label for="matricNo">Matric No:</label>
                <input type="text" name="matricNo" required>
            </div>

            <div class="form-group">
                <label for="phoneNo">Phone No:</label>
                <input type="text" name="phoneNo" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <input type="text" name="address" required>
            </div>

            <div class="form-group">
                <label for="gender">Gender:</label>
                <input type="text" name="gender" required>
            </div>

            <div class="form-group">
                <label for="program">Program:</label>
                <input type="text" name="program" required>
            </div>

            <div class="form-group">
                <label for="yearOfStudy">Year of Study:</label>
                <input type="number" name="yearOfStudy" required>
            </div>

            <div class="form-group">
                <label>Internship:</label>
                <div class="radio-group">
                    <label><input type="radio" name="internship" value="true" required> Yes</label>
                    <label><input type="radio" name="internship" value="false"> No</label>
                </div>
            </div>

            <div class="form-group">
                <label for="guardianName">Guardian Name:</label>
                <input type="text" name="guardianName" required>
            </div>

            <div class="form-group">
                <label for="guardianContact">Guardian Contact:</label>
                <input type="text" name="guardianContact" required>
            </div>

            <div class="form-group">
                <label for="emergencyContact">Emergency Contact:</label>
                <input type="text" name="emergencyContact" required>
            </div>

            <button class="submit-btn" type="submit">Submit Profile</button>
        </form>
    </div>
</body>
</html>
