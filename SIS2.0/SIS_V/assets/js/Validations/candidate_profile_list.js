/*
Author : Jane
29/03/2017
Candidate profile validation script
*/

var Candidate_Profile_List = function () {

    var runCandidateProfileValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            ignore: [],
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