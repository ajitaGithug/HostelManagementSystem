<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Maintenance - Kerawang College</title>
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
            --status-red: #F44336;
            --status-orange: #FF9800;
            --status-green: #4CAF50;
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
            background: linear-gradient(180deg, var(--primary-purple), var(--dark-purple));
            color: var(--white);
            padding: 30px 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
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
        
        /* Maintenance-specific styles */
        .filter-section {
            margin-bottom: 25px;
        }
        
        .filter-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--primary-purple);
            margin-bottom: 15px;
        }
        
        .filter-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .filter-btn {
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            background-color: var(--white);
            color: var(--text-dark);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .filter-btn:hover {
            background-color: #e0e0e0;
        }
        
        .filter-btn.active {
            background-color: var(--primary-purple);
            color: var(--white);
        }
        
        .maintenance-table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--white);
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        }
        
        .maintenance-table th {
            background-color: var(--primary-purple);
            color: var(--white);
            padding: 12px 15px;
            text-align: left;
            font-weight: 500;
        }
        
        .maintenance-table td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
            color: var(--text-dark);
        }
        
        .maintenance-table tr:last-child td {
            border-bottom: none;
        }
        
        .maintenance-table tr:hover {
            background-color: var(--light-purple);
        }
        
        .action-btn {
            background: none;
            border: none;
            color: var(--primary-purple);
            cursor: pointer;
            font-size: 16px;
            transition: transform 0.2s;
            margin-right: 8px;
        }
        
        .action-btn:hover {
            transform: scale(1.2);
        }
        
        .priority-high {
            color: var(--status-red);
            font-weight: 600;
        }
        
        .priority-medium {
            color: var(--status-orange);
            font-weight: 600;
        }
        
        .priority-low {
            color: var(--status-green);
            font-weight: 600;
        }
        
        .status-badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }
        
        .status-pending {
            background-color: rgba(255, 152, 0, 0.1);
            color: var(--status-orange);
        }
        
        .status-inprogress {
            background-color: rgba(33, 150, 243, 0.1);
            color: #2196F3;
        }
        
        .status-completed {
            background-color: rgba(76, 175, 80, 0.1);
            color: var(--status-green);
        }
        
        .datetime {
            color: var(--text-medium);
            font-size: 14px;
            text-align: right;
            margin-top: 25px;
            font-weight: 500;
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
            <li><a href="profile.jsp">PROFILE</a></li>
            <li><a href="manage-room.jsp">MANAGE ROOM</a></li>
            <li><a href="booking.jsp">BOOKING</a></li>
            <li><a href="manage-student.jsp">MANAGE STUDENT</a></li>
            <li><a href="checkinout.jsp">CHECK IN/OUT</a></li>
            <li><a href="maintenance.jsp" class="active">MAINTENANCE</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
            <li><a href="info.jsp">INFO</a></li>
        </ul>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1 class="page-title">MAINTENANCE REPORTS</h1>
            <div class="staff-info">
                <h3>STAFF NAME</h3>
                <p>STAFF ID</p>
            </div>
        </div>
        
        <!-- Filter Section -->
        <div class="filter-section">
            <div class="filter-title">FILTER BY STATUS:</div>
            <div class="filter-buttons">
                <button class="filter-btn active">All</button>
                <button class="filter-btn">Pending</button>
                <button class="filter-btn">In Progress</button>
                <button class="filter-btn">Completed</button>
            </div>
            
            <!-- Maintenance Table -->
            <table class="maintenance-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Room Number</th>
                        <th>Student ID</th>
                        <th>Issue Description</th>
                        <th>Date Reported</th>
                        <th>Maintenance Type</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>S003</td>
                        <td>2023288474</td>
                        <td>Door broken</td>
                        <td>23/04/2025</td>
                        <td>Room</td>
                        <td class="priority-high">High</td>
                        <td><span class="status-badge status-pending">Pending</span></td>
                        <td>
                            <button class="action-btn" title="Start work">
                                <i class="fas fa-play"></i>
                            </button>
                            <button class="action-btn" title="Complete">
                                <i class="fas fa-check"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>B205</td>
                        <td>2023291123</td>
                        <td>Light bulb replacement</td>
                        <td>24/04/2025</td>
                        <td>Electrical</td>
                        <td class="priority-medium">Medium</td>
                        <td><span class="status-badge status-inprogress">In Progress</span></td>
                        <td>
                            <button class="action-btn" title="Complete">
                                <i class="fas fa-check"></i>
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>S012</td>
                        <td>2023276543</td>
                        <td>Leaky faucet</td>
                        <td>20/04/2025</td>
                        <td>Plumbing</td>
                        <td class="priority-low">Low</td>
                        <td><span class="status-badge status-completed">Completed</span></td>
                        <td>
                            <button class="action-btn" title="View details">
                                <i class="fas fa-eye"></i>
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <div class="datetime" id="currentDateTime">
            <!-- JavaScript will populate this -->
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
        window.onload = updateDateTime;
        
        // Update every minute
        setInterval(updateDateTime, 60000);
        
        // Filter functionality
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                // Remove active class from all buttons
                document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                
                // Add active class to clicked button
                this.classList.add('active');
                
                // Get the filter value
                const filterValue = this.textContent.trim().toLowerCase();
                
                // Filter the table rows
                filterMaintenanceTable(filterValue);
            });
        });

        function filterMaintenanceTable(filterValue) {
            const rows = document.querySelectorAll('.maintenance-table tbody tr');
            
            rows.forEach(row => {
                if (filterValue === 'all') {
                    row.style.display = '';
                } else {
                    const status = row.querySelector('.status-badge').textContent.trim().toLowerCase();
                    const statusMatch = status.includes(filterValue);
                    row.style.display = statusMatch ? '' : 'none';
                }
            });
        }

        // Action button handlers
        document.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const row = this.closest('tr');
                const reportId = row.cells[0].textContent;
                const action = this.querySelector('i').className;
                
                if (action.includes('fa-play')) {
                    // Mark as in progress
                    updateStatus(row, 'In Progress');
                } else if (action.includes('fa-check')) {
                    // Mark as completed
                    updateStatus(row, 'Completed');
                } else if (action.includes('fa-eye')) {
                    // View details
                    viewDetails(reportId);
                }
            });
        });

        function updateStatus(row, newStatus) {
            const statusCell = row.querySelector('.status-badge');
            
            // Update status class and text
            statusCell.className = 'status-badge';
            if (newStatus === 'Pending') {
                statusCell.classList.add('status-pending');
            } else if (newStatus === 'In Progress') {
                statusCell.classList.add('status-inprogress');
            } else {
                statusCell.classList.add('status-completed');
            }
            statusCell.textContent = newStatus;
            
            // Update action buttons based on new status
            const actionCell = row.cells[8];
            actionCell.innerHTML = '';
            
            if (newStatus === 'In Progress') {
                actionCell.innerHTML = `
                    <button class="action-btn" title="Complete">
                        <i class="fas fa-check"></i>
                    </button>
                `;
            } else if (newStatus === 'Completed') {
                actionCell.innerHTML = `
                    <button class="action-btn" title="View details">
                        <i class="fas fa-eye"></i>
                    </button>
                `;
            }
            
            // In a real implementation, you would send this update to the server
            console.log(`Updated report ${row.cells[0].textContent} to status: ${newStatus}`);
        }

        function viewDetails(reportId) {
            // In a real implementation, this would open a modal or navigate to a details page
            alert(`Viewing details for maintenance report #${reportId}`);
        }
    </script>
</body>
</html>