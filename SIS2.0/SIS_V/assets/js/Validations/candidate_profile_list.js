/*
Author : Jane
16/02/2017
Parliment Info login validation script
*/

var Candidate_Profile_List = function () {

    var runCandidateProfileValidator = function () {
        console.log("IN");
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);

        //Validator for negative numbers.
        jQuery.validator.addMethod("nonnegative", function (value, element) {
            if (value < 0) {
                return false;
            }
            return true;
        }, "Value cannot be Negative");

        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$ddlNameC: {
                    required: true
                }
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
            runCandidateProfileValidator();
        }
    };
}();