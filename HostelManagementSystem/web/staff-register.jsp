<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f9f5ff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .register-container {
            background-color: white;
            padding: 40px;
            width: 400px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        h2 {
            color: #5d3f95;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label, select, input {
            display: block;
            width: 100%;
            font-size: 15px;
        }
        input, select {
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 6px;
        }
        .submit-btn {
            background-color: #5d3f95;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .submit-btn:hover {
            background-color: #4a2e7a;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>User Registration</h2>
        <form action="UserRegisterServlet" method="post">
            <div class="form-group">
                <label for="role">Register as:</label>
                <select name="role" id="role" required>
                    <option value="STUDENT">Student</option>
                </select>
            </div>

            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="userid">User ID</label>
                <input type="text" name="userid" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" required>
            </div>

            <button class="submit-btn" type="submit">Register</button>
        </form>
    </div>
</body>
</html>
