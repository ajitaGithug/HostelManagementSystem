<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.User"%>
<%@ page import="com.hostel.model.Admin"%>
<%
    User user = (User) session.getAttribute("user");
    Admin admin = (Admin) session.getAttribute("admin");
    if (user == null || admin == null) {
        response.sendRedirect("login.jsp"); // Redirect if session is invalid
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Kerawang College</title>
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
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: grid;
            grid-template-columns: 250px 1fr;
            min-height: 100vh;
            background-color: var(--light-gray);
            color: var(--text-dark);
        }

        .sidebar {
            background-color: var(--white);
            padding: 30px 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            /* Add Flexbox properties to center content vertically */
            display: flex;
            flex-direction: column;
            align-items: center; /* Centers items horizontally */
        }

        .sidebar-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 0.5px solid #eee;
            width: 100%; /* Ensure it takes full width of the sidebar */
            display: flex; /* Use flexbox for centering image within header */
            justify-content: center; /* Center image horizontally */
            align-items: center; /* Center image vertically if needed */
        }

        .sidebar-header img {
            width: 125px;
            height: auto; /* Maintain aspect ratio */
            /* Removed display: block; as flexbox will handle centering */
            /* You can add margin-bottom if you want space below the logo */
        }

        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
            width: 100%; /* Ensure the menu takes full width */
        }

        .sidebar-menu li {
            margin-bottom: 10px;
        }

        .sidebar-menu a {
            display: block;
            color: var(--text-dark);
            text-decoration: none;
            padding: 12px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .sidebar-menu a:hover, .sidebar-menu a.active {
            background-color: var(--light-gray);
        }

        .sidebar-menu a.active {
            font-weight: 600;
            color: var(--primary-purple);
        }

        .main-content {
            padding: 0; /* remove padding so header can go edge-to-edge */
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(135deg, var(--primary-purple), var(--dark-purple));
            color: var(--white);
            padding: 20px 30px;
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .dashboard-title {
            font-size: 30px;
            color: var(--white);
            font-weight: 600;
            margin: 0;
            flex-grow: 1; /* Allows the title to take available space */
            text-align: left; /* Keep title to the left */
        }

        .staff-info-container {
            display: flex;
            align-items: center;
            gap: 15px;
            background: rgba(255, 255, 255, 0.15);
            padding: 10px 20px;
            border-radius: 50px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .staff-info h3 {
            font-size: 16px;
            font-weight: 600;
            margin: 0;
        }

        .staff-info p {
            font-size: 14px;
            margin: 3px 0 0;
            color: var(--light-purple);
        }

        .profile-pic {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background-color: var(--light-purple);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: var(--primary-purple);
            border: 2px solid var(--white);
        }


        .stats-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
            margin: 30px;
        }

        .stat-card {
            background-color: var(--white);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            border-top: 4px solid var(--primary-purple);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }

        .stat-card h2 {
            margin: 0;
            font-size: 2.5em;
            color: var(--primary-purple);
            font-weight: 700;
        }

        .stat-card p {
            margin: 10px 0 0;
            color: var(--text-medium);
            font-weight: 600;
            font-size: 16px;
        }

        .announcements {
            background-color: var(--white);
            border-radius: 10px;
            padding: 25px;
            margin: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            border-top: 4px solid var(--primary-purple);
        }

        .announcements h2 {
            color: var(--primary-purple);
            margin-top: 0;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light-purple);
            font-size: 22px;
        }

        .announcements ul {
            list-style-type: disc;
            padding-left: 20px;
            margin: 0;
        }

        .announcements li {
            margin-bottom: 10px;
        }

        .datetime {
            color: var(--text-medium);
            font-size: 14px;
            text-align: right;
            margin: 0 30px 25px;
            font-weight: 500;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <img src="https://1000logos.net/wp-content/uploads/2023/05/UiTM-Logo.png" alt="UiTM Logo">
        </div>

        <ul class="sidebar-menu">
            <li><a href="admin-dashboard.jsp" class="active">DASHBOARD</a></li>
            <li><a href="admin-profile.jsp">PROFILE</a></li>
            <li><a href="admin-manage-room.jsp">MANAGE ROOM</a></li>
            <li><a href="admin-booking.jsp">BOOKING</a></li>
            <li><a href="admin-manage-student.jsp">MANAGE STUDENT</a></li>
            <li><a href="admin-checkinout.jsp">CHECK IN/OUT</a></li>
            <li><a href="admin-maintenance.jsp">MAINTENANCE</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
            <li><a href="info.jsp">INFO</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1 class="dashboard-title">ADMIN DASHBOARD</h1>
            <div class="staff-info-container">
                <div class="admin-info">
                    <!-- You can display admin name, userID, etc. here -->
                    <h3>
                        <%-- Example: --%>
                        <%= user.getUserName() %>
                    </h3>
                    <p>
                        <%= user.getUserID() %>
                    </p>
                    <p>
                        <%= admin.getPosition() %>
                    </p>
                </div>
                <div class="profile-pic">
                    <i class="fas fa-user-circle"></i>
                </div>
            </div>
        </div>

        <div class="stats-container">
            <div class="stat-card">
                <h2>180</h2>
                <p>TOTAL ROOM</p>
            </div>
            <div class="stat-card">
                <h2>95</h2>
                <p>ROOM ASSIGNED</p>
            </div>
            <div class="stat-card">
                <h2>85</h2>
                <p>ROOM AVAILABLE</p>
            </div>
            <div class="stat-card">
                <h2>3</h2>
                <p>MAINTENANCE</p>
            </div>
        </div>

        <div class="announcements">
            <h2>KERAWANG COLLEGE ANNOUNCEMENTS</h2>
            <ul>
                <li>Mandatory fire drill on 18 May 2024 at 10:00 AM. All residents must evacuate to the assembly point (main field). Attendance is compulsory.</li>
                <li>Join us on 20 May 2024 (9:00 AM–3:00 PM) for our annual Open Day! Tour the facilities, meet staff, and enjoy free workshops. Register at the lobby desk.</li>
            </ul>
        </div>

        <div class="datetime" id="currentDateTime"></div>
    </div>

    <script>
        function updateDateTime() {
            const now = new Date();

            const days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
            const months = ["January", "February", "March", "April", "May", "June",
                            "July", "August", "September", "October", "November", "December"];

            const dayName = days[now.getDay()];
            const month = months[now.getMonth()];
            const date = now.getDate();
            const year = now.getFullYear();

            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            const seconds = String(now.getSeconds()).padStart(2, '0');

            const formatted = `${dayName}, ${date} ${month} ${year} - ${hours}:${minutes}:${seconds}`;
            document.getElementById("currentDateTime").textContent = formatted;
        }

        setInterval(updateDateTime, 1000);
        updateDateTime(); // call once immediately
    </script>
</body>
</html>