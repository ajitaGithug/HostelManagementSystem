<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.User"%>
<%@ page import="com.hostel.model.Staff"%>
<%
    User user = (User) session.getAttribute("user");
    Staff staff = (Staff) session.getAttribute("staff");
    if (user == null || staff == null) {
        response.sendRedirect("login.jsp"); // Redirect if session is invalid
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Student - Kolej Kerawang</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary-purple: #6a3093;
            --secondary-purple: #9b59b6;
            --light-purple: #e8d6ff;
            --dark-purple: #4b2d73;
            --white: #ffffff;
            --light-gray: #f5f5f5;
            --text-dark: #333333;
            --text-medium: #555555;
            --status-green: #4CAF50;
            --status-red: #F44336;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-gray);
        }

        .container {
            display: grid;
            grid-template-columns: 250px 1fr;
            min-height: 100vh;
        }

        .sidebar {
            background: linear-gradient(180deg, var(--primary-purple), var(--dark-purple));
            color: var(--white);
            padding: 30px 20px;
        }

        .sidebar-header h1 {
            margin: 0;
            font-size: 24px;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
        }

        .sidebar-menu a {
            display: block;
            color: var(--white);
            text-decoration: none;
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 5px;
            font-weight: 500;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }

        .sidebar-menu a.active {
            background-color: var(--secondary-purple);
        }

        .main-content {
            padding: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .header h2 {
            color: var(--primary-purple);
            font-size: 28px;
        }

        .student-box {
            background-color: var(--light-purple);
            padding: 25px;
            border-radius: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--white);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: var(--secondary-purple);
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .status-approved {
            color: var(--status-green);
            font-weight: 500;
        }

        .status-failed {
            color: var(--status-red);
            font-weight: 500;
        }

        .action-icon {
            color: var(--secondary-purple);
            cursor: pointer;
            font-size: 18px;
        }

        .section-divider {
            border-top: 2px solid var(--secondary-purple);
            margin: 20px 0;
            padding-top: 20px;
        }

        .staff-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .staff-info div {
            font-weight: 500;
            color: var(--text-dark);
        }

        .add-student-btn {
            background-color: var(--primary-purple);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            display: block;
            margin: 20px auto 0;
        }

        .add-student-btn:hover {
            background-color: var(--dark-purple);
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1>STAFF</h1>
        </div>
        <ul class="sidebar-menu">
            <li><a href="staff-dashboard.jsp">DASHBOARD</a></li>
            <li><a href="staff-profile.jsp">PROFILE</a></li>
            <li><a href="staff-manage-room.jsp">MANAGE ROOM</a></li>
            <li><a href="staff-booking.jsp">BOOKING</a></li>
            
            <li><a href="staff-manage-student" class="active">MANAGE STUDENT</a></li>
            
            <li><a href="staff-checkinout.jsp">CHECK IN/OUT</a></li>
            <li><a href="staff-maintenance.jsp">MAINTENANCE</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
            <li><a href="info.jsp">INFO</a></li>
            
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2>Manage Student</h2>
        </div>
        
        <div class="student-box">
            <h3 class="section-title">SUTERA</h3>
            
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Matric No</th>
                        <th>Name</th>
                        <th>IC Number</th>
                        <th>Program</th>
                        <th>Part</th>
                        <th>Phone No</th>
                        <th>College Approval</th>
                        <th>Action</th>
                    </tr>
                </thead>
                
                
                <tbody>
<%
    List<com.hostel.model.Student> studentList = (List<com.hostel.model.Student>) request.getAttribute("studentList");
    int no = 1;
    if (studentList != null && !studentList.isEmpty()) {
        for (com.hostel.model.Student s : studentList) {
%>
    <tr>
        <td><%= no++ %></td>
        <td><%= s.getMatricNo() %></td>
        <td><%= s.getUserName() %></td>
        *<td><!-- If you have IC Number: --></td>*/
        <td><%= s.getProgram() %></td>
        <td><%= s.getYearOfStudy() %></td>
        <td><%= s.getPhoneNo() %></td>
        <td class="status-approved">APPROVED</td>
        <td>
            <i class="fas fa-edit action-icon" title="Edit"></i>
            <i class="fas fa-trash action-icon" title="Delete" style="margin-left: 10px; color: var(--status-red);"></i>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="9">No students found.</td>
    </tr>
<%
    }
%>
</tbody>
                
                
            </table>
            <a href="staff-register-student.jsp" class="add-student-btn">ADD STUDENT</a>
        </div>
    </div>
</div>
</body>
</html>