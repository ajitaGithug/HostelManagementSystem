<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate(); // End user session
    }
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
