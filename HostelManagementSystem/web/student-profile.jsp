<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.Student" %>
<%
    Student student = (Student) session.getAttribute("student");
    if (student == null) {
        response.sendRedirect("login.jsp"); // Redirect if session is invalid
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Profile - Kerawang College</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 40px;
        }
        .profile-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px;
        }
        h1 {
            text-align: center;
            color: #6a3093;
        }
        .profile-row {
            margin: 20px 0;
        }
        .label {
            font-weight: 600;
            color: #555;
            width: 200px;
            display: inline-block;
        }
        .value {
            color: #333;
        }
        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            background-color: #6a3093;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .back-link:hover {
            background-color: #512e7f;
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <a href="student-dashboard.jsp" class="back-link">← Back</a>
        <h1>My Profile</h1>
        <div class="profile-row">
            <span class="label">User ID:</span>
            <span class="value"><%= student.getUserID() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Name:</span>
            <span class="value"><%= student.getUserName() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Email:</span>
            <span class="value"><%= student.getUserEmail() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Phone:</span>
            <span class="value"><%= student.getPhoneNo() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Matric No:</span>
            <span class="value"><%= student.getMatricNo() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Gender</span>
            <span class="value"><%= student.getGender() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Program</span>
            <span class="value"><%= student.getProgram() %></span>
        </div>
        
        <div class="profile-row">
            <span class="label">Year of Study</span>
            <span class="value"><%= student.getYearOfStudy() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Guardian Name</span>
            <span class="value"><%= student.getGuardianName() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Guardian Contact</span>
            <span class="value"><%= student.getGuardianContact() %></span>
        </div>
        <div class="profile-row">
            <span class="label">Address</span>
            <span class="value"><%= student.getAddress() %></span>
        </div>
        <div class="profile-row">
            <span class="label">EmergencyContact</span>
            <span class="value"><%= student.getEmergencyContact() %></span>
        </div>
        <div class="profile-row">
            <span class="label">RoomID</span>
            <span class="value"><%= student.getRoomID() %></span>
        </div>
        
    </div>


</body>
</html>
