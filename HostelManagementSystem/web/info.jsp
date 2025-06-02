<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>College Information - Kerawang College</title>
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
            height: 100vh;
            overflow: hidden;
            background-color: var(--light-gray);
            color: var(--text-dark);
        }
        
        .sidebar {
            background: linear-gradient(180deg, var(--primary-purple), var(--dark-purple));
            color: var(--white);
            padding: 30px 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }
        
        .sidebar-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .sidebar-header h2 {
            margin: 0;
            font-size: 22px;
            font-weight: 600;
            letter-spacing: 1px;
        }
        
        .sidebar-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .sidebar-menu li {
            margin-bottom: 10px;
        }
        
        .sidebar-menu a {
            display: block;
            color: var(--white);
            text-decoration: none;
            padding: 12px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .sidebar-menu a:hover, .sidebar-menu a.active {
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateX(5px);
        }
        
        .sidebar-menu a.active {
            font-weight: 600;
            background-color: var(--secondary-purple);
        }
        
        .main-content {
            padding: 30px;
            overflow-y: auto;
            height: 100%;
            box-sizing: border-box;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .page-title {
            font-size: 28px;
            color: var(--primary-purple);
            font-weight: 600;
            margin: 0;
        }
        
        .staff-info {
            background-color: var(--white);
            border-radius: 10px;
            padding: 15px 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            min-width: 200px;
        }
        
        .staff-info h3 {
            color: var(--primary-purple);
            margin: 0;
            font-size: 18px;
        }
        
        .staff-info p {
            color: var(--text-medium);
            margin: 5px 0 0;
            font-size: 14px;
        }
        
        .info-container {
            display: flex;
            flex-direction: column;
            height: calc(100% - 100px);
        }
        
        .info-section {
            background-color: var(--white);
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 25px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        
        .info-section h2 {
            color: var(--primary-purple);
            margin-top: 0;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light-purple);
            font-size: 22px;
        }
        
        .info-buttons {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .info-btn {
            background-color: var(--white);
            color: var(--primary-purple);
            border: 2px solid var(--primary-purple);
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .info-btn:hover, .info-btn.active {
            background-color: var(--primary-purple);
            color: var(--white);
        }
        
        .info-content-container {
            flex: 1;
            overflow-y: auto;
            padding-right: 5px;
        }
        
        .info-content {
            display: none;
            padding: 15px;
            background-color: var(--light-purple);
            border-radius: 8px;
            animation: fadeIn 0.3s ease;
            height: 100%;
            box-sizing: border-box;
        }
        
        .info-content.active {
            display: block;
        }
        
        .info-content h3 {
            color: var(--dark-purple);
            margin-top: 0;
        }
        
        .info-content ul {
            padding-left: 20px;
            margin: 0;
        }
        
        .info-content li {
            margin-bottom: 8px;
        }
        
        .college-details {
            background-color: var(--light-purple);
            padding: 20px;
            border-radius: 8px;
        }
        
        .college-details h3 {
            color: var(--dark-purple);
            margin-top: 0;
            text-align: center;
        }
        
        .college-details p {
            margin-bottom: 15px;
            line-height: 1.6;
        }
        
        .return-btn {
            display: inline-block;
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            margin-top: 20px;
            transition: all 0.3s ease;
        }
        
        .return-btn:hover {
            background-color: var(--dark-purple);
            transform: translateY(-2px);
        }
        
        .datetime {
            color: var(--text-medium);
            font-size: 14px;
            text-align: right;
            margin-top: 15px;
            font-weight: 500;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* New styles for independent content switching */
        .main-content-area {
            display: none;
        }
        
        .main-content-area.active {
            display: block;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h1>STAFF</h1>
        </div>
        <ul class="sidebar-menu">
            <li><a href="dashboard.jsp">DASHBOARD</a></li>
            <li><a href="staff_profile.jsp">PROFILE</a></li>
            <li><a href="staff_room.jsp">MANAGE ROOM</a></li>
            <li><a href="staff_booking.jsp">BOOKING</a></li>
            <li><a href="staff_manage_student.jsp">MANAGE STUDENT</a></li>
            <li><a href="staff_checkinout.jsp">CHECK IN/OUT</a></li>
            <li><a href="staff_maintenance.jsp">MAINTENANCE</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
            <li><a href="staff_info.jsp" class="active">INFO</a></li>
            
        </ul>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1 class="page-title">COLLEGE INFORMATION</h1>
            <div class="staff-info">
                <h3>STAFF NAME</h3>
                <p>STAFF ID</p>
            </div>
        </div>
        
        <div class="info-container">
            <!-- Information Section -->
            <div class="info-section">
                <h2>COLLEGE RESOURCES</h2>
                
                <div class="info-buttons">
                    <button class="info-btn active" data-target="hostel-content">Hostel Details</button>
                    <button class="info-btn" data-target="faq-content">FAQs</button>
                    <button class="info-btn" data-target="schedule-content">SRK Schedule</button>
                </div>
                
                <!-- Hostel Details Content (shown by default) -->
                <div id="hostel-content" class="main-content-area active">
                    <div class="info-content-container">
                        <div class="info-content active">
                            <h3>Kolej Kerawang</h3>
                        <p>Kolej Kerawang has <strong>two (2) blocks</strong> which are <strong>Block Kasa and Block Sutera</strong>.</p>
                        <p><strong>Block Kasa</strong> is inhabited by <strong>male students</strong> with 3 floors and 124 rooms, with a basic capacity of 496 students.</p>
                        <p><strong>Block Sutera</strong> is inhabited by <strong>female students</strong> with 4 floors and 190 rooms, with a basic capacity of 760 students.</p>
                        <p>Both blocks are equipped with modern facilities including high-speed WiFi, study lounges, and 24/7 security services.</p>
                        </div>
                    </div>
                </div>
                
                <!-- FAQ Content (hidden by default) -->
                <div id="faq-content" class="main-content-area">
                    <div class="info-content-container">
                        <div class="info-content">
                            <h3>Frequently Asked Questions</h3>
                            <ul>
                                <li><strong>Q: How to apply for room change?</strong><br>
                                    A: Submit a formal request through the portal with valid reasons.</li>
                                <li><strong>Q: What are the visiting hours?</strong><br>
                                    A: 10AM-8PM daily, with registration at security gate.</li>
                                <li><strong>Q: How to report maintenance issues?</strong><br>
                                    A: Use the Maintenance section in the portal or inform the warden.</li>
                                <li><strong>Q: Are guests allowed overnight?</strong><br>
                                    A: No overnight guests without prior permission from management.</li>
                                <li><strong>Q: What's the penalty for late check-out?</strong><br>
                                    A: RM50 per day after official check-out date.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- SRK Schedule Content (hidden by default) -->
                <div id="schedule-content" class="main-content-area">
                    <div class="info-content-container">
                        <div class="info-content">
                            <h3>Student Residential Committee Schedule</h3>
                            <ul>
                                <li><strong>Monthly Meeting:</strong> First Monday of each month, 8PM at Block Kasa Common Hall</li>
                                <li><strong>Warden Office Hours:</strong> Monday-Friday, 9AM-5PM</li>
                                <li><strong>Emergency Contacts:</strong> 
                                    <ul>
                                        <li>Warden: 012-345 6789</li>
                                        <li>Security: 03-8765 4321</li>
                                        <li>Maintenance Hotline: 03-8765 4322</li>
                                    </ul>
                                </li>
                                <li><strong>Upcoming Events:</strong>
                                    <ul>
                                        <li>Orientation Week: 15-20 July 2025</li>
                                        <li>Annual Sports Day: 5 August 2025</li>
                                        <li>Cultural Night: 20 September 2025</li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="datetime" id="currentDateTime">
                <!-- JavaScript will populate this -->
            </div>
        </div>
    </div>

    <script>
        // Function to update date and time
        function updateDateTime() {
            try {
                const now = new Date();
                
                // Format date as DD/MM/YYYY
                const day = String(now.getDate()).padStart(2, '0');
                const month = String(now.getMonth() + 1).padStart(2, '0');
                const year = now.getFullYear();
                const dateStr = `${day}/${month}/${year}`;
                
                // Format time as HH:MM a.m/p.m
                let hours = now.getHours();
                const minutes = String(now.getMinutes()).padStart(2, '0');
                const ampm = hours >= 12 ? 'p.m' : 'a.m';
                hours = hours % 12;
                hours = hours ? hours : 12; // Convert 0 to 12
                const timeStr = `${hours}:${minutes} ${ampm}`;
                
                // Update the element
                document.getElementById('currentDateTime').textContent = `${dateStr} ${timeStr}`;
            } catch (error) {
                console.error('Error updating date/time:', error);
                document.getElementById('currentDateTime').textContent = 'Date/time unavailable';
            }
        }
        
        // Update when page loads
        document.addEventListener('DOMContentLoaded', function() {
            updateDateTime();

            const infoButtons = document.querySelectorAll('.info-btn');
            infoButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Remove active class from all buttons
                    infoButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');

                    // Hide all content areas
                    document.querySelectorAll('.main-content-area').forEach(area => {
                        area.classList.remove('active');
                        const content = area.querySelector('.info-content');
                        if (content) content.classList.remove('active');
                    });

                    // Show selected content
                    const targetId = this.getAttribute('data-target');
                    const selectedArea = document.getElementById(targetId);
                    selectedArea.classList.add('active');
                    const selectedContent = selectedArea.querySelector('.info-content');
                    if (selectedContent) selectedContent.classList.add('active');
                });
            });

            setInterval(updateDateTime, 60000);
        });

    </script>
</body>
</html>