/**
 * Created by sebin on 03-02-2017.
 */
var _sn = function (options) {

    var Window = $(window);
    var Splash = $('.splash');

    var runCustom = function (options) {
        $('form').submit(function () {
            if (!$(this).hasClass('no-loader')) {
                Splash.fadeIn('slow');
            }
        })
        $('a').click(function () {
            if (($(this).attr('href') != '#')) {
                if (!$(this).hasClass('no-loader')) {
                    Splash.fadeIn('slow');
                }
            }
        })
        $(document).on("click", ".add-loader", function () {
            Splash.fadeIn('slow');
        })
        Window.bind("load", function () {
            // Remove splash screen after load
            Splash.fadeOut('slow');
        });

        Window.bind("pageshow", function (event) {
            Splash.fadeOut('slow');
        });

    }
    return {
        init: function (options) {
            runCustom();
        }
    }
}();
var justifikasi = function () {

    var Splash = $('.splash');

    var runLoginValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$TextComment: {
                    minlength: 2,
                    required: true
                }
            },
            submitHandler: function (form) {
                errorHandler.hide();
                form.submit();
                Splash.fadeIn('slow');
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                errorHandler.show();
            }
        });
    };
    return {
        //main function to initiate template pages
        init: function () {
            runLoginValidator();
        }
    };
}();


var dtReference = function () {
    var runDtCandidate = function () {
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
        var oTable = $('#candidate_list').dataTable({
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
        $('#candidate_list_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };
    var runDtElection = function () {
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
        var oTable = $('#candidate_list1').dataTable({
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
        $('#candidate_list1_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };
    var temp = function () {
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
        var oTable = $('.temp').dataTable({
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
        $('#DataTables_Table_0_wrapper .dataTables_filter input').addClass("form-control input-sm").attr("placeholder", "Search");
        // modify table search input
    };
    return {
        //main function to initiate template pages
        init: function () {
            runDtCandidate();
            runDtElection();
            temp();
        }
    };
}();

jQuery(document).ready(function () {
    "use strict";
    _sn.init();
});

var _winnableAdd = function (options) {
    var validate = function (options) {
      
    }
    return {
        init: function (options) {
            validate(options);
        }
    }
}();