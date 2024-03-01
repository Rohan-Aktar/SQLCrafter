package Crafter;

import java.io.IOException;
import java.io.PrintStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Crafter.Log4jOutputStream;

@WebServlet("/demo")
public class demo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        // Initialize Log4jOutputStream
    	System.out.println("Initializing Log4j in servlet...");
    	
        Log4jOutputStream log4jOutputStream = new Log4jOutputStream();

        // Set Log4jOutputStream as the standard output stream
        System.setOut(new PrintStream(log4jOutputStream, true));
    }

    public demo() {
        super();
        System.out.println("Maven build DEMO");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	System.out.println("Inside doGet()");
    	
        response.getWriter().append("Served at: ").append(request.getContextPath());
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
