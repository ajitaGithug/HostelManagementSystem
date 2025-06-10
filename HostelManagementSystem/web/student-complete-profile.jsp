<%@ page import="com.hostel.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h2>Complete Your Student Profile</h2>
<form action="CompleteStudentProfileServlet" method="post">
    <input type="hidden" name="userID" value="<%= user.getUserID() %>">
    <input type="hidden" name="userName" value="<%= user.getUserName() %>">
    <input type="hidden" name="userEmail" value="<%= user.getUserEmail() %>">
    <input type="hidden" name="userPassword" value="<%= user.getUserPassword() %>">
    <input type="hidden" name="role" value="student">

    Matric No: <input type="text" name="matricNo" required><br>
    Phone No: <input type="text" name="phoneNo" required><br>
    Address: <input type="text" name="address" required><br>
    Gender: <input type="text" name="gender" required><br>
    Program: <input type="text" name="program" required><br>
    Year of Study: <input type="number" name="yearOfStudy" required><br>
    Internship: 
        <input type="radio" name="internship" value="true"> Yes
        <input type="radio" name="internship" value="false"> No<br>
    Guardian Name: <input type="text" name="guardianName" required><br>
    Guardian Contact: <input type="text" name="guardianContact" required><br>
    Emergency Contact: <input type="text" name="emergencyContact" required><br>

    <input type="submit" value="Submit Profile">
</form>
