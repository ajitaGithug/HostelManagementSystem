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
    <form action="ForgotPasswordServlet" method="post">
    <label for="userID">Enter your User ID:</label>
    <input type="text" name="userID" required>
    <button type="submit">Send Reset Link</button>

    <p style="color:green">${msg}</p>
    <p style="color:red">${error}</p>
</form>

</body>
</html>
