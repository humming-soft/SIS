/*
Author : Jane
16/02/2017
Parliment Info login validation script
*/

var Parliment_Info = function () {

    var runParlimentInfoValidator = function () {
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
                ctl00$ContentPlaceHolder1$txtKodKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtNamaKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtBil: {
                    required: true,
                    digits: true,
                    nonnegative: true
                },
                //ctl00$ContentPlaceHolder1$txtKeluasanKawasan: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtSempadanKawasan: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtKegiatanEkonomi: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtPecahanKaum: {
                //    required: true
                //},
                ctl00$ContentPlaceHolder1$txtPopulasiPenduduk: {
                    required: true,
                    digits: true,
                    nonnegative: true
                },
                ctl00$ContentPlaceHolder1$txtPurataUmur: {
                    required: true,
                    number: true,
                    nonnegative: true
                }
                //ctl00$ContentPlaceHolder1$txtPurataJantina: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtKemudahanAwam: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtTaburanPenduduk: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtKomposisiEtnik: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtKedarPertumbuhanPenduduk: {
                //    required: true
                //}
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
            runParlimentInfoValidator();
        }
    };
}();