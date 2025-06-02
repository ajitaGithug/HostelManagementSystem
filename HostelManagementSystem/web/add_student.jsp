<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student - Kolej Kerawang</title>
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
            height: 100vh;
            overflow: hidden;
        }

        .container {
            display: grid;
            grid-template-columns: 250px 1fr;
            height: 100vh;
        }

        .sidebar {
            background: linear-gradient(180deg, var(--primary-purple), var(--dark-purple));
            color: var(--white);
            padding: 30px 20px;
            overflow-y: auto;
        }

        .sidebar-header h1 {
            margin: 0;
            font-size: 24px;
            text-align: center;
            margin-bottom: 30px;
            white-space: nowrap;
            padding: 0 10px;
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
            white-space: nowrap;
        }

        .sidebar-menu a:hover {
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }

        .main-content {
            padding: 20px;
            overflow-y: auto;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .header {
            margin-bottom: 20px;
        }

        .header h2 {
            color: var(--primary-purple);
            font-size: 28px;
            margin: 0;
            text-align: center; /* 👈 Add this */
        }

        .form-container {
            background-color: var(--light-purple);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            margin-bottom: 40px; /* Pushes bottom edge away */
        }


        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 15px;
        }


        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group label {
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-dark);
        }

        .form-group input, .form-group select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-family: 'Poppins', sans-serif;
            height: 40px;
            box-sizing: border-box;
            width: 100%;
        }

        .full-width {
            grid-column: span 2;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }

        .btn {
            padding: 8px 20px;
            border: none;
            border-radius: 8px; /* softer rounded corners */
            cursor: pointer;
            font-weight: 500;
            font-family: 'Poppins', sans-serif;
            font-size: 14px;
        }


        .btn-cancel {
            background-color: var(--light-gray);
            color: var(--text-dark);
        }

        .btn-cancel:hover {
            background-color: #e0e0e0;
        }

        .btn-submit {
            background-color: var(--primary-purple);
            color: white;
        }

        .btn-submit:hover {
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
            <h2>ADD STUDENT</h2>
        </div>
        
        <div class="form-container">
            <form>
                <div class="form-grid">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" required>
                    </div>
                    <div class="form-group">
                        <label for="internship">Internship</label>
                        <select id="internship" required>
                            <option value="">Select option</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="matricNo">Matric No</label>
                        <input type="text" id="matricNo" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" required>
                    </div>
                    <div class="form-group">
                        <label for="icNumber">IC Number</label>
                        <input type="text" id="icNumber" required>
                    </div>
                    <div class="form-group">
                        <label for="programPart">Program Part</label>
                        <input type="text" id="programPart" required>
                    </div>
                    <div class="form-group">
                        <label for="phoneNo">Phone No</label>
                        <input type="tel" id="phoneNo" required>
                    </div>
                    <div class="form-group">
                        <label for="guardianContact">Guardian Contact</label>
                        <input type="tel" id="guardianContact" required>
                    </div>
                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <input type="text" id="address" required>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="button" class="btn btn-cancel">Cancel</button>
                    <button type="submit" class="btn btn-submit">Save Student</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>