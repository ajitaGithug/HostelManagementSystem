<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Room - Kolej Kerawang</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Same CSS as your provided theme – no changes */
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
        body { font-family: 'Poppins', sans-serif; margin: 0; padding: 0; background-color: var(--light-gray); }
        .container { display: grid; grid-template-columns: 250px 1fr; min-height: 100vh; }
        .sidebar { background: linear-gradient(180deg, var(--primary-purple), var(--dark-purple)); color: var(--white); padding: 30px 20px; }
        .sidebar-header h1 { margin: 0; font-size: 24px; text-align: center; margin-bottom: 30px; }
        .sidebar-menu { list-style: none; padding: 0; }
        .sidebar-menu a { display: block; color: var(--white); text-decoration: none; padding: 12px 15px; margin-bottom: 10px; border-radius: 5px; font-weight: 500; }
        .sidebar-menu a:hover, .sidebar-menu a.active { background-color: rgba(255, 255, 255, 0.15); transform: translateX(5px); }
        .sidebar-menu a.active { background-color: var(--secondary-purple); }
        .main-content { padding: 30px; }
        .header { display: flex; justify-content: center; align-items: center; margin-bottom: 20px; }
        .header h2 { color: var(--primary-purple); font-size: 28px; }
        .form-container { background-color: var(--white); padding: 30px; border-radius: 10px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05); max-width: 800px; margin: 0 auto; }
        .form-group { margin-bottom: 20px; }
        .form-row { display: flex; gap: 20px; margin-bottom: 20px; }
        .form-col { flex: 1; min-width: 150px; }
        label { display: block; margin-bottom: 8px; font-weight: 500; color: var(--text-dark); }
        input, select { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; font-family: 'Poppins', sans-serif; font-size: 14px; box-sizing: border-box; }
        .form-row > .form-col { flex: 1; min-width: 0; }
        .btn-group { display: flex; justify-content: flex-end; gap: 15px; margin-top: 30px; }
        .btn { padding: 12px 25px; border-radius: 6px; font-weight: 500; cursor: pointer; border: none; font-family: 'Poppins', sans-serif; font-size: 14px; transition: all 0.3s ease; }
        .btn-primary { background-color: var(--primary-purple); color: white; }
        .btn-primary:hover { background-color: var(--dark-purple); }
        .btn-secondary { background-color: #e0e0e0; color: var(--text-dark); }
        .btn-secondary:hover { background-color: #d0d0d0; }
        .back-link { display: inline-block; margin-bottom: 20px; color: var(--secondary-purple); text-decoration: none; font-weight: 500; }
        .back-link i { margin-right: 5px; }
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

    <div class="main-content">
        <a href="staff-manage-room.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Room List</a>

        <div class="header">
            <h2>Add New Room</h2>
        </div>

        <div class="form-container">
            <form method="post" action="AddRoomServlet">
                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="roomID">Room ID</label>
                            <input type="text" id="roomID" name="roomID" placeholder="e.g. K105" required />
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="blockName">Block</label>
                            <select id="blockName" name="blockName" required>
                                <option value="">Select Block</option>
                                <option value="KASA">KASA</option>
                                <option value="SUTERA">SUTERA</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="capacity">Capacity</label>
                            <select id="capacity" name="capacity" required>
                                <option value="">Select Capacity</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-col">
                        <div class="form-group">
                            <label for="currentOccupancy">Current Occupancy</label>
                            <input type="number" id="currentOccupancy" name="currentOccupancy" value="0" min="0" required />
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-col">
                        <div class="form-group">
                            <label for="status">Status</label>
                            <select id="status" name="status" required>
                                <option value="">Select Status</option>
                                <option value="available">Available</option>
                                <option value="occupied">Occupied</option>
                                <option value="maintenance">Maintenance</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="btn-group">
                    <button type="reset" class="btn btn-secondary">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Room</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
