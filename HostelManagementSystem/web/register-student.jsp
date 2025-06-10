<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Register Student</title></head>
<body>
    <h2>Register New Student</h2>
    <form action="RegisterStudentServlet" method="post">
        <label>User ID:</label><input type="text" name="userID" required /><br/>
        <label>Name:</label><input type="text" name="userName" required /><br/>
        <label>Email:</label><input type="email" name="userEmail" required /><br/>
        <label>Password:</label><input type="password" name="userPassword" required /><br/>

        <label>Matric No:</label><input type="text" name="matricNo" required /><br/>
        <label>Phone No:</label><input type="text" name="phoneNo" required /><br/>
        <label>Address:</label><input type="text" name="address" required /><br/>
        <label>Gender:</label><input type="text" name="gender" required /><br/>
        <label>Program:</label><input type="text" name="program" required /><br/>
        <label>Year of Study:</label><input type="number" name="yearOfStudy" required /><br/>
        <label>Internship:</label>
        <select name="internship">
            <option value="true">Yes</option>
            <option value="false">No</option>
        </select><br/>
        <label>Guardian Name:</label><input type="text" name="guardianName" /><br/>
        <label>Guardian Contact:</label><input type="text" name="guardianContact" /><br/>
        <label>Emergency Contact:</label><input type="text" name="emergencyContact" /><br/>
        <label>Room ID:</label><input type="text" name="roomID" /><br/>

        <input type="submit" value="Register Student" />
    </form>
</body>
</html>
