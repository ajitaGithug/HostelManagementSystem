<%@page import="com.hostel.model.User"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head><title>Book Room</title></head>
<body>
<h2>Room Booking</h2>
<form action="BookingServlet" method="post">
    Room ID: <input type="text" name="roomID" required><br>
    Your Merit: <input type="text" name="merit" required><br>
    <input type="submit" value="Book Room">
</form>
</body>
</html>
