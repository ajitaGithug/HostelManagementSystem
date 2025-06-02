<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking - Kolej Kerawang</title>
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

        .booking-box {
            background-color: var(--light-purple);
            padding: 25px;
            border-radius: 10px;
        }

        .college-selector {
            margin-bottom: 20px;
        }

        .college-selector label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-dark);
        }

        .college-selector select {
            width: 200px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: var(--white);
            font-family: 'Poppins', sans-serif;
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

        .status-indicator {
            display: inline-block;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin: 0 2px;
        }

        .status-approved {
            background-color: var(--status-green);
        }

        .status-pending {
            background-color: var(--status-red);
        }

        .button-container {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .approve-all-btn {
            background-color: var(--primary-purple);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
        }

        .approve-all-btn:hover {
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
            <li><a href="dashboard.jsp">DASHBOARD</a></li>
            <li><a href="profile.jsp">PROFILE</a></li>
            <li><a href="manage-room.jsp">MANAGE ROOM</a></li>
            <li><a href="booking.jsp" class="active">BOOKING</a></li>
            <li><a href="manage-student.jsp">MANAGE STUDENT</a></li>
            <li><a href="checkinout.jsp">CHECK IN/OUT</a></li>
            <li><a href="maintenance.jsp">MAINTENANCE</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
            <li><a href="info.jsp">INFO</a></li>
            
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h2>Booking Management</h2>
        </div>
        
        <div class="booking-box">
            <div class="college-selector">
                <label for="college">Select College:</label>
                <select id="college" name="college">
                    <option value="SUTERA">SUTERA</option>
                    <option value="KASA">KASA</option>
                </select>
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th>Room</th>
                        <th>Matric No.</th>
                        <th>Student Name</th>
                        <th>Booking Date</th>
                        <th>Booking Semester</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>5000</td>
                        <td>202309602</td>
                        <td>Moisorah binti Hakim</td>
                        <td>09/03/2005</td>
                        <td>Mac/Ogos 2025</td>
                        <td>03/03/2003</td>
                        <td>09/06/2003</td>
                        <td>
                            <span class="status-indicator status-approved"></span>
                            <span class="status-indicator status-pending"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>5001</td>
                        <td>202308607</td>
                        <td>Lisa binti Ahmad</td>
                        <td>04/03/2005</td>
                        <td>Mac/Ogos 2025</td>
                        <td>05/03/2003</td>
                        <td>09/06/2003</td>
                        <td>
                            <span class="status-indicator status-approved"></span>
                            <span class="status-indicator status-pending"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>1000</td>
                        <td>202310806</td>
                        <td>Rahul bin Ali</td>
                        <td>09/03/2005</td>
                        <td>Mac/Ogos 2025</td>
                        <td>03/03/2003</td>
                        <td>09/06/2003</td>
                        <td>
                            <span class="status-indicator status-approved"></span>
                            <span class="status-indicator status-pending"></span>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <div class="button-container">
                <button class="approve-all-btn">APPROVE ALL</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>