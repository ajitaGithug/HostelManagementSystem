<%@ page import="com.hostel.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Complete Staff Profile</title>
</head>
<body>
    <h2>Complete Your Profile</h2>
    <form action="CompleteStaffProfileServlet" method="post">
        <input type="hidden" name="userID" value="<%= user.getUserID() %>">
        <input type="hidden" name="userName" value="<%= user.getUserName() %>">
        <input type="hidden" name="userEmail" value="<%= user.getUserEmail() %>">
        <input type="hidden" name="userPassword" value="<%= user.getUserPassword() %>">
        <input type="hidden" name="role" value="staff">

        Contact No: <input type="text" name="contactNo" required><br>
        Position: <input type="text" name="position" required><br>
        Minimum Merit Required: <input type="number" name="minMeritRequired" required><br>
        Photo: <input type="text" name="photo"><br>

        <input type="submit" value="Submit Profile">
    </form>
</body>
</html>
