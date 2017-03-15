/*
Author : Agaile
10/03/2017
Indiidual / Candidate View based on Filter Validation Script
*/

var activiti_bakal_ci_views = function () {

    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            ignore: [],
            rules: {
                ctl00$ContentPlaceHolder1$ddlName: {
                    require_from_group: [1, ".authSelect"]
                },
                ctl00$ContentPlaceHolder1$ddlJenis: {
                    require_from_group: [1, ".authSelect"]
                },
                ctl00$ContentPlaceHolder1$ddlSumber: {
                    require_from_group: [1, ".authSelect"]
                },
                ctl00$ContentPlaceHolder1$ddlTahap: {
                    require_from_group: [1, ".authSelect"]
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
            runValidator();
        }
    };
}();