package Crafter;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionClass {
    
    // MySQL Connection details
    private static final String MYSQL_HOST = "crafter-mysql.mysql.database.azure.com";
    private static final int MYSQL_PORT = 3306;
    private static final String MYSQL_DATABASE = "crafter";
    private static final String MYSQL_JDBC_URL = "jdbc:mysql://" + MYSQL_HOST + ":" + MYSQL_PORT + "/" + MYSQL_DATABASE;
    private static final String MYSQL_JDBC_URL2 = "jdbc:mysql://" + MYSQL_HOST + ":" + MYSQL_PORT;
    private static final String MYSQL_USERNAME = "dootam";
    private static final String MYSQL_PASSWORD = "Rocketman@123";

    // Azure T-SQL Connection details
    private static final String TSQL_HOST = "crafter-server.database.windows.net";
    private static final int TSQL_PORT = 1433;
    private static final String TSQL_DATABASE = "crafter";
    private static final String TSQL_JDBC_URL = "jdbc:sqlserver://" + TSQL_HOST + ":" + TSQL_PORT + ";databaseName=" + TSQL_DATABASE;
    private static final String TSQL_USERNAME = "dootam";
    private static final String TSQL_PASSWORD = "Rocketman@123";  // Replace with your actual password

    // Oracle SQL Connection details
    private static final String OSQL_HOST = "localhost";
    private static final int OSQL_PORT = 1521;
    private static final String OSQL_DATABASE = "xe";
    private static final String OSQL_JDBC_URL = "jdbc:oracle:thin:@" + OSQL_HOST + ":" + OSQL_PORT + ":" + OSQL_DATABASE;
    private static final String OSQL_USERNAME = "system";
    private static final String OSQL_PASSWORD = "oraclepassword";  // Replace with your actual password

    // Original getConnection method for MySQL
    public static Connection getConnection() {
        Connection connection = null;

        try {
            System.out.println("Connecting to MySQL DB...");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(MYSQL_JDBC_URL, MYSQL_USERNAME, MYSQL_PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error Connecting to MySQL DB...");
            e.printStackTrace(); 
        }

        System.out.println("Connected to MySQL DB...");
        return connection;
    }
    
    // Overloaded getConnection method with schema parameter for MySQL
    public static Connection getConnection(String schema) {
        Connection connection = null;
        System.out.println("getConnection() schema: "+schema);

        try {
            System.out.println("Connecting to MySQL DB <" + schema + ">...");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            String urlWithSchema = MYSQL_JDBC_URL2 + "/" + schema;
            connection = DriverManager.getConnection(urlWithSchema, MYSQL_USERNAME, MYSQL_PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error Connecting to MySQL DB <" + schema + ">...");
            e.printStackTrace(); 
        }

        System.out.println("Connected to MySQL DB <" + schema + ">...");
        return connection;
    }

    // getConnectionTSQL method for Azure T-SQL
    public static Connection getConnectionTSQL() {
        Connection connection = null;

        try {
            System.out.println("Connecting to Azure T-SQL DB...");
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(TSQL_JDBC_URL, TSQL_USERNAME, TSQL_PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error Connecting to Azure T-SQL DB...");
            e.printStackTrace(); 
        }

        System.out.println("Connected to Azure T-SQL DB...");
        return connection;
    }

    // getConnectionOSQL method for Oracle SQL
    public static Connection getConnectionOSQL() {
        Connection connection = null;

        try {
            System.out.println("Connecting to Oracle SQL DB...");
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(OSQL_JDBC_URL, OSQL_USERNAME, OSQL_PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error Connecting to Oracle SQL DB...");
            e.printStackTrace(); 
        }

        System.out.println("Connected to Oracle SQL DB...");
        return connection;
    }
}
