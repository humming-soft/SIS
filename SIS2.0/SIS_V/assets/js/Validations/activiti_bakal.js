/*
Author : Jane
28/02/2017
Parliment Info login validation script
*/

var Activiti_Bakal = function () {

    var runActivitiBakalValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            ignore: [],
            rules: {
                ctl00$ContentPlaceHolder1$ddlPilihanraya: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlNegeri: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlParlimen: {
                    required: true,
                    number: true
                },
                ctl00$ContentPlaceHolder1$ddlName: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlJenis: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlSumber: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlTahap: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$dtTarikh: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtButiran: {
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
            runActivitiBakalValidator();
        }
    };
}();