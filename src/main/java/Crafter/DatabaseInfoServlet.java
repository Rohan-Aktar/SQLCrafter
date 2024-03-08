package Crafter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/databaseInfo")
public class DatabaseInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        List<String> schemas = getSchemas();
        // Convert the list to a JSON array
        String jsonResponse = toJsonArray(schemas);
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        System.out.println("jsonResponse:: " + jsonResponse);
        response.getWriter().write(jsonResponse);
    }

    private List<String> getSchemas() {
        List<String> schemas = new ArrayList<>();
        try (Connection connection = DBConnectionClass.getConnection();
             ResultSet rs = connection.getMetaData().getCatalogs()) {
            while (rs.next()) {
                schemas.add(rs.getString("TABLE_CAT"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return schemas;
    }

    private String toJsonArray(List<String> list) {
        StringBuilder jsonArray = new StringBuilder("[");
        for (String item : list) {
            jsonArray.append("\"").append(item.replace("\"", "\\\"")).append("\",");
        }
        if (jsonArray.length() > 1) {
            jsonArray.setLength(jsonArray.length() - 1);
        }
        jsonArray.append("]");
        return jsonArray.toString();
    }
}
