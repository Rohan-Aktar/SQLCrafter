<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Crafter.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SQL Crafter</title>
   <!-- Latest Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.21.0/font/bootstrap-icons.css" rel="stylesheet">

    
<style>
    /* Add your custom styles here */
    body {
        background-color: #f8f9fa; /* Set a light background color */
        min-height: 100vh; /* Set a minimum height to the body */
        display: flex;
        flex-direction: column;
    }

    .navbar {
        background-color: #17a2b8; /* Set a blue color for the header */
    }

    .footer {
        background-color: #343a40; /* Set a dark color for the footer */
        color: #ffffff; /* Set text color to white */
        margin-top: auto; /* Push the footer to the bottom */
    }
    
    .btn-custom-color {
        background-color: #f8f9fa; /* Set a light background color */
        color: #ffffff; /* Text color (white in this example) */
    }
</style>


</head>
<body class="d-flex flex-column">

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


    <!-- Include the header -->
    <jsp:include page="header.jsp" />
    
    <!-- Include sidebar.jsp -->
	 <%//@ include file="sidebar.jsp" %>

    <!-- Page Content -->
    <div id="main">
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
    
    
    
	</div>
    <!-- Bootstrap Footer -->
    
    <!-- Include the footer -->
    <jsp:include page="footer.jsp" />
    

    <!-- Latest Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
//Function to load database information
function loadDatabaseInfo() {
    // Display loader while refreshing data
    $("#databaseInfo").html("<div class='text-center'><div class='spinner-border text-primary' style='width: 3rem; height: 3rem;' role='status'></div></div>");

    setTimeout(function() {  //only for the delay..

    // Call the DatabaseInfoServlet and update the #databaseInfo div with the result
    $.get("${pageContext.request.contextPath}/databaseInfo", function(data) {
        var schemas = data; // No need for JSON.parse here
        var html = "<div class='card mb-4'>";
        html += "<div class='card-header card-header-bg d-flex justify-content-between align-items-center'>";
        html += "<h4 class='mb-0'><img src='${pageContext.request.contextPath}/resources/images/table.png' style='max-width: 50px; margin-right: 15px;' alt='schema Icon'>Database Information</h4>";
        html += "<button class='btn btn-outline-secondary' onclick='loadDatabaseInfo()'><img src='${pageContext.request.contextPath}/resources/images/reload.png' style='max-width: 15px; margin-right: 5px;' alt='reload Icon'>Reload</button>";
        html += "</div>";
        html += "<div class='card-body'>";
        html += "<table class='table table-bordered table-light table-striped table-hover'>";
        html += "<thead class='bg-primary text-light'><tr><th scope='col'>Schema Name</th><th scope='col'>View</th><th scope='col'>Delete</th></tr></thead>";
        html += "<tbody>";

        for (var i = 0; i < schemas.length; i++) {
            html += "<tr><td class='col-6'>" + schemas[i] + "</td>";
            html += "<td class='col-2 text-center'><button class='btn btn-outline-primary' onclick='redirectToTables(\"" + schemas[i] + "\")'><img src='${pageContext.request.contextPath}/resources/images/search.png' style='max-width: 20px; margin-right: 10px;' alt='View Icon'>View Tables</button></td>";
            html += "<td class='col-2 text-center'><button class='btn btn-danger' onclick='deleteSchema(\"" + schemas[i] + "\")'><img src='${pageContext.request.contextPath}/resources/images/delete2.png' style='max-width: 20px; margin-right: 10px;' alt='delete Icon'>Delete Schema</button></td></tr>";
        }

        html += "</tbody></table>";
        html += "</div></div>";
        $("#databaseInfo").html(html);
    });

    },100); //1000 ms delay.
}



    // Redirect to tables.jsp with the selected schema name
    function redirectToTables(schemaName) {
        window.location.href = "${pageContext.request.contextPath}/tables.jsp?event=GET_ALL_TABLES_FOR_SCHEMA&schema=" + encodeURIComponent(schemaName);
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
         System.out.println("INSIDE HOME.JSP EXCP");
        e.printStackTrace(System.out);
        // response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
