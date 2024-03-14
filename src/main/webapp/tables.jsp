<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tables Page</title>
    <!-- Latest Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.21.0/font/bootstrap-icons.css" rel="stylesheet">
    
<style>
    /* Add your custom styles here */
    body {
        background-color: #f8f9fa; /* Set a light background color */
    }

    .navbar {
        background-color: #17a2b8; /* Set a blue color for the header */
    }

    .footer {
        background-color: #343a40; /* Set a dark color for the footer */
        color: #ffffff; /* Set text color to white */
    }
    
    .btn-custom-color {
        background-color: #f8f9fa; /* Set a light background color */
        color: #ffffff; /* Text color (white in this example) */
    }
    
</style>
    
</head>
<body class="d-flex flex-column min-vh-100">

<%
    try {
    	
    	System.out.println("INSIDE tables.JSP");
    	
        // Retrieve tables from the request attribute
       // List<String> tables = (List<String>) request.getAttribute("tables");

        // Display tables here
%>

<!-- Include the header -->
    <jsp:include page="header.jsp" />

     <div class="container mt-4">
        <h2>Tables in Schema: <%= request.getParameter("schema") %></h2>
        <ul class="list-group">
            
        </ul>
    </div>

<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        System.out.println(e);
        e.printStackTrace(System.out);
        //e.printStackTrace();
        
    }
%>

    <!-- Bootstrap Footer -->
    
    <!-- Include the footer -->
    <jsp:include page="footer.jsp" />
    
    
      <!-- Latest Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</body>
</html>
