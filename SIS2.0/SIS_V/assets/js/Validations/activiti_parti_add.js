var Add = function () {
    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            rules: {
                ctl00$ContentPlaceHolder1$drop_prlimen: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_pilihnraya: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_parti: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_datetime: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_jenis: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_category: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_sumbar_isu: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_sumber: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_tahap: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txt_detail: {
                    minlength:1,
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_status: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_prtubuhan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_statusjanji: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$drop_agency: {
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