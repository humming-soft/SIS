var TableData = function () {
    //function to initiate DataTable
    //DataTable is a highly flexible tool, based upon the foundations of progressive enhancement, 
    //which will add advanced interaction controls to any HTML table
    //For more information, please visit https://datatables.net/
    jQuery.extend(jQuery.fn.dataTableExt.oSort, {
        "date-uk-pre": function (a) {
            var ukDatea = a.split('-');
            return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
        },

        "date-uk-asc": function (a, b) {
            return ((a < b) ? -1 : ((a > b) ? 1 : 0));
        },

        "date-uk-desc": function (a, b) {
            return ((a < b) ? 1 : ((a > b) ? -1 : 0));
        }
    });
    var runDataTable = function () {
        jQuery.extend(jQuery.fn.dataTableExt.oSort, {
            "date-uk-pre": function (a) {
                var c = a.split(' ');
                var ukDatea = c[0].split('-');
                return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
            },

            "date-uk-asc": function (a, b) {
                return ((a < b) ? -1 : ((a > b) ? 1 : 0));
            },

            "date-uk-desc": function (a, b) {
                return ((a < b) ? 1 : ((a > b) ? -1 : 0));
            }
        });
        var oTable = $('#GridDataTable').dataTable({
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                { "sType": "date-uk" },
                null
            ],

            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [9, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridDataTable_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var runDataTable2 = function () {
        var oTable = $('#GridDataTable2').dataTable({
            "aoColumnDefs": [{
                "aTargets": [0]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [0, 'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridDataTable2_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var kawasan = function () {
        var oTable = $('#GridKawasan').dataTable({
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                { "sType": "date-uk" },
                null,
                null
            ],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [5, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridKawasan_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var km = function () {
        var oTable = $('#GridKM').dataTable({
            "columns": [
                null,
               { "orderable": false },
               { "orderable": false },
               { "orderable": false },
               { "orderable": false }
            ],
            "aoColumnDefs": [{
                "aTargets": [0]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [0, 'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 5,
            "bPaginate": false
        });
        $('#GridKM_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var pi = function () {
        var oTable = $('#GridPinfo').dataTable({
            "aoColumnDefs": [{
                "aTargets": [0]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [12,'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridPinfo_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var tetapan = function () {
        var oTable = $('#Gridteta').dataTable({
            "aoColumnDefs": [{
                "aTargets": [0]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [0, 'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#Gridteta_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };


    var guser = function () {
        var oTable = $('#grid_user').dataTable({
            "aoColumnDefs": [{
                "aTargets": [0]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [0, 'asc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#grid_user_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var gri_party = function () {
        jQuery.extend(jQuery.fn.dataTableExt.oSort, {
            "date-uk-pre": function (a) {
                var c = a.split(' ');
                var ukDatea = c[0].split('-');
                return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
            },

            "date-uk-asc": function (a, b) {
                return ((a < b) ? -1 : ((a > b) ? 1 : 0));
            },

            "date-uk-desc": function (a, b) {
                return ((a < b) ? 1 : ((a > b) ? -1 : 0));
            }
        });
        var oTable = $('#grid_areaInfoElectionParty').dataTable({
            "aoColumns": [
                null,
                null,
                null,
                { "sType": "date-uk" },
                null,
                null,
                null
            ],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [3, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#grid_areaInfoElectionParty_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var ci_filters = function () {
        jQuery.extend(jQuery.fn.dataTableExt.oSort, {
            "date-uk-pre": function (a) {
                var c = a.split(' ');
                var ukDatea = c[0].split('-');
                return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
            },

            "date-uk-asc": function (a, b) {
                return ((a < b) ? -1 : ((a > b) ? 1 : 0));
            },

            "date-uk-desc": function (a, b) {
                return ((a < b) ? 1 : ((a > b) ? -1 : 0));
            }
        });
        var oTable = $('#GridView_Cdetails').dataTable({
            "aoColumns": [
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                null,
                { "sType": "date-uk" },
                null
            ],

            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers",
                "sEmptyTable": "My Custom Message On Empty Table",
                "oPaginate": {
                    "sFirst": "Muka Surat Pertama", // This is the link to the first page
                    "sPrevious": "Selepas", // This is the link to the previous page
                    "sNext": "Seterusnya", // This is the link to the next page
                    "sLast": "Muka Surat Terakhir" // This is the link to the last page
                }
            },
            "aaSorting": [
                [9, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridView_Cdetails_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };
    return {
        //main function to initiate template pages
        init: function () {
            runDataTable();
            runDataTable2();
            kawasan();
            km();
            pi();
            tetapan();
            guser();
            gri_party();
            ci_filters();
        }
    };
}();