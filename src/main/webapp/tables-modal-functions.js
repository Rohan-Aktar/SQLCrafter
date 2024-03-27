/**
 * Added By DOOTAM ROY MAR/2024.
 * tables.jsp modal functions.
 */

function openViewModal(schemaName, tableName, columns) {
    // Display the schema name, table name, and columns in an alert
    //alert("Schema Name: " + schemaName + "\nTable Name: " + tableName + "\nColumns: " + JSON.stringify(columns));

    // Set the modal header with schema name and table name
    $('#viewDataModalLabel').html("<img src='" + contextPath+ "/resources/images/search.png' style='max-width: 35px; margin-right: 10px;' alt='view Icon'>View Data -    " + schemaName + "." + tableName);

    // Populate data in the modal body for the table
var html = `
    <div class='card-body'>
        <table class='table table-striped table-bordered'>
            <thead>
                <tr>
                    <th>Column Name</th>
                    <th>Where</th>
                    <th>Schema</th>
                    <th>Table</th>
                    <th>Column</th>
                    <!--<th>&nbsp;</th>-->
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
`;
for (var j = 0; j < columns.length; j++) {
    var column = columns[j];
    html += "<tr>";
    html += "<td class='col-3'>" + column.columnName + "<div style='font-size: smaller; color: #17a2b8;'>[" + column.columnType + ", " + column.columnSize + "]</div> <input type='hidden' id='columnName" + j + "' value='" + column.columnName + "'> <input type='hidden' id='columnType" + j + "' value='" + column.columnType + "'> <input type='hidden' id='columnSize" + j + "' value='" + column.columnSize + "'></td>";
    html += "<td class='col-1'> <select id='operatorSelect" + j + "' class='form-control'> <option value='='>=</option> <option value='LIKE'>LIKE</option> <option value='IN'>IN</option> <option value='NOT IN'>NOT IN</option> <option value='!='>!=</option> <option value='NOT LIKE'>NOT LIKE</option> </select> </td>";
    html += "<td class='col-1'> <select id='SchemaSelect" + j + "' class='form-control'> <option value=''</option> <option value='schema'>schema</option> </select> </td>";
    html += "<td class='col-1'> <select id='tableSelect" + j + "' class='form-control'> <option value='table'>table</option> <option value='table'>table123 233vvvv dd</option> </select> </td>";
    html += "<td class='col-1'> <select id='columnSelect" + j + "' class='form-control'> <option value='column'>column</option> <option value='column'>columng rg rgv gvrvrvr d</option> </select> </td>";
    //html += "<td class='col-2'> <input type='text' id='andInput" + j + "' class='form-control' style='' placeholder='' style='width: 10px;'> </td>";
    html += "<td class='col-2'> <input type='text' id='viewInput" + j + "' class='form-control' style='' placeholder='' > </td>";
    html += "</tr>";
}
html += `
            </tbody>
        </table>
    </div>
`;



    // Set the modal body with the generated HTML
    $('#viewDataModal .modal-body').html(html);
    
    // Populate data in the modal body
    // You can use AJAX to fetch data and populate the modal body dynamically
    // Example:
    // $.get("viewDataEndpoint", function(data) {
    //     // Populate data in modal body
    // });

    // Show the modal
    $('#viewDataModal').modal('show');
}


function openAddModal() {
    // Populate data in the modal body
    // You can use AJAX to fetch data and populate the modal body dynamically
    // Example:
    // $.get("viewDataEndpoint", function(data) {
    //     // Populate data in modal body
    // });

    // Show the modal
    $('#addDataModal').modal('show');
}

function openUpdateModal() {
    // Populate data in the modal body
    // You can use AJAX to fetch data and populate the modal body dynamically
    // Example:
    // $.get("viewDataEndpoint", function(data) {
    //     // Populate data in modal body
    // });

    // Show the modal
    $('#updateDataModal').modal('show');
}

function openDeleteModal() {
    // Populate data in the modal body
    // You can use AJAX to fetch data and populate the modal body dynamically
    // Example:
    // $.get("viewDataEndpoint", function(data) {
    //     // Populate data in modal body
    // });

    // Show the modal
    $('#deleteDataModal').modal('show');
}
function openDeleteTableModal() {
    // Populate data in the modal body
    // You can use AJAX to fetch data and populate the modal body dynamically
    // Example:
    // $.get("viewDataEndpoint", function(data) {
    //     // Populate data in modal body
    // });

    // Show the modal
    $('#deleteTableModal').modal('show');
}



// AJAX call on confirm button click
$('.confirmView').click(function() {
    // Perform AJAX call to confirm the view operation
    // Example:
    // $.post("viewDataConfirmationEndpoint", function(response) {
    //     if (response.success) {
    //         // Redirect to home.jsp on success
    //         window.location.href = "home.jsp";
    //     } else {
    //         // Handle error case
    //     }
    // });

    // Redirecting to tables.jsp directly
    window.location.href = "tables.jsp?event=GET_ALL_TABLES_FOR_SCHEMA&schema="+vSchema;
});