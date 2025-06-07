<%-- 
    Document   : completeProfile
    Created on : 6 Jun 2025, 2:52:45 PM
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
        <form action="CompleteProfileServlet" method="post">
    Matric No: <input type="text" name="matricNo" required><br>
    Phone No: <input type="text" name="phoneNo" required><br>
    Address: <input type="text" name="address" required><br>
    Gender: 
    <select name="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
    </select><br>
    Program: <input type="text" name="program" required><br>
    Year of Study: <input type="number" name="yearOfStudy" min="1" max="7" required><br>
    Internship: <input type="checkbox" name="internship"><br>
    Guardian Name: <input type="text" name="guardianName" required><br>
    Guardian Contact: <input type="text" name="guardianContact" required><br>
    Emergency Contact: <input type="text" name="emergencyContact" required><br>
    <input type="submit" value="Submit Profile">
</form>

    </body>
</html>
