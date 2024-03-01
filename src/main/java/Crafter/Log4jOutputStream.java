package Crafter;

import java.io.IOException;
import java.io.OutputStream;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log4jOutputStream extends OutputStream {
    private static final Logger logger = LogManager.getLogger(Log4jOutputStream.class);
    private StringBuilder buffer = new StringBuilder();

    @Override
    public void write(int b) throws IOException {
        if (b == '\n' || b == '\r') {
            if (buffer.length() > 0) {
                logger.info(buffer.toString());
                buffer.setLength(0);
            }
        } else {
            buffer.append((char) b);
        }
    }

    @Override
    public void flush() throws IOException {
        if (buffer.length() > 0) {
            logger.info(buffer.toString());
            buffer.setLength(0);
        }
    }
}
