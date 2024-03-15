package Crafter;

import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter("/*")
@WebFilter(urlPatterns = {"/*"}, initParams = {@WebInitParam(name = "excludedUrls", value = "/login,/logout,/login.jsp")})

public class SessionFilter implements Filter {
	
	private String excludedUrls;
   
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	    try {
	        // Initialisation code here
	        Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
	        // Set Log4jOutputStream as the standard output stream
	        System.setOut(new PrintStream(log4jOutputStream, true));
	        
	        System.out.println("SessionFilter... init ");
	        
	        excludedUrls = filterConfig.getInitParameter("excludedUrls");
	        if (excludedUrls == null) {
	            excludedUrls = "";
	        }
	        System.out.println("SessionFilter... excludedUrls:: "+excludedUrls);
	        
	    } 
	    catch (Exception e) {
	        // Handle initialisation error
	        e.printStackTrace(System.out);
	        throw new ServletException("Error initializing SessionFilter", e);
	    }
	}

    @Override
    public void destroy() {
        // Cleanup code here
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        try {
            HttpServletRequest httpRequest = (HttpServletRequest) request;
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            HttpSession session = httpRequest.getSession(false); // Do not create session if it doesn't exist
            
            // Get the value of the Referrer header
            String referer = httpRequest.getHeader("Referer");
            
            System.out.println("SessionFilter...  referer:: " + referer);
            System.out.println("SessionFilter...  httpRequest.getRequestURI():: " + httpRequest.getRequestURI());
            
            // Get the request URI
            String requestUri = httpRequest.getRequestURI();

            // Remove the context path if present
            String contextPath = httpRequest.getContextPath();
            if (requestUri.startsWith(contextPath)) {
                requestUri = requestUri.substring(contextPath.length());
            }
            
            // Check if request URI is excluded
            if (excludedUrls.contains(requestUri)) {
                // If excluded, continue with the chain
                System.out.println("excluded url from doFilter()");
                chain.doFilter(request, response);
                return;
            }
            
            UserModel user = (UserModel) session.getAttribute("user");

            // Check if session exists
            if (session == null || user == null) {
                // Redirect to login page
                System.out.println("SessionFilter....  session doesn't exist!! redirecting to login.jsp");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            } else {
                // Continue with the chain
                System.out.println("SessionFilter...  session exists username:: " + user.getUsername());
                chain.doFilter(request, response);
            }
        } catch (Exception e) {
            // Handle any exceptions here
            e.printStackTrace(System.out); // For debugging purposes
            throw new ServletException("An error occurred in SessionFilter", e);
        }
    }

}

