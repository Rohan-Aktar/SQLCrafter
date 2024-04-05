package Crafter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/tables")
public class TablesInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	String event = request.getParameter("event");   // events for entire schema tables fetch or single table fetch.
        String schema = request.getParameter("schema");
        String tableName = request.getParameter("table");
        
        if(event.equals("GET_ALL_TABLES_FOR_SCHEMA")) 
        {
        TablesResponse tablesResponse = getTablesInfo(schema);
        Gson gson = new GsonBuilder().create();
        String jsonResponse = gson.toJson(tablesResponse);
        
        System.out.println("/tables json response for [GET_ALL_TABLES_FOR_SCHEMA]   ::: " + jsonResponse);
        
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
        out.flush();
        }
        else if(event.equals("GET_TABLE_COLUMNS"))
        {
        	TablesResponse tablesResponse = getSpecificTableInfo(schema,tableName);
            Gson gson = new GsonBuilder().create();
            String jsonResponse = gson.toJson(tablesResponse);
            
            System.out.println("/tables json response for [GET_TABLE_COLUMNS]   ::: " + jsonResponse);
            
            response.setContentType("application/json;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonResponse);
            out.flush();
        }
    }

    private TablesResponse getTablesInfo(String schema) {
        System.out.println("inside getTablesInfo().. ");
        
        TablesResponse tablesResponse = new TablesResponse();
        List<TableInfo> tables = new ArrayList<>();
        tablesResponse.setStatus(false); // Default status is false
        
        try (Connection connection = DBConnectionClass.getConnection(schema)) {
            DatabaseMetaData metaData = connection.getMetaData();
            ResultSet rs = metaData.getTables(schema, null, null, new String[] { "TABLE" });
            while (rs.next()) {
                String tableName = rs.getString("TABLE_NAME");
                
                System.out.println("getTablesInfo()  iterating table: " + tableName);
                
                ResultSet columns = metaData.getColumns(null, schema, tableName, null);
                List<ColumnInfo> columnsList = new ArrayList<>();
                while (columns.next()) {
                    String columnName = columns.getString("COLUMN_NAME");
                    System.out.println("<<< iterating column >>>  : " + columnName);
                    String columnType = columns.getString("TYPE_NAME");
                    int columnSize = columns.getInt("COLUMN_SIZE");
                    columnsList.add(new ColumnInfo(columnName, columnType, columnSize));
                }
                tables.add(new TableInfo(tableName, columnsList));
            }
            
            // If data is fetched successfully and not null, set status to true
            if (!tables.isEmpty()) {
                tablesResponse.setStatus(true);
                tablesResponse.setTables(tables);
            }
            
        } catch (SQLException e) {
            System.out.println("getTablesInfo()..  Error Occurred!!!");
            //e.printStackTrace(System.out);
            e.printStackTrace();
        }
        return tablesResponse;
    }
    
    
    private TablesResponse getSpecificTableInfo(String schema, String tableName) {
        System.out.println("inside getTablesInfo().. ");
        
        TablesResponse tablesResponse = new TablesResponse();
        List<TableInfo> tables = new ArrayList<>();
        tablesResponse.setStatus(false); // Default status is false
        
        try (Connection connection = DBConnectionClass.getConnection(schema)) {
            DatabaseMetaData metaData = connection.getMetaData();
            
            ResultSet columns = metaData.getColumns(null, schema, tableName, null);
            List<ColumnInfo> columnsList = new ArrayList<>();
            while (columns.next()) {
                String columnName = columns.getString("COLUMN_NAME");
                System.out.println("<<< iterating column >>>  : " + columnName);
                String columnType = columns.getString("TYPE_NAME");
                int columnSize = columns.getInt("COLUMN_SIZE");
                columnsList.add(new ColumnInfo(columnName, columnType, columnSize));
            }
            
            tables.add(new TableInfo(tableName, columnsList));
            
            // If data is fetched successfully and not null, set status to true
            if (!columnsList.isEmpty()) {
                tablesResponse.setStatus(true);
                tablesResponse.setTables(tables);
            }
            
        } catch (SQLException e) {
            System.out.println("getTablesInfo()..  Error Occurred!!!");
            //e.printStackTrace(System.out);
            e.printStackTrace();
        }
        return tablesResponse;
    }


}
