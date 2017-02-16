/*
Author : Agaile
15/02/2017
Custom laporan_harian_add_activity validation script
*/

var laporan_harian_add_activity = function () {
    var runValidator = function () {
        var form = $('#form1');
        var errorHandler = $('.errorHandler', form);
        $.validator.prototype.checkForm = function () {
            //overriden in a specific page
            this.prepareForm();
            for (var i = 0, elements = (this.currentElements = this.elements()) ; elements[i]; i++) {
                if (this.findByName(elements[i].name).length != undefined && this.findByName(elements[i].name).length > 1) {
                    for (var cnt = 0; cnt < this.findByName(elements[i].name).length; cnt++) {
                        this.check(this.findByName(elements[i].name)[cnt]);
                    }
                } else {
                    this.check(elements[i]);
                }
            }
            return this.valid();
        }

        form.validate({
            ignore: ':hidden',
            rules: {
                ctl00$ContentPlaceHolder1$ddlKodKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlAktiviti: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlparti: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtdate: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtButiran: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlKod_KawasanI: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlKategoriIsu: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlSumberIsu: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlPartiI: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtTarikh: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtButiran_Isu: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlKodKawasanj: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtTarikhj: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtjanji: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtNamaTokoh: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlKodKawasanIn: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlPartiIn: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtTarikhIn: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtButiranInsiden: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlKodKawasanKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlstatusKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtTarikhKawasan: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$ddlWujud: {
                    required: true
                },
                ctl00$ContentPlaceHolder1$txtJustifikasi: {
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