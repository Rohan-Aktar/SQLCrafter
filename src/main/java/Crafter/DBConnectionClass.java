package Crafter;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionClass {
    
    private static final String JDBC_URL = "jdbc:mysql://sqlcrafter.catviwqp0i8m.ap-south-1.rds.amazonaws.com:3306/Crafter";
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "sqlcrafter123";

    public static Connection getConnection() {
        Connection connection = null;

        try {
        	
        	Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
            // Set Log4jOutputStream as the standard output stream
            System.setOut(new PrintStream(log4jOutputStream, true));
        	
        	System.out.println("Connecting to DB...");
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            
            
        } catch (ClassNotFoundException | SQLException e) {
        	System.out.println("Error Connecting to DB...");
            e.printStackTrace(); // Handle the exception in a better way in a real application
        }

        System.out.println("connected to DB...");
        return connection;
    }
}

