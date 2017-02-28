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
            rules: {
                ctl00$ContentPlaceHolder1$ddlPilihanraya: {
                    required: true
                },
                //ctl00$ContentPlaceHolder1$txtNamaKawasan: {
                //    required: true
                //},
                //ctl00$ContentPlaceHolder1$txtBil: {
                //    required: true,
                //    number: true
                //},
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
                //ctl00$ContentPlaceHolder1$txtPopulasiPenduduk: {
                //    required: true,
                //    number: true
                //},
                //ctl00$ContentPlaceHolder1$txtPurataUmur: {
                //    required: true,
                //    number: true
                //},
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
            runActivitiBakalValidator();
        }
    };
}();