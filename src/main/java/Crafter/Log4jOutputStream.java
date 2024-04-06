package Crafter;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log4jOutputStream extends OutputStream {
    private static final Logger logger = LogManager.getLogger(Log4jOutputStream.class);
    private StringBuilder buffer = new StringBuilder();

    @Override
    public void write(int b) throws IOException {
        if (b == '\n' || b == '\r') {
            if (buffer.length() > 0) {
                //logger.info(buffer.toString());
            	String message = buffer.toString();
            	writeToDatabase(message);
                buffer.setLength(0);
            }
        } else {
            buffer.append((char) b);
        }
    }

    @Override
    public void flush() throws IOException {
        if (buffer.length() > 0) {
            //logger.info(buffer.toString());
        	String message = buffer.toString();
        	writeToDatabase(message);
            buffer.setLength(0);
        }
    }
    
    private void writeToDatabase(String message) {
        try (Connection conn = CrafterDBConnectionClass.getConnectionTSQL();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO logs (timestamp, level, logger, message) VALUES (GETDATE(), ?, ?, ?)")) {

            ps.setString(1, "INFO"); // Assuming INFO level for now
            ps.setString(2, logger.getName());
            ps.setString(3, message);

            ps.executeUpdate();
        } catch (SQLException e) {
            logger.error("<DOOTAM> Error writing to database", e);
        }
    }
    
    
    @Override
    public void write(byte[] b, int off, int len) throws IOException {
        super.write(b, off, len);
    }

    @Override
    public void close() throws IOException {
        super.close();
    }

    @Override
    public void write(byte[] b) throws IOException {
        super.write(b);
    }
    
}


/*
package Crafter;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log4jOutputStream extends OutputStream {
    private static final Logger logger = LogManager.getLogger(Log4jOutputStream.class);
    private StringBuilder buffer = new StringBuilder();

    @Override
    public void write(int b) throws IOException {
        if (b == '\n' || b == '\r') {
            if (buffer.length() > 0) {
                writeToDatabase(buffer.toString());
                buffer.setLength(0);
            }
        } else {
            buffer.append((char) b);
        }
    }

    @Override
    public void flush() throws IOException {
        if (buffer.length() > 0) {
            writeToDatabase(buffer.toString());
            buffer.setLength(0);
        }
    }

    private void writeToDatabase(String message) {
        try (Connection conn = DBConnectionClass.getConnectionTSQL();
             PreparedStatement ps = conn.prepareStatement("INSERT INTO logs (timestamp, level, logger, message) VALUES (GETDATE(), ?, ?, ?)")) {

            ps.setString(1, "INFO"); // Assuming INFO level for now
            ps.setString(2, logger.getName());
            ps.setString(3, message);

            ps.executeUpdate();
        } catch (SQLException e) {
            logger.error("<DOOTAM> Error writing to database", e);
        }
    }
}
*/
