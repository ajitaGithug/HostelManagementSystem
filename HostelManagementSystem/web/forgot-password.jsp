<%-- 
    Document   : forgot-password
    Created on : 2 Jun 2025, 10:36:46 AM
    Author     : hazee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>
    <h2>Forgot Password</h2>
    <form action="ResetPasswordServlet" method="post">
        <label for="userid">Enter your User ID:</label>
        <input type="text" name="userid" required>
        <button type="submit">Reset Password</button>
    </form>
</body>
</html>
