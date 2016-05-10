/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var $TABLE = $('#table');
var $BTN = $('#export-btn');
var $EXPORT = $('#export');
var $BTNPLAY = $('#play-btn');
var $BTNBUSCAR = $('#buscarVideo-submit');

$('.table-add').click(function () {
    var $clone = $TABLE.find('tr.hide').clone(true).removeClass('hide table-line');
    $TABLE.find('table').append($clone);
    $BTN.addClass("btn-warning");
});

$('.table-remove').click(function () {
    $(this).parents('tr').detach();
    //alert($(this).parents('tr').get(2).toString());
    $BTN.addClass("btn-warning");
});

$('.table-up').click(function () {
    var $row = $(this).parents('tr');
    if ($row.index() === 1)
        return; // Don't go above the header
    $row.prev().before($row.get(0));
    $BTN.addClass("btn-warning");
});

$('.table-down').click(function () {
    var $row = $(this).parents('tr');
    $row.next().after($row.get(0));
    $BTN.addClass("btn-warning");
});

// A few jQuery helpers for exporting only
jQuery.fn.pop = [].pop;
jQuery.fn.shift = [].shift;

$BTN.click(function () {
    var $rows = $TABLE.find('tr:not(:hidden)');
    var headers = [];
    var data = [];

    // Get the headers (add special header logic here)
    $($rows.shift()).find('th:not(:empty)').each(function () {
        headers.push($(this).text().toLowerCase());
    });

    // Turn all existing rows into a loopable array
    $rows.each(function () {
        var $td = $(this).find('td');
        var h = {};

        // Use the headers from earlier to name our hash keys
        headers.forEach(function (header, i) {
            h[header] = $td.eq(i).text();
        });

        data.push(h);
    });
     $BTN.removeClass("btn-warning");
     $BTN.addClass("btn-success");
    $.ajax({
        type: "POST",
        url: "RegistrarVideoController",
        data: "jsonObject=" + (JSON.stringify(data)),
        success: function (response) {
            $EXPORT.text("Datos guardados correctamente.");
            $EXPORT.removeClass("alert alert-danger col-md-6");
            $EXPORT.addClass("alert alert-info col-md-4");
        },
        error: function (e) {
            $EXPORT.text("Alguno de los campos no cumple con el formato correcto.");
            $EXPORT.removeClass("alert alert-info col-md-4");
            $EXPORT.addClass("alert alert-danger col-md-6");
        }
    });
});

$BTNPLAY.click(function () {
    var $rows = $TABLE.find('tr:not(:hidden)');
    var headers = [];
    var data = [];

    // Get the headers (add special header logic here)
    $($rows.shift()).find('th:not(:empty)').each(function () {
        headers.push($(this).text().toLowerCase());
    });

    // Turn all existing rows into a loopable array
    $rows.each(function () {
        var $td = $(this).find('td');
        var h = {};

        // Use the headers from earlier to name our hash keys
        headers.forEach(function (header, i) {
            h[header] = $td.eq(i).text();
        });

        data.push(h);
    });
    
    $.ajax({
        type: "POST",
        url: "contarVisualizacionesController",
        data: "jsonObject=" + (JSON.stringify(data)),
        success: function (response) {
            location.reload(true);
        }
    });
});


