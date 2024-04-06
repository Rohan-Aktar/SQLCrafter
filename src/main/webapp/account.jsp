<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Crafter.*" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SQLCrafter</title>
    
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    
    <!-- Latest Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.21.0/font/bootstrap-icons.css" rel="stylesheet">
    
<style>
    /* Add your custom styles here */

    .navbar {
        background-color: #17a2b8; /* Set a blue color for the header */
    }
    
    
</style>
    
</head>
<body class="d-flex flex-column min-vh-100">

<%
    try {
    	
    	System.out.println("INSIDE account.JSP");
    	
%>

    <!-- Include the header -->
    <jsp:include page="header.jsp" />
    
<div id="wrap">

account!!!


</div>

    <!-- Bootstrap Footer -->
    <jsp:include page="footer.jsp" />

<!-- Bootstrap Modals -->

<!-- delete table Modal -->
<div class="modal fade" id="deleteTableModal" tabindex="-1" aria-labelledby="deleteTableModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteTableModalLabel"><img src='${pageContext.request.contextPath}/resources/images/delete2.png' style='max-width: 35px; margin-right: 10px;' alt='delete Icon'>Delete Table</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Data display area -->
                Delete Table <> Query
                <br>
                <br>
                <br>
                <br>
                <textarea class="form-control" id="DeleteTableQuery" rows="5" placeholder="SQL Query..." readonly>DROP TABLE SCHEMA_NAME.TABLE_NAME</textarea>
                <!-- You can customize this section based on your requirements -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-outline-primary confirmView" ><img src='${pageContext.request.contextPath}/resources/images/confirm.png' style='max-width: 20px; margin-right: 5px;' alt='Confirm Icon'>Confirm</button>
            </div>
        </div>
    </div>
</div>



<!-- Latest Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- tables-modal-functions -->
<script src="tables-modal-functions.js"></script>

<script>

var contextPath = "${pageContext.request.contextPath}";

$(document).ready(function() {
	
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
