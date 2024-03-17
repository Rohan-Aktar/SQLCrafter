package Crafter;

import java.util.List;

public class TableInfo {
    private String tableName;
    private List<ColumnInfo> columns;

    public TableInfo(String tableName, List<ColumnInfo> columns) {
        this.tableName = tableName;
        this.columns = columns;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public List<ColumnInfo> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnInfo> columns) {
        this.columns = columns;
    }
}
