package Crafter;

import java.io.PrintStream;

public class UserModel {
	
    private int id;
    private String username;
    private String password;
    private String email;
    
    public UserModel(){
    	
    	Log4jOutputStream log4jOutputStream = new Log4jOutputStream();
        // Set Log4jOutputStream as the standard output stream
        System.setOut(new PrintStream(log4jOutputStream, true));
    	
    	System.out.println("in UserModel()...");
	
    }
    
 // Getters and Setters
    
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

    

}
