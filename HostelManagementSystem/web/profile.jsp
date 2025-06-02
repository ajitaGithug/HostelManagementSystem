<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Profile - Kolej Kerawang</title>
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
            --border-radius: 8px;
            --box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-gray);
            color: var(--text-dark);
            display: grid;
            grid-template-columns: 250px 1fr;
            min-height: 100vh;
            line-height: 1.6;
        }

        .sidebar {
            background-color: var(--white);
            padding: 30px 20px;
            box-shadow: var(--box-shadow);
            display: flex;
            flex-direction: column;
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
            flex-grow: 1;
        }

        .sidebar-menu li {
            margin-bottom: 8px;
        }

        .sidebar-menu a {
            display: block;
            color: var(--text-dark);
            text-decoration: none;
            padding: 12px 15px;
            border-radius: var(--border-radius);
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .sidebar-menu a:hover {
            background-color: var(--light-gray);
        }

        .sidebar-menu a.active {
            background-color: var(--light-purple);
            color: var(--primary-purple);
            font-weight: 600;
        }

        .main-content {
            display: flex;
            flex-direction: column;
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

        .profile-content {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 30px;
            padding: 30px;
        }

        .photo-upload {
            background-color: var(--white);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
            text-align: center;
            height: fit-content;
        }

        .upload-area {
            width: 200px;
            height: 200px;
            margin: 0 auto 20px;
            border-radius: 50%;
            background-color: var(--light-purple);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 3px dashed var(--secondary-purple);
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .upload-area:hover {
            background-color: #f0e5ff;
        }

        .upload-icon {
            font-size: 40px;
            color: var(--secondary-purple);
        }

        .upload-text {
            font-weight: 500;
            color: var(--text-medium);
            margin-bottom: 20px;
        }

        .upload-btn {
            background-color: var(--secondary-purple);
            color: var(--white);
            border: none;
            padding: 10px 20px;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 500;
        }

        .upload-btn:hover {
            background-color: var(--primary-purple);
        }

        .profile-info {
            background-color: var(--white);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--box-shadow);
        }

        .info-title {
            font-size: 20px;
            color: var(--primary-purple);
            margin-bottom: 15px;
            padding-bottom: 5px;
            border-bottom: 2px solid var(--light-purple);
        }

        .form-group {
            margin-bottom: 5px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--text-medium);
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-size: 15px;
        }

        .form-group input:focus {
            border-color: var(--secondary-purple);
            outline: none;
            box-shadow: 0 0 0 3px rgba(155, 89, 182, 0.2);
        }

        .form-group .password-container {
            position: relative;
        }

        .form-group .password-container i {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--text-medium);
        }

        .save-btn {
            background-color: var(--primary-purple);
            color: var(--white);
            border: none;
            padding: 12px 25px;
            border-radius: var(--border-radius);
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            margin-top: 10px;
        }

        .save-btn:hover {
            background-color: var(--dark-purple);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(106, 48, 147, 0.3);
        }

        @media (max-width: 768px) {
            body {
                grid-template-columns: 1fr;
            }

            .sidebar {
                flex-direction: row;
                overflow-x: auto;
            }

            .profile-content {
                grid-template-columns: 1fr;
            }

            .header {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <img src="https://1000logos.net/wp-content/uploads/2023/05/UiTM-Logo.png" alt="UiTM Logo">
        </div>
        <ul class="sidebar-menu">
            <li><a href="dashboard.jsp">DASHBOARD</a></li>
            <li><a href="profile.jsp" class="active">PROFILE</a></li>
            <li><a href="manage-room.jsp">MANAGE ROOM</a></li>
            <li><a href="booking.jsp">BOOKING</a></li>
            <li><a href="manage-student.jsp">MANAGE STUDENT</a></li>
            <li><a href="checkinout.jsp">CHECK IN/OUT</a></li>
            <li><a href="maintenance.jsp">MAINTENANCE</a></li>
            <li><a href="info.jsp">INFO</a></li>
            <li><a href="logout.jsp">SIGN-OUT</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="header">
            <h1 class="dashboard-title">STAFF PROFILE</h1>
            <div class="staff-info-container">
                <div class="staff-info">
                    <h3>AHMAD BIN ALI</h3>
                    <p>KS2023001</p>
                </div>
                <div class="profile-pic">
                    <i class="fas fa-user-circle"></i>
                </div>
            </div>
        </div>

        <div class="profile-content">
            <div class="photo-upload">
                <div class="upload-area" id="uploadArea">
                    <i class="fas fa-user-circle upload-icon"></i>
                </div>
                <p class="upload-text">Upload your profile photo</p>
                <button type="button" class="upload-btn" id="chooseFileBtn">Choose File</button>
            </div>

            <div class="profile-info">
                <h3 class="info-title">PERSONAL INFORMATION</h3>

                <form id="profileForm">
                    <div class="form-group">
                        <label for="staffId">STAFF ID</label>
                        <input type="text" id="staffId" name="staffId" value="KS2023001" readonly>
                    </div>

                    <div class="form-group">
                        <label for="staffName">STAFF NAME</label>
                        <input type="text" id="staffName" name="staffName" value="Ahmad bin Ali">
                    </div>

                    <div class="form-group">
                        <label for="staffEmail">STAFF EMAIL</label>
                        <input type="email" id="staffEmail" name="staffEmail" value="ahmad.ali@kerawang.edu.my">
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">PHONE NUMBER</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber" value="+60123456789">
                    </div>

                    <div class="form-group">
                        <label for="password">PASSWORD</label>
                        <div class="password-container">
                            <input type="password" id="password" name="password" value="********">
                            <i class="fas fa-eye" id="togglePassword"></i>
                        </div>
                    </div>

                    <button type="submit" class="save-btn">SAVE CHANGES</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Upload photo preview
        const uploadArea = document.getElementById('uploadArea');
        const chooseBtn = document.getElementById('chooseFileBtn');

        function triggerFileInput() {
            const input = document.createElement('input');
            input.type = 'file';
            input.accept = 'image/*';

            input.onchange = function(e) {
                const file = e.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        uploadArea.innerHTML = `<img src="${event.target.result}" alt="Profile Photo" style="width:100%;height:100%;object-fit:cover;border-radius:50%;">`;
                    };
                    reader.readAsDataURL(file);
                }
            };

            input.click();
        }

        uploadArea.addEventListener('click', triggerFileInput);
        chooseBtn.addEventListener('click', triggerFileInput);

        // Toggle password visibility
        document.getElementById('togglePassword').addEventListener('click', function () {
            const password = document.getElementById('password');
            const type = password.type === 'password' ? 'text' : 'password';
            password.type = type;
            this.classList.toggle('fa-eye-slash');
        });

        // Form validation
        document.getElementById('profileForm').addEventListener('submit', function(e) {
            e.preventDefault();

            const email = document.getElementById('staffEmail').value;
            const phone = document.getElementById('phoneNumber').value;

            if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(email)) {
                alert('Please enter a valid email address.');
                return;
            }

            if (!/^\+60\d{9,10}$/.test(phone)) {
                alert('Please enter a valid Malaysian phone number.');
                return;
            }

            alert('Profile updated successfully!');
        });
    </script>
</body>
</html>
