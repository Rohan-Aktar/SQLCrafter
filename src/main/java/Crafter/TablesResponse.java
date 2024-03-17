package Crafter;

import java.util.List;

public class TablesResponse {
    private boolean status;
    private List<TableInfo> tables;

    // Getters and setters
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<TableInfo> getTables() {
        return tables;
    }

    public void setTables(List<TableInfo> tables) {
        this.tables = tables;
    }
}
