<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hostel.model.Staff" %>

<html>
<head><title>Staff Profile</title></head>
<body>
    <h2>Staff Profile</h2>

    <form action="profile" method="post">
        <input type="hidden" name="userID" value="${staff.userID}" />

        Name: <input type="text" name="userName" value="${staff.userName}" required /><br/>
        Email: <input type="email" name="userEmail" value="${staff.userEmail}" required /><br/>
        Contact No: <input type="text" name="contactNo" value="${staff.contactNo}" /><br/>
        Position: <input type="text" name="position" value="${staff.position}" /><br/>
        Min Merit Required: <input type="number" name="minMeritRequired" value="${staff.minMeritRequired}" /><br/>
        Photo URL: <input type="text" name="photo" value="${staff.photo}" /><br/>
        Password: <input type="password" name="userPassword" value="${staff.userPassword}" required /><br/>

        <input type="submit" value="Update Profile" />
    </form>

    <p style="color: green;"><%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %></p>
</body>
</html>
