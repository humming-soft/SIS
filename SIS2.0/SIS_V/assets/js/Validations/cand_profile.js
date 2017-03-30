/*
Author : Agaile
29/03/2017
Add Candidate Profile Validation
*/

var cand_profile = function () {

    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        form.validate({
            ignore: [],
            rules: {
                ctl00$ContentPlaceHolder1$TextBox2: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$TextBox3: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$TextBox4: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$TextBox29: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$DropDownList2: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$DropDownList3: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$FileUpload1: {
                    required: true,
                    accept: "image/jpeg,image/jpg,image/png"
                },
                ctl00$ContentPlaceHolder1$TextBox18: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$DropDownList4: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$TextBox19: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$TextBox20: {
                    required : true
                },
                ctl00$ContentPlaceHolder1$FileUpload2: {
                    extension: "rar,zip"
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