package Crafter;

import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    
	public LogoutServlet() {
        super();
        
        Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
        // Set Log4jOutputStream as the standard output stream
        System.setOut(new PrintStream(log4jOutputStream, true));
        
        try {
            System.out.println("LogoutServlet().. ");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        System.out.println("logging out user "+((UserModel)session.getAttribute("user")).getUsername()+"... ");
        
        session.invalidate(); // Invalidate the session to log the user out

        response.sendRedirect(request.getContextPath() + "/home.jsp");
    }
}

