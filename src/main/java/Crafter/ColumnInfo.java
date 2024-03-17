package Crafter;

public class ColumnInfo {
    private String columnName;
    private String columnType;
    private int columnSize;

    public ColumnInfo(String columnName, String columnType, int columnSize) {
        this.columnName = columnName;
        this.columnType = columnType;
        this.columnSize = columnSize;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public int getColumnSize() {
        return columnSize;
    }

    public void setColumnSize(int columnSize) {
        this.columnSize = columnSize;
    }
}
