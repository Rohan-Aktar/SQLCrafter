package Crafter;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resources/images/*")
public class ResourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Get the requested image path
        String imagePath = request.getPathInfo();

        // Load the image from the classpath
        try (InputStream inputStream = getClass().getResourceAsStream("/images" + imagePath)) {
            if (inputStream != null) {
                // Set content type based on file extension
                if (imagePath.endsWith(".png")) {
                    response.setContentType("image/png");
                } else if (imagePath.endsWith(".jpg") || imagePath.endsWith(".jpeg")) {
                    response.setContentType("image/jpeg");
                } else if (imagePath.endsWith(".gif")) {
                    response.setContentType("image/gif");
                } else {
                    // Set a default content type if necessary
                    response.setContentType("application/octet-stream");
                }

                // Copy the image to the response output stream
                OutputStream outputStream = response.getOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (IOException e) {
            // Handle exception
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}


