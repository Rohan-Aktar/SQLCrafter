package Crafter;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionClass {
    
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/Crafter";
    private static final String JDBC_URL2 = "jdbc:mysql://localhost:3306";          //change both if required!!
    private static final String USERNAME = "root";
    private static final String PASSWORD = "rocketman123";

    // Original getConnection method
    public static Connection getConnection() {
        Connection connection = null;

        try {
            //Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
            //System.setOut(new PrintStream(log4jOutputStream, true));
        	
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
    
    // Overloaded getConnection method with schema parameter
    public static Connection getConnection(String schema) {
        Connection connection = null;
        System.out.println("getConnection() schema: "+schema);

        try {
            Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
            System.setOut(new PrintStream(log4jOutputStream, true));
        	
        	System.out.println("Connecting to DB<schemaname>...");
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Append the schema name to the JDBC URL
            String urlWithSchema = JDBC_URL2 + "/" + schema;
            connection = DriverManager.getConnection(urlWithSchema, USERNAME, PASSWORD);
            
            
        } catch (ClassNotFoundException | SQLException e) {
        	System.out.println("Error Connecting to DB<schemaname>...");
            e.printStackTrace(); // Handle the exception in a better way in a real application
        }

        System.out.println("connected to DB<schemaname>...");
        return connection;
    }
}
