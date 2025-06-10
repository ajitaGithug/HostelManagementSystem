<%-- 
    Document   : reset-password
    Created on : 2 Jun 2025, 10:53:19 AM
    Author     : hazee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String userID = request.getParameter("userID");
    if (userID == null || userID.isEmpty()) {
        out.println("Invalid reset link.");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
</head>
<body>
    <h3>Reset Password</h3>
<form action="reset-password" method="post">
    <input type="hidden" name="userID" value="<%=userID%>">
    <label>New Password:</label>
    <input type="password" name="newPassword" required>
    <button type="submit">Reset Password</button>
</form>
</body>
</html>