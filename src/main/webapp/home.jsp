<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Crafter.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome Page</title>
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
        // Retrieve the user from the session
        System.out.println("INSIDE HOME.JSP");
        HttpSession crafterSession = request.getSession();
        UserModel user = (UserModel) crafterSession.getAttribute("user");

        // Check if the user is authenticated
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }
%>

    <!-- Bootstrap Header -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">SQL Crafter</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">Welcome, <%= user.getUsername() %></a>
                    </li>
                    <li class="nav-item">
                        <form action="${pageContext.request.contextPath}/logout" method="post" class="d-inline">
                            <input type="submit" class="btn btn-link text-white nav-link" value="Logout">
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </nav>




    <!-- Page Content -->
    <div class="container mt-4">
        <h2>Welcome, <%= user.getUsername() %>!</h2>
        <p>Welcome to SQLCrafter, your versatile companion for managing relational databases effortlessly! SQLCrafter is a Java (jdk1.8) Jsp Servlet project designed to streamline the visualization of tables and empower users with seamless CRUD (Create, Read, Update, Delete) operations within their database tables.</p>
		<br>
        <br>
		<!-- Display Database Information -->
        <div id="databaseInfo"></div>
        <!-- Display Database Information -->
        <br>
        <br>
        
        <!-- Add additional content or links as needed -->
    </div>
    
    
    <!-- Page Content -->
    
    
    

    <!-- Bootstrap Footer -->
    <footer class="footer mt-auto py-3">
        <div class="container text-center">
            <p>&copy; 2024 SQL Crafter. All rights reserved.</p>
        </div>
    </footer>

    <!-- Latest Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    // Function to load database information
    function loadDatabaseInfo() {
        // Display loader while refreshing data
        $("#databaseInfo").html("<div class='text-center'><div class='spinner-border text-primary' role='status'></div></div>");

        // Call the DatabaseInfoServlet and update the #databaseInfo div with the result
        $.get("${pageContext.request.contextPath}/databaseInfo", function(data) {
            var schemas = data; // No need for JSON.parse here
            var html = "<h4 class='mb-4 text-dark'>Database Information";

            // Add reload button with background color
            html += "<button class='btn btn-dark ms-4' onclick='loadDatabaseInfo()'>Reload</button>";

            html += "</h4>";
            html += "<table class='table table-bordered table-light table-striped table-hover'>";
            html += "<thead class='bg-primary text-light'><tr><th scope='col'>Schema Name</th><th scope='col'>View</th><th scope='col'>Delete</th></tr></thead>";
            html += "<tbody>";

            for (var i = 0; i < schemas.length; i++) {
                html += "<tr><td class='col-6'>" + schemas[i] + "</td>";
                html += "<td class='col-2 text-center'><button class='btn btn-primary' onclick='redirectToTables(\"" + schemas[i] + "\")'>View Tables</button></td>";
                html += "<td class='col-2 text-center'><button class='btn btn-danger' onclick='deleteSchema(\"" + schemas[i] + "\")'>Delete Schema</button></td></tr>";
            }

            html += "</tbody></table>";
            $("#databaseInfo").html(html);
        });
    }

    // Redirect to tables.jsp with the selected schema name
    function redirectToTables(schemaName) {
        window.location.href = "${pageContext.request.contextPath}/tables.jsp?schema=" + encodeURIComponent(schemaName);
    }

    // Function to handle schema deletion
    	function deleteSchema(schemaName) {
    	    // Display a confirmation dialog
    	    var confirmDelete = window.confirm("Are you sure you want to delete schema: " + schemaName + "?");

    	    // Check user's response
    	    if (confirmDelete) {
    	        // User clicked 'OK', you can implement the logic to delete the schema here
    	        // For now, let's just display an alert
    	        alert("Deleting schema: " + schemaName);
    	    } else {
    	        // User clicked 'Cancel', do nothing or provide feedback
    	        alert("Deletion cancelled for schema: " + schemaName);
    	    }
    	}

    // Initial load on document ready
    $(document).ready(function() {
        loadDatabaseInfo();
    });
</script>









    
    
<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        e.printStackTrace(System.out);
        // response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
