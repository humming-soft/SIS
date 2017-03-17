var View = function () {
    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        $.validator.addMethod("loginRegex", function (value, element) {
            return this.optional(element) || /^[a-z0-9\s]+$/i.test(value);
        }, "Contain only letters and numbers.");
        $.validator.addMethod("alphabets", function (value, element) {
            return this.optional(element) || /^[a-z\s]+$/i.test(value);
        }, "Contain only letters.");
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$txt_user_name: {
                    minlength: 3,
                    alphabets: true,
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_ic_number: {
                    loginRegex: true,
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_position: {
                    minlength: 3,
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
var Passwrd = function () {
    var runValidatorPass = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$txt_pass: {
                    minlength: 6,
                    maxlength:10,
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_con_pass: {
                    minlength: 6,
                    maxlength: 10,
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
            runValidatorPass();
        }
    };
}();