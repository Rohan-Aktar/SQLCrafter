package Crafter;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/demo")
public class demo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        try {
            System.out.println("Initializing Log4j in servlet...");
            
            //Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
            //System.setOut(new PrintStream(log4jOutputStream, true));
            
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

            // Fetch data from t_Crafter_users table and return as JSON
            try (Connection connection = DBConnectionClass.getConnectionTSQL()) {
                String query = "SELECT * FROM t_Crafter_users";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query);
                     ResultSet resultSet = preparedStatement.executeQuery()) {

                    // Process ResultSet and create JSON response
                    StringBuilder jsonResponse = new StringBuilder();
                    jsonResponse.append("[");
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String username = resultSet.getString("username");
                        String email = resultSet.getString("email");
                        String password = resultSet.getString("password");
                        int roleId = resultSet.getInt("role_id");
                        String userCreationDate = resultSet.getString("user_creation_date");
                        String userUpdationDate = resultSet.getString("user_updation_date");
                        String userStatus = resultSet.getString("user_status");

                        jsonResponse.append("{");
                        jsonResponse.append("\"id\":\"").append(id).append("\",");
                        jsonResponse.append("\"username\":\"").append(username).append("\",");
                        jsonResponse.append("\"email\":\"").append(email).append("\",");
                        jsonResponse.append("\"password\":\"").append(password).append("\",");
                        jsonResponse.append("\"roleId\":\"").append(roleId).append("\",");
                        jsonResponse.append("\"userCreationDate\":\"").append(userCreationDate).append("\",");
                        jsonResponse.append("\"userUpdationDate\":\"").append(userUpdationDate).append("\",");
                        jsonResponse.append("\"userStatus\":\"").append(userStatus).append("\"");
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
                        System.out.println("json response:: " + jsonResponse.toString());
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
}
