/*
Author : Jane
08/03/2017
Keluar Mengundi login validation script
*/

var Keluar_Mengundi = function () {

    var runKeluarMengundiValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$ddlKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlAreaList: {
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
            runKeluarMengundiValidator();
        }
    };
}();