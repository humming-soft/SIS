/*
Author : Jane
07/04/2017
Election Result validation script
*/

var Election_ResultA = function () {

    var runElectionResultValidatorA = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$txtjpb: {
                    number: true
                },
                ctl00$ContentPlaceHolder1$txtjkud: {
                    number: true
                },
                ctl00$ContentPlaceHolder1$txtjkudpu: {
                    number: true
                },
                ctl00$ContentPlaceHolder1$txtjkudi: {
                    number: true
                },
                ctl00$ContentPlaceHolder1$txtjkutd: {
                    number: true
                },
                ctl00$ContentPlaceHolder1$txtper: {
                    number: true,
                    min: 0,
                    max: 100
                },
                ctl00$ContentPlaceHolder1$txtmajority: {
                    number: true
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
            runElectionResultValidatorA();
        }
    };
}();