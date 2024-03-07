<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Crafter.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    try {
        // Retrieve the user from the request attribute
        UserModel user = (UserModel) request.getAttribute("user");

        // Check if the user is authenticated
        
%>
<div class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand text-white" href="#">SQL Crafter</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    
                </li>
                <li class="nav-item">
                    <form action="${pageContext.request.contextPath}/logout" method="post" class="d-inline">
                        <input type="submit" class="btn btn-link text-white nav-link" value="Logout">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</div>
<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        e.printStackTrace();
        // You may want to redirect to an error page here
        response.sendRedirect("error.jsp");
    }
%>
