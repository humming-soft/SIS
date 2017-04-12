/*
Author : Jane
12/04/2017
Election Result List validation script
*/

var Election_Result_ListA = function () {
    var runElectionResultListAValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$ddlArea: {
                    required: true
                },
            },
            submitHandler: function (form) {
                errorHandler.hide();
                form.submit();
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                errorHandler.show();
            }
        });
    };
    return {
        //main function to initiate template pages
        init: function () {
            runElectionResultListAValidator();
        }
    };
}();