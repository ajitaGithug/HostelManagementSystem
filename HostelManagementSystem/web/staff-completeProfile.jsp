<%-- 
    Document   : staff-completeProfile
    Created on : 7 Jun 2025, 4:23:31 PM
    Author     : hazee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect if session is invalid
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="StaffCompleteServlet" method="post">
            Position: <input type="text" name="position" ><br>
            Contact No: <input type="text" name="contactNo" required><br>
            Merit Requirement: <input type="number" name="minMeritRequired"><br>
            <input type="submit" value="Submit Profile">
        </form>
    </body>
</html>
