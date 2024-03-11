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
</head>
<body>

<%
    try {
    	
    	System.out.println("INSIDE tables.JSP");
    	
        // Retrieve tables from the request attribute
        List<String> tables = (List<String>) request.getAttribute("tables");

        // Display tables here
%>

    <div class="container mt-4">
        <h2>Tables in Schema: <%= request.getParameter("schema") %></h2>
        <ul class="list-group">
            <% for (String table : tables) { %>
                <li class="list-group-item"><%= table %></li>
            <% } %>
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

</body>
</html>
