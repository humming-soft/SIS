var Add = function () {
    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$txt_log_name: {
                    minlength: 5,
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_user_name: {
                    minlength: 5,
                    required: true

                },
                ctl00$ContentPlaceHolder1$txt_ic_number: {
                    minlength: 4,
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_position: {
                    minlength: 2,
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_role: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_state: {
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
            runValidator();
        }
    };
}();