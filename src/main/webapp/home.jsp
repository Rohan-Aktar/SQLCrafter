<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Crafter.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    try {
        // Retrieve the user from the session
        HttpSession CrafterSession = request.getSession();
		UserModel user = (UserModel) session.getAttribute("user");

        // Check if the user is authenticated
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
</head>
<body>
    <h2>Welcome, <%= user.getUsername() %>!</h2>
    <p>This is your welcome page.</p>

    <!-- Add additional content or links as needed -->

    <form action="${pageContext.request.contextPath}/logout" method="post">
        <input type="submit" value="Logout">
    </form>
</body>
</html>

<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        e.printStackTrace();
        //response.sendRedirect("error.jsp");
    }
%>

