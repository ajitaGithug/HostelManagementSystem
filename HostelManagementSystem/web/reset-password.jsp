<%-- 
    Document   : reset-password
    Created on : 2 Jun 2025, 10:53:19 AM
    Author     : hazee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
</head>
<body>
    <h2>Set New Password</h2>
    <form action="UpdatePasswordServlet" method="post">
        <input type="hidden" name="userid" value="<%= request.getAttribute("userid") %>">
        <label for="newPassword">New Password:</label>
        <input type="password" name="newPassword" required>
        <button type="submit">Update Password</button>
    </form>
</body>
</html>