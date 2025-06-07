<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Room - Kolej Kerawang</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        <%-- Reuse the same root and layout styles from your Profile page --%>
        :root {
            --primary-purple: #6a3093;
            --secondary-purple: #9b59b6;
            --light-purple: #e8d6ff;
            --dark-purple: #4b2d73;
            --white: #ffffff;
            --light-gray: #f5f5f5;
            --text-dark: #333333;
            --text-medium: #555555;
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

        .room-box {
            background-color: var(--light-purple);
            padding: 25px;
            border-radius: 10px;
        }

        .room-box select {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 20px;
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

        .action-icons i {
            margin: 0 8px;
            cursor: pointer;
            color: var(--secondary-purple);
        }

        .add-room-btn {
            background-color: var(--primary-purple);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 30px;
            float: right;
            font-weight: 500;
        }

        .add-room-btn:hover {
            background-color: var(--dark-purple);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="sidebar">
    <div class="sidebar-header">
        <h1>STAFF</h1>
    </div>
    <ul class="sidebar-menu">
        <li><a href="dashboard.jsp">DASHBOARD</a></li>
        <li><a href="profile.jsp">PROFILE</a></li>
        <li><a href="manage-room.jsp" class="active">MANAGE ROOM</a></li>
        <li><a href="booking.jsp">BOOKING</a></li>
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
            <h2>Manage Rooms</h2>
        </div>
        <div class="room-box">
            <label for="collegeSelect">College:</label>
            <select id="collegeSelect">
                <option value="SUTERA">SUTERA</option>
                <option value="DELIMA">KASA</option>
            </select>

            <table>
                <thead>
                <tr>
                    <th>No</th>
                    <th>Room Number</th>
                    <th>Room Level</th>
                    <th>Rate (RM)</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>S042</td>
                    <td>0</td>
                    <td>210.00</td>
                    <td>4</td>
                    <td>Available</td>
                    <td class="action-icons">
                        <i class="fas fa-edit"></i>
                        <i class="fas fa-trash-alt"></i>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>S059</td>
                    <td>0</td>
                    <td>210.00</td>
                    <td>4</td>
                    <td>Occupied</td>
                    <td class="action-icons">
                        <i class="fas fa-edit"></i>
                        <i class="fas fa-trash-alt"></i>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>S123</td>
                    <td>1</td>
                    <td>210.00</td>
                    <td>4</td>
                    <td>Occupied</td>
                    <td class="action-icons">
                        <i class="fas fa-edit"></i>
                        <i class="fas fa-trash-alt"></i>
                    </td>
                </tr>
                </tbody>
            </table>

            <button class="add-room-btn">ADD ROOM</button>
        </div>
    </div>
</div>
</body>
</html>
