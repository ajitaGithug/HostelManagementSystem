<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    com.hostel.model.Student student = (com.hostel.model.Student) request.getAttribute("student");
    Boolean isComplete = (Boolean) request.getAttribute("isComplete");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>
    <style>
        body { font-family: 'Poppins', sans-serif; background: #f5f5f5; }
        .profile-container { max-width: 600px; margin: 40px auto; background: #fff; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.07); padding: 30px; }
        h2 { color: #6a3093; }
        .profile-row { margin-bottom: 18px; }
        .profile-label { font-weight: 600; color: #9b59b6; width: 180px; display: inline-block; }
        .profile-value { color: #333; }
        .edit-request { color: #F44336; font-weight: 500; margin-top: 20px; }
        .profile-form label { display: block; margin-top: 15px; color: #6a3093; font-weight: 500; }
        .profile-form input, .profile-form select { width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ddd; margin-top: 5px; }
        .profile-form button { margin-top: 20px; background: #6a3093; color: #fff; border: none; padding: 12px 30px; border-radius: 6px; font-weight: 600; cursor: pointer; }
        .profile-form button:hover { background: #4b2d73; }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2>Student Profile</h2>
        <div class="profile-row"><span class="profile-label">Name:</span> <span class="profile-value"><%= student.getUserName() %></span></div>
        <div class="profile-row"><span class="profile-label">Matric No:</span> <span class="profile-value"><%= student.getMatricNo() %></span></div>
        <div class="profile-row"><span class="profile-label">Email:</span> <span class="profile-value"><%= student.getUserEmail() %></span></div>
        <div class="profile-row"><span class="profile-label">User ID:</span> <span class="profile-value"><%= student.getUserID() %></span></div>
        <hr>
        <% if (!isComplete) { %>
        <!-- Show form for first-time completion -->
        <form class="profile-form" action="student-profile" method="post">
            <label>Phone No: <input type="text" name="phoneNo" required></label>
            <label>Address: <input type="text" name="address" required></label>
            <label>Gender:
                <select name="gender" required>
                    <option value="">Select</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select>
            </label>
            <label>Program: <input type="text" name="program" required></label>
            <label>Year of Study: <input type="number" name="yearOfStudy" min="1" required></label>
            <label>Internship: <input type="checkbox" name="internship"></label>
            <label>Guardian Name: <input type="text" name="guardianName" required></label>
            <label>Guardian Contact: <input type="text" name="guardianContact" required></label>
            <label>Emergency Contact: <input type="text" name="emergencyContact" required></label>
            <button type="submit">Save Profile</button>
        </form>
        <% } else { %>
        <!-- Show profile info as read-only -->
        <div class="profile-row"><span class="profile-label">Phone No:</span> <span class="profile-value"><%= student.getPhoneNo() %></span></div>
        <div class="profile-row"><span class="profile-label">Address:</span> <span class="profile-value"><%= student.getAddress() %></span></div>
        <div class="profile-row"><span class="profile-label">Gender:</span> <span class="profile-value"><%= student.getGender() %></span></div>
        <div class="profile-row"><span class="profile-label">Program:</span> <span class="profile-value"><%= student.getProgram() %></span></div>
        <div class="profile-row"><span class="profile-label">Year of Study:</span> <span class="profile-value"><%= student.getYearOfStudy() %></span></div>
        <div class="profile-row"><span class="profile-label">Internship:</span> <span class="profile-value"><%= student.isInternship() ? "Yes" : "No" %></span></div>
        <div class="profile-row"><span class="profile-label">Guardian Name:</span> <span class="profile-value"><%= student.getGuardianName() %></span></div>
        <div class="profile-row"><span class="profile-label">Guardian Contact:</span> <span class="profile-value"><%= student.getGuardianContact() %></span></div>
        <div class="profile-row"><span class="profile-label">Emergency Contact:</span> <span class="profile-value"><%= student.getEmergencyContact() %></span></div>
        <div class="edit-request">To edit your profile, please contact staff.</div>
        <% } %>
    </div>
</body>
</html>