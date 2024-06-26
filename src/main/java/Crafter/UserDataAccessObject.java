package Crafter;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDataAccessObject {
    private Connection connection;

    public UserDataAccessObject() {
        // Initialize database connection
        this.connection = DBConnectionClass.getConnectionTSQL();
        
        // Set Log4jOutputStream as the standard output stream
        //Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
        //System.setOut(new PrintStream(log4jOutputStream, true));
        
        System.out.println("Inside UserDataAccessObject() ...");
    }

    public UserModel getUserByUsernameAndPassword(String username, String password) {
        
        System.out.println("Inside getUserByUsernameAndPassword() ...");
        
        System.out.println("username:  " + username);
        System.out.println("password:  " + password);
        
        UserModel user = null;
        String query = "SELECT * FROM t_Crafter_users WHERE username = ? AND password = ?";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, username);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new UserModel();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        }

        return user;
    }
}
