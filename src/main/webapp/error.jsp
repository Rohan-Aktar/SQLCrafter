<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.StringWriter" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
</head>
<body>
    <h2>Oops! An error occurred.</h2>
    
    <%
        // Retrieve exception details
        Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
        String errorMessage = (String) request.getAttribute("javax.servlet.error.message");

        // Print the exception stack trace to the page
        if (throwable != null) {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            throwable.printStackTrace(pw);
            out.println("<pre>" + sw.toString() + "</pre>");
        }

        // Display the error message
        if (errorMessage != null && !errorMessage.isEmpty()) {
            out.println("<p>Error Message: " + errorMessage + "</p>");
        }
    %>

    <!-- Add additional content or links as needed -->

    <p><a href="home.jsp">Go back to Home</a></p>
</body>
</html>
