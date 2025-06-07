<%-- 
    Document   : staff-profile
    Created on : 4 Jun 2025, 8:22:31 AM
    Author     : hazee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="editStaffProfile" method="post" enctype="multipart/form-data">
    <input type="hidden" name="userID" value="${sessionScope.userID}" />
    
    Position: <input type="text" name="position" value="${staff.position}" required /><br/>
    Contact No: <input type="text" name="contactNo" value="${staff.contactNo}" required /><br/>
    Min Merit Required: <input type="number" name="minMeritRequired" value="${staff.minMeritRequired}" required /><br/>
    Profile Photo: <input type="file" name="photo" accept="image/*" /><br/>
    <button type="submit">Update Profile</button>
</form>

    </body>
</html>
