<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Crafter.TableInfo" %>
<%@ page import="Crafter.ColumnInfo" %>
<%@ page import="com.google.gson.Gson" %>

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
    .card-header-bg{
    	background-color: #17a2b8; /* Set a blue color for the header */
        color: #ffffff; /* Set text color to white */
    }
    
</style>
    
</head>
<body class="d-flex flex-column min-vh-100">

<%
    try {
    	
    	System.out.println("INSIDE tables.JSP");
    	
        // Retrieve schema name from the request parameter
        String schemaName = request.getParameter("schema");

        // Display schema name
        System.out.println("Schema Name: " + schemaName);

        // Display tables here
%>

<!-- Include the header -->
<jsp:include page="header.jsp" />

<div class="container mt-4">
    <h2>Tables in Schema: <%= schemaName %></h2>
    <BR>
    
    <div id="tablesList"></div>
</div>



<!-- Bootstrap Footer -->
<jsp:include page="footer.jsp" />

<!-- Latest Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
$(document).ready(function() {
    // Retrieve tables info using AJAX
    $.get("${pageContext.request.contextPath}/tables", { schema: "<%= schemaName %>" }, function(response) {
        // Parse JSON response
        var data = response.tables;
        var status = response.status;

        // Check if status is true and data is not empty
        if (status && data && data.length > 0) {
            // Render tables list
            var tablesList = $("#tablesList");
            for (var i = 0; i < data.length; i++) {
                var table = data[i];
                var html = "<div class='card mb-4'>";
                html += "<h5 class='card-header py-3 card-header-bg'>" + table.tableName + "</h5>";
                html += "<div class='card-body'>";
                
                html += "<table class='table table-striped table-bordered'>";
                //html += "<caption>Columns</caption>";
                html += "<thead><tr><th>Column Name</th><th>Column Type</th><th>Column Size</th></tr></thead>";
                html += "<tbody>";
                for (var j = 0; j < table.columns.length; j++) {
                    var column = table.columns[j];
                    html += "<tr>";
                    html += "<td class='col-6'>" + column.columnName + "</td>";
                    html += "<td class='col-3'>" + column.columnType + "</td>";
                    html += "<td class='col-3'>" + column.columnSize + "</td>";
                    html += "</tr>";
                }
                html += "</tbody></table>";
                html += "</div></div>";
                tablesList.append(html);
            }
        } else {
            // If status is false or data is empty, display a message
            var message = "<BR><BR><BR><div class='alert alert-danger' role='alert'>No tables found!</div>";
            $("#tablesList").append(message);
        }
    }).fail(function() {
        // If AJAX call fails, display an error message
        var errorMessage = "<div class='alert alert-danger' role='alert'>Error fetching data. Please try again later.</div>";
        $("#tablesList").append(errorMessage);
    });
});
</script>








<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        System.out.println(e);
        e.printStackTrace(System.out);
        //e.printStackTrace();
    }
%>

</body>
</html>
