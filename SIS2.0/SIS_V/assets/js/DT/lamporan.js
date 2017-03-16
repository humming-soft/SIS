var lamporan = function () {
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
    var runDataTable2 = function () {
        var oTable = $('#GridDataTable2').dataTable({
            "aoColumnDefs": [{
                "aTargets": [0]
            }],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers"
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

    var runDataTable3 = function () {
        var oTable = $('#GridDataTable3').dataTable({
            "aoColumns": [
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
                "pagingType": "full_numbers"
            },
            "aaSorting": [
                [5, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10
        });
        $('#GridDataTable3_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input

        //$('#GridDataTable3').on('page.dt', function () {
        //    console.log($("#GridDataTable3 .mCustomScrollbar:visible").find(".mCSB_inside").length);
        //    if ($("#GridDataTable3 .mCustomScrollbar").find(".mCSB_inside").length == 0) {
        //        $.getScript("../assets/plugins/scroller/jquery.mCustomScrollbar.concat.min.js")
        //                .done(function (script, textStatus) {
        //                        console.log("in");
        //                        $("#GridDataTable3 .mCustomScrollbar").mCustomScrollbar();
        //                });
        //    }
        //});
    };

    var runGridDtActivity = function () {
        var oTable = $('#GridDtActivity').dataTable({
            "aoColumns": [
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
                "pagingType": "full_numbers"
            },
            "aaSorting": [
                [5, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"]
            ],
            "iDisplayLength": 10
        });
        $('#GridDtActivity_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
    };

    var runDataTable4 = function () {
        var oTable = $('#GridDataTable4').dataTable({
            "aoColumns": [
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
                "pagingType": "full_numbers"
            },
            "aaSorting": [
                [6, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridDataTable4_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var runDataTable5 = function () {
        var oTable = $('#GridDataTable5').dataTable({
            "aoColumns": [
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
                "pagingType": "full_numbers"
            },
            "aaSorting": [
                [4, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridDataTable5_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var runDataTable6 = function () {
        var oTable = $('#GridDataTable6').dataTable({
            "aoColumns": [
                null,
                null,
                null,
                null,
                {"sType": "date-uk" },
                null
             ],
            "oLanguage": {
                "sLengthMenu": "Show _MENU_ Rows",
                "sSearch": "",
                "pagingType": "full_numbers"
            },
            "aaSorting": [
                [4, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridDataTable6_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };

    var runDataTable7 = function () {
        var oTable = $('#GridDataTable7').dataTable({
            "aoColumns": [
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
                "pagingType": "full_numbers"
            },
            "aaSorting": [
                [4, 'desc']
            ],
            "aLengthMenu": [
                [5, 10, 15, 20, -1],
                [5, 10, 15, 20, "All"] // change per page values here
            ],
            // set the initial value
            "iDisplayLength": 10,
        });
        $('#GridDataTable7_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };
    return {
        //main function to initiate template pages
        init: function () {
            runDataTable2();
            runDataTable3();
            runGridDtActivity();
            runDataTable4();
            runDataTable5();
            runDataTable6();
            runDataTable7();
        }
    };
}();
