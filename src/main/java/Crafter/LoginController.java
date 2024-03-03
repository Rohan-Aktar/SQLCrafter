package Crafter;

//LoginServlet.java
import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	
	
    private static final long serialVersionUID = 1L;

	public LoginController() {
        super();
        
        Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
        // Set Log4jOutputStream as the standard output stream
        System.setOut(new PrintStream(log4jOutputStream, true));
        
        try {
            System.out.println("LoginController().. ");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
 protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
     String username = request.getParameter("username");
     String password = request.getParameter("password");

     // Perform validation and authentication
     UserDataAccessObject userDAO = new UserDataAccessObject();
     UserModel user = userDAO.getUserByUsernameAndPassword(username, password);

     if (user != null) {
         // Valid user, create a session
    	 System.out.println("LoginController()..  User Validated, Creating Session...");
    	 
         HttpSession session = request.getSession();
         session.setAttribute("user", user);
         response.sendRedirect("home.jsp"); // Redirect to a welcome page
     } else {
         // Invalid login, redirect back to login page
    	 System.out.println("LoginController()..  User Invalidated, returning to login...");
    	 
         response.sendRedirect("login.jsp?error=invalid");
     }
 }
}

