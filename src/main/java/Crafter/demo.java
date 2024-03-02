package Crafter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Crafter.Log4jOutputStream;

@WebServlet("/demo")
public class demo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://sqlcrafter.catviwqp0i8m.ap-south-1.rds.amazonaws.com:3306/Crafter";
    private static final String USERNAME = "admin";
    private static final String PASSWORD = "sqlcrafter123";

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Initializing Log4j in servlet...");
            
            Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
            // Set Log4jOutputStream as the standard output stream
            System.setOut(new PrintStream(log4jOutputStream, true));
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public demo() {
        super();
        try {
            System.out.println("Maven build DEMO");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("Inside doGet()");
            response.getWriter().append("Served at: ").append(request.getContextPath());

            // Fetch data from Dootam table and return as JSON
            try (Connection connection = getConnection()) {
                String query = "SELECT * FROM Dootam";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                     ResultSet resultSet = preparedStatement.executeQuery()) {

                    // Process ResultSet and create JSON response
                    StringBuilder jsonResponse = new StringBuilder();
                    jsonResponse.append("[");
                    while (resultSet.next()) {
                        // Assuming the table has columns 'column1' and 'column2'
                        String column1Value = resultSet.getString("name");
                        String column2Value = resultSet.getString("id");

                        jsonResponse.append("{");
                        jsonResponse.append("\"name\":\"").append(column1Value).append("\",");
                        jsonResponse.append("\"id\":\"").append(column2Value).append("\"");
                        jsonResponse.append("},");
                    }
                    // Remove the trailing comma if any
                    if (jsonResponse.charAt(jsonResponse.length() - 1) == ',') {
                        jsonResponse.deleteCharAt(jsonResponse.length() - 1);
                    }
                    jsonResponse.append("]");

                    // Set content type and write JSON response
                    response.setContentType("application/json");
                    try (PrintWriter out = response.getWriter()) {
                        out.print(jsonResponse.toString());
                        System.out.println("json response:: "+jsonResponse.toString());
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Handle exceptions appropriately
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Database connection error", e);
        }
    }
}
