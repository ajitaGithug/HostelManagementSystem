<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password - Kerawang College</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9f9f9;
            padding: 40px;
        }
        .form-container {
            max-width: 500px;
            margin: auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 40px;
        }
        h1 {
            text-align: center;
            color: #6a3093;
        }
        label {
            font-weight: 600;
            color: #555;
            display: block;
            margin-top: 20px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        button {
            margin-top: 30px;
            width: 100%;
            padding: 10px;
            background-color: #6a3093;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #512e7f;
        }
        .message {
            text-align: center;
            margin-top: 20px;
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>

    <div class="form-container">
        <h1>Reset Password</h1>
        <form action="ResetPasswordServlet" method="post">
            <label for="userID">User ID</label>
            <input type="text" name="userID" required>

            <label for="newPassword">New Password</label>
            <input type="password" name="newPassword" required>

            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" name="confirmPassword" required>

            <button type="submit">Reset Password</button>
        </form>

        <%-- Optional message display --%>
        <%
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
            }
        %>
    </div>

</body>
</html>
