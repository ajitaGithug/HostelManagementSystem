<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kolej Kerawang - Staff Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f5ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .login-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 380px;
            text-align: center;
        }
        
        .logo {
            color: #5d3f95;
            font-size: 26px;
            font-weight: 700;
            margin-bottom: 25px;
            letter-spacing: 0.5px;
        }
        
        .login-title {
            color: #333;
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 30px;
        }
        
        .user-type {
            display: flex;
            justify-content: center;
            margin-bottom: 25px;
            border-bottom: 1px solid #e0d0f0;
            padding-bottom: 10px;
        }
        
        .user-type span {
            padding: 0 18px;
            color: #666;
            cursor: pointer;
            font-weight: 600;
            font-size: 15px;
            transition: all 0.3s ease;
        }
        
        .user-type span.active {
            color: #5d3f95;
            font-weight: 700;
            border-bottom: 3px solid #5d3f95;
            padding-bottom: 8px;
            transform: translateY(1px);
        }
        
        .form-group {
            margin-bottom: 22px;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
            font-size: 15px;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0d0f0;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 15px;
            transition: border 0.3s ease;
        }
        
        .form-group input:focus {
            border-color: #5d3f95;
            outline: none;
        }
        
        .forgot-password {
            text-align: right;
            margin-bottom: 25px;
        }
        
        .forgot-password a {
            color: #5d3f95;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }
        
        .forgot-password a:hover {
            text-decoration: underline;
        }
        
        .login-button {
            background-color: #5d3f95;
            color: white;
            border: none;
            padding: 14px;
            width: 100%;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 700;
            font-size: 16px;
            margin-bottom: 20px;
            transition: background-color 0.3s ease;
        }
        
        .login-button:hover {
            background-color: #4a2e7a;
        }
        
        .signup-link {
            color: #666;
            font-size: 15px;
            font-weight: 500;
        }
        
        .signup-link a {
            color: #5d3f95;
            text-decoration: none;
            font-weight: 700;
        }
        
        .signup-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">KOLEJ KERAWANG MANAGEMENT SYSTEM</div>
        <div class="login-title">LOG IN</div>
        
        <div class="user-type">
            <span data-role="ADMIN">ADMIN</span>
            <span data-role="STAFF" class="active">STAFF</span>
            <span data-role="STUDENT">STUDENT</span>
        </div>
        
        <form action="UserLoginServlet" method="post">
            
            <input type="hidden" name="role" id="role" value="STAFF">
            
            <div class="form-group">
                <label for="userid" id="userLabel">USER ID</label>
                <input type="text" id="userid" name="userid" placeholder="Enter Staff ID" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="forgot-password">
                <a href="forgot-password.jsp">Forgot your password?</a>
            </div>
            
            <button type="submit" class="login-button">LOG IN</button>
        </form>
        
        <div class="signup-link">
            Don't have an account yet? <a href="register-staff.jsp">SIGN UP</a>
        </div>
    </div>

    <script>
        // Handle role selection and input update
        const spans = document.querySelectorAll('.user-type span');
        const userLabel = document.getElementById('userLabel');
        const userIdInput = document.getElementById('userid');
        const roleInput = document.getElementById('role');

        spans.forEach(span => {
            span.addEventListener('click', function () {
                // Remove active from all
                spans.forEach(s => s.classList.remove('active'));
                this.classList.add('active');

                const role = this.dataset.role;
                roleInput.value = role;

                if (role === 'ADMIN') {
                    userLabel.textContent = 'Admin ID';
                    userIdInput.placeholder = 'Enter Admin ID';
                } else if (role === 'STAFF') {
                    userLabel.textContent = 'Staff ID';
                    userIdInput.placeholder = 'Enter Staff ID';
                } else {
                    userLabel.textContent = 'Student ID';
                    userIdInput.placeholder = 'Enter Student ID';
                }
            });
        });
    </script>
</body>
</html>