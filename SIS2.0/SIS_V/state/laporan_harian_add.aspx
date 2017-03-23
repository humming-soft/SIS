<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_add.aspx.cs" Inherits="SIS_V.state.laporan_harian_add" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <%--    /***********************************************************   Remove function is reused for every Tab's  ***********************************************************************/--%>

    <%--/***************************************************************   ACTIVITY : START   **********************************************************************************************/--%>
    <script type="text/javascript">
        $(function () {

            datepick();

            $('.addToTable').click(function () {
                $copy = $(this).parent().parent().next();
                $length = $(this).parent().parent().parent().find('.c-here').length;
                $append = $copy;
                $copy.find('.row_remove').removeClass('hidden');
                $cloned = $copy.clone();
                $cloned.find('input:text').each(function () {
                    $(this).val('');
                    $(this).datetimepicker({
                        format: "dd/mm/yyyy hh:ii",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom auto",
                        autoclose: true
                    });
                });
                $cloned.find('select').each(function () {
                    $(this).val('');
                });
                $cloned.find('textarea').each(function () {
                    $(this).val('');
                });
                //$cloned.find('input:hidden').each(function () {
                //    $(this).val('');
                //});
                $cloned.find('.error').each(function () {
                    if ($(this).is('label')) {
                        $(this).remove();
                    } else {
                        $(this).removeAttr('aria-invalid');
                        $(this).removeAttr('aria-required');
                        $(this).removeClass('error');
                    }
                });
                $cloned.find('.item_date').removeAttr("id").attr("id", "ContentPlaceHolder1_item_date" + ($length));
                $cloned.find('.item_activity').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlAktiviti" + ($length));
                $cloned.find('.item_parti').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlparti" + ($length));
                $cloned.find('.item_kodkawasan').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasan" + ($length));
                $cloned.find('.item_sumberm').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlSumberM" + ($length));
                $cloned.find('.item_tahapk').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlTahapK" + ($length));
                $cloned.find('.item_butiran').removeAttr("id").attr("id", "ContentPlaceHolder1_txtButiran" + ($length));

                $copy.removeClass('active');
                $cloned.insertBefore($append);
            });

            $(document).on("click", ".row_remove", function () {
                $sp = $(this).parent().parent();
                $c = $(this).parent();
                $length = $sp.find('.c-here').length;
                if (confirm("Anda pasti ingin memadamkan?")) {
                    $c.remove();
                    if ($sp.find('.c-here.active').length == 0) {
                        $sp.find('.c-here:first').addClass('active');
                    }
                    if ($length == 2) {
                        $sp.find('.c-here').addClass('active');
                        $sp.find('.row_remove').addClass('hidden');
                    }
                }
            });
        });
    </script>

    <%--/***************************************************************   ACTIVITY : END   **********************************************************************************************/--%>

    <%--/***************************************************************   ISSUE : START   **********************************************************************************************/--%>
    <script type="text/javascript">
        $(function () {
            $('.addToTable1').click(function () {
                $copy = $(this).parent().parent().next();
                $length = $(this).parent().parent().parent().find('.c-here').length;
                $append = $copy;
                $copy.find('.row_remove').removeClass('hidden');
                $cloned = $copy.clone();
                $cloned.find('input:text').each(function () {
                    $(this).val('');
                    $(this).datetimepicker({
                        format: "dd/mm/yyyy hh:ii",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom auto",
                        autoclose: true
                    });
                });
                $cloned.find('select').each(function () {
                    $(this).val('');
                });
                $cloned.find('textarea').each(function () {
                    $(this).val('');
                });
                $cloned.find('.error').each(function () {
                    if ($(this).is('label')) {
                        $(this).remove();
                    } else {
                        $(this).removeAttr('aria-invalid');
                        $(this).removeAttr('aria-required');
                        $(this).removeClass('error');
                    }
                });
                $cloned.find('.item_kod_kawasanI').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKod_KawasanI" + ($length));
                $cloned.find('.item_KategoriIsu').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKategoriIsu" + ($length));
                $cloned.find('.item_SumberIsu').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlSumberIsu" + ($length));
                $cloned.find('.item_PartiI').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlPartiI" + ($length));
                $cloned.find('.item_dateI').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikhI" + ($length));
                $cloned.find('.item_Butiran_Isu').removeAttr("id").attr("id", "ContentPlaceHolder1_txtButiran_Isu" + ($length));
                $copy.removeClass('active');
                $cloned.insertBefore($append);
            });
        });
    </script>

    <%--/********************************************************************   ISSUE : END   *****************************************************************************************/--%>


    <%--/********************************************************************   JANJI : START   *****************************************************************************************/--%>

    <script type="text/javascript">
        $(function () {
            $('.addToTable2').click(function () {
                $copy = $(this).parent().parent().next();
                $length = $(this).parent().parent().parent().find('.c-here').length;
                $append = $copy;
                $copy.find('.row_remove').removeClass('hidden');
                $cloned = $copy.clone();
                $cloned.find('input:text').each(function () {
                    $(this).val('');
                    $(this).datetimepicker({
                        format: "dd/mm/yyyy hh:ii",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom auto",
                        autoclose: true
                    });
                });
                $cloned.find('select').each(function () {
                    $(this).val('');
                });
                $cloned.find('textarea').each(function () {
                    $(this).val('');
                });
                $cloned.find('.error').each(function () {
                    if ($(this).is('label')) {
                        $(this).remove();
                    } else {
                        $(this).removeAttr('aria-invalid');
                        $(this).removeAttr('aria-required');
                        $(this).removeClass('error');
                    }
                });
                $cloned.find('.item_kod_kawasanj').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasanj" + ($length));
                $cloned.find('.item_datej').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikhj" + ($length));
                $cloned.find('.item_janji').removeAttr("id").attr("id", "ContentPlaceHolder1_txtjanji" + ($length));
                $cloned.find('.item_NamaTokoh').removeAttr("id").attr("id", "ContentPlaceHolder1_txtNamaTokoh" + ($length));
                $copy.removeClass('active');
                $cloned.insertBefore($append);
            });
        });
    </script>

    <%--/********************************************************************   JANJI : END   *****************************************************************************************/--%>

    <%--/********************************************************************   INSIDEN : START   *****************************************************************************************/--%>

    <script type="text/javascript">
        $(function () {
            $('.addToTable3').click(function () {
                $copy = $(this).parent().parent().next();
                $length = $(this).parent().parent().parent().find('.c-here').length;
                $append = $copy;
                $copy.find('.row_remove').removeClass('hidden');
                $cloned = $copy.clone();
                $cloned.find('input:text').each(function () {
                    $(this).val('');
                    $(this).datetimepicker({
                        format: "dd/mm/yyyy hh:ii",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom auto",
                        autoclose: true
                    });
                });
                $cloned.find('select').each(function () {
                    $(this).val('');
                });
                $cloned.find('textarea').each(function () {
                    $(this).val('');
                });
                $cloned.find('.error').each(function () {
                    if ($(this).is('label')) {
                        $(this).remove();
                    } else {
                        $(this).removeAttr('aria-invalid');
                        $(this).removeAttr('aria-required');
                        $(this).removeClass('error');
                    }
                });
                $cloned.find('.item_kod_kawasanIn').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasanIn" + ($length));
                $cloned.find('.item_partiIn').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlPartiIn" + ($length));
                $cloned.find('.item_dateIn').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikhIn" + ($length));
                $cloned.find('.item_ButiranInsiden').removeAttr("id").attr("id", "ContentPlaceHolder1_txtButiranInsiden" + ($length));
                $copy.removeClass('active');
                $cloned.insertBefore($append);
            });
        });
    </script>

    <%--/********************************************************************   INSIDEN : END   *****************************************************************************************/--%>


    <%--/********************************************************************   KAWASAN : START   *****************************************************************************************/--%>

    <script type="text/javascript">
        $(function () {
            $('.addToTable4').click(function () {
                $copy = $(this).parent().parent().next();
                $length = $(this).parent().parent().parent().find('.c-here').length;
                $append = $copy;
                $copy.find('.row_remove').removeClass('hidden');
                $cloned = $copy.clone();
                $cloned.find('input:text').each(function () {
                    $(this).val('');
                    $(this).datetimepicker({
                        format: "dd/mm/yyyy hh:ii",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom auto",
                        autoclose: true
                    });
                });
                $cloned.find('select').each(function () {
                    $(this).val('');
                });
                $cloned.find('textarea').each(function () {
                    $(this).val('');
                });
                $cloned.find('.error').each(function () {
                    if ($(this).is('label')) {
                        $(this).remove();
                    } else {
                        $(this).removeAttr('aria-invalid');
                        $(this).removeAttr('aria-required');
                        $(this).removeClass('error');
                    }
                });
                $cloned.find('.item_kod_kawasanKawasan').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasanKawasan" + ($length));
                $cloned.find('.item_statusKawasan').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlstatusKawasan" + ($length));
                $cloned.find('.item_dateKawasan').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikhKawasan" + ($length));
                $cloned.find('.item_Wujud').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlWujud" + ($length));
                $cloned.find('.item_Justifikasi').removeAttr("id").attr("id", "ContentPlaceHolder1_txtJustifikasi" + ($length));
                $copy.removeClass('active');
                $cloned.insertBefore($append);
            });
        });
    </script>
    <%--/********************************************************************   KAWASAN : END   *****************************************************************************************/--%>

    <script type="text/javascript">
        function vali() {
            chk = $('.lamporan_act').length;
            chk1 = $('.lamporan_isu').length;
            chk2 = $('.lamporan_janji').length;
            chk3 = $('.laporan_insiden').length;
            chk4 = $('.laporan_kawasan').length;
            //setting the value for hiddenfield
            $('#hfkaktivitiM').val(chk);
            $('#hfisu').val(chk1);
            $('#hfjanji').val(chk2);
            $('#hfinsiden').val(chk3);
            $('#hfkawasan').val(chk4);
            laporan_harian_add_activity.init();
        }
    </script>
    <script type="text/javascript">

        function datepick() {
            var date = new Date();
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
            $('.item_date').datetimepicker({
                format: "dd/mm/yyyy hh:ii",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            $('.item_dateI').datetimepicker({
                format: "dd/mm/yyyy hh:ii",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            $('.item_datej').datetimepicker({
                format: "dd/mm/yyyy hh:ii",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            $('.item_dateIn').datetimepicker({
                format: "dd/mm/yyyy hh:ii",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            $('.item_dateKawasan').datetimepicker({
                format: "dd/mm/yyyy hh:ii",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });
        }

    </script>
    <script type="text/javascript">

        // Setting the hidden field values 

        //ACTIVITY

        $(document).on("change", ".item_kodkawasan", function () {
            $(this).prev().val($(this).val());
        });

        $(document).on("change", ".item_activity", function () {
            $(this).prev().val($(this).val());
        });

        $(document).on("change", ".item_parti", function () {
            $(this).prev().val($(this).val());
        });

        $(document).on("change", ".item_sumberm", function () {
            $(this).prev().val($(this).val());
        });

        $(document).on("change", ".item_tahapk", function () {
            $(this).prev().val($(this).val());
        });

        //ISSUE

        $(document).on("change", ".item_kod_kawasanI", function () {
            $(this).prev().val($(this).val());
        });

        $(document).on("change", ".item_KategoriIsu", function () {
            $(this).prev().val($(this).val());
        });

        $(document).on("change", ".item_SumberIsu", function () {
            $(this).prev().val($(this).val());
        });
        $(document).on("change", ".item_PartiI", function () {
            $(this).prev().val($(this).val());
        });

        //JANJI

        $(document).on("change", ".item_kod_kawasanj", function () {
            $(this).prev().val($(this).val());
        });

        //INSIDEN

        $(document).on("change", ".item_kod_kawasanIn", function () {
            $(this).prev().val($(this).val());
        });
        $(document).on("change", ".item_partiIn", function () {
            $(this).prev().val($(this).val());
        });

        //STATUS KAWASAN

        $(document).on("change", ".item_kod_kawasanKawasan", function () {
            $(this).prev().val($(this).val());
        });
        $(document).on("change", ".item_statusKawasan", function () {
            $(this).prev().val($(this).val());
        });
        $(document).on("change", ".item_Wujud", function () {
            $(this).prev().val($(this).val());
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start row -->
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Tambah Laporan Harian Negeri</h4>
        <p class="text-muted m-b-25 font-13">
        </p>
        <div class="col-md-12">
            <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <asp:Label ID="lblinvalid" runat="server"></asp:Label>
            </div>
            <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <asp:Label ID="lblsuccess" runat="server"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs navtab-custom nav-justified">
                    <li class="active">
                        <a href="#home1" data-toggle="tab" aria-expanded="false" class="no-loader">
                            <span class="visible-xs">1.0 AKTIVITI</span>
                            <span class="hidden-xs">1.0 AKTIVITI</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#profile1" data-toggle="tab" aria-expanded="true" class="no-loader">
                            <span class="visible-xs">2.0 ISU-ISU</span>
                            <span class="hidden-xs">2.0 ISU-ISU</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#messages1" data-toggle="tab" aria-expanded="false" class="no-loader">
                            <span class="visible-xs">3.0 JANJI PILIHANRAYA</span>
                            <span class="hidden-xs">3.0 JANJI PILIHANRAYA</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#settings1" data-toggle="tab" aria-expanded="false" class="no-loader">
                            <span class="visible-xs">4.0 INSIDEN</span>
                            <span class="hidden-xs">4.0 INSIDEN</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#settings2" data-toggle="tab" aria-expanded="false" class="no-loader">
                            <span class="visible-xs">5.0 ANALISIS STATUS KAWASAN</span>
                            <span class="hidden-xs">5.0 ANALISIS STATUS KAWASAN</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="home1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable"><i class="fa fa-plus"></i>Tambah Aktiviti Baru</button>
                            </div>
                        </div>
                        <div class="c-here active lamporan_act">
                            <a class="pull-right row_remove hidden no-loader" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row pre_here m-t-20">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parlimen - DUN</label>
                                        <asp:HiddenField ID="hfkodkawasan" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlKodKawasan" CssClass="form-control item_kodkawasan" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Jenis Aktiviti</label>
                                        <asp:HiddenField ID="hfkaktiviti" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlAktiviti" CssClass="form-control item_activity" runat="server" DataTextField="ad" DataValueField="aid"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:HiddenField ID="hfparti" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlparti" CssClass="form-control item_parti" runat="server" DataTextField="party_name_bm" DataValueField="party_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh dan Masa</label>
                                        <asp:TextBox ID="txtdate" runat="server" CssClass="form-control item_date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Sumber Maklumat</label>
                                        <asp:HiddenField ID="hfsumberm" runat="server" />
                                        <asp:DropDownList ID="ddlSumberM" runat="server" CssClass="form-control item_sumberm" DataTextField="lookup_name" DataValueField="lookup_id"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tahap Kesahihan</label>
                                        <asp:HiddenField ID="hftahapk" runat="server" />
                                        <asp:DropDownList ID="ddlTahapK" runat="server" CssClass="form-control item_tahapk" DataTextField="validity_type" DataValueField="validity_id"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label for="userName">Butiran Aktiviti</label>
                                        <asp:TextBox ID="txtButiran" runat="server" TextMode="MultiLine" CssClass="form-control item_butiran"></asp:TextBox>
                                    </div>
                                    <label for="activitiButiran" style="color: #1e90ff">* AKTIVITI, PENGANJUR,  TEMPAT, PENCERAMAH, VIP, KUMPULAN SASAR, JUMLAH KEHADIRAN, LAIN-LAIN</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfkaktivitiM" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan_Click" />
                            <asp:Button ID="btnbatal" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;" />
                        </div>
                    </div>
                    <div class="tab-pane" id="profile1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable1"><i class="fa fa-plus"></i>Tambah Isu Baru</button>
                            </div>
                        </div>
                        <div class="c-here active lamporan_isu">
                            <a class="pull-right row_remove hidden no-loader" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row pre_here m-t-20">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parlimen - DUN</label>
                                        <asp:HiddenField ID="kod_kawasanI" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlKod_KawasanI" CssClass="form-control item_kod_kawasanI" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Kategori Isu</label>
                                        <asp:HiddenField ID="KategoriIsu" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlKategoriIsu" CssClass="form-control item_KategoriIsu" runat="server" DataTextField="current_issue_name" DataValueField="current_issue_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Sumber Isu</label>
                                        <asp:HiddenField ID="SumberIsu" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlSumberIsu" CssClass="form-control item_SumberIsu" runat="server" DataTextField="lookup_name" DataValueField="lookup_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:HiddenField ID="PartiI" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlPartiI" CssClass="form-control item_PartiI" runat="server" DataTextField="party_name_bm" DataValueField="party_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh dan Masa</label>
                                        <asp:TextBox ID="txtTarikh" runat="server" CssClass="form-control item_dateI"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label for="userName">Butiran Isu</label>
                                        <asp:TextBox ID="txtButiran_Isu" runat="server" TextMode="MultiLine" CssClass="form-control item_Butiran_Isu"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfisu" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan1" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan1_Click" />
                            <asp:Button ID="btnbatal1" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;" />
                        </div>
                    </div>
                    <div class="tab-pane" id="messages1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable2"><i class="fa fa-plus"></i>Tambah Janji Baru</button>
                            </div>
                        </div>
                        <div class="c-here active lamporan_janji">
                            <a class="pull-right row_remove hidden no-loader" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row m-t-20">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Parlimen - DUN</label>
                                        <asp:HiddenField ID="kod_kawasanJ" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlKodKawasanj" CssClass="form-control item_kod_kawasanj" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh dan Masa</label>
                                        <asp:TextBox ID="txtTarikhj" runat="server" CssClass="form-control item_datej"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="userName">Janji Yang Diberi</label>
                                        <asp:TextBox ID="txtjanji" runat="server" TextMode="MultiLine" CssClass="form-control item_janji"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="userName">Nama Tokoh</label>
                                        <asp:TextBox ID="txtNamaTokoh" runat="server" TextMode="MultiLine" CssClass="form-control item_NamaTokoh"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfjanji" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan2" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan2_Click" />
                            <asp:Button ID="btnbatal2" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;" />
                        </div>
                    </div>
                    <div class="tab-pane" id="settings1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable3"><i class="fa fa-plus"></i>Tambah Insiden Baru</button>
                            </div>
                        </div>
                        <div class="c-here active laporan_insiden">
                            <a class="pull-right row_remove hidden no-loader" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row m-t-20">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parlimen - DUN</label>
                                        <asp:HiddenField ID="hfKodKawasanIn" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlKodKawasanIn" CssClass="form-control item_kod_kawasanIn" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:HiddenField ID="hfPartiIn" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlPartiIn" CssClass="form-control item_partiIn" runat="server" DataTextField="party_name_bm" DataValueField="party_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh dan Masa</label>
                                        <asp:TextBox ID="txtTarikhIn" runat="server" CssClass="form-control item_dateIn"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="userName">Butiran Insiden</label>
                                        <asp:TextBox ID="txtButiranInsiden" runat="server" TextMode="MultiLine" CssClass="form-control item_ButiranInsiden"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfinsiden" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan3" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan3_Click" />
                            <asp:Button ID="btnbatal3" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;" />
                        </div>
                    </div>
                    <div class="tab-pane" id="settings2">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable4"><i class="fa fa-plus"></i>Tambah Status Kawasan Baru</button>
                            </div>
                        </div>
                        <div class="c-here active laporan_kawasan">
                            <a class="pull-right row_remove hidden no-loader" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row m-t-20">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parlimen - DUN</label>
                                        <asp:HiddenField ID="hfKodKawasanKawasan" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlKodKawasanKawasan" CssClass="form-control item_kod_kawasanKawasan" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Status</label>
                                        <asp:HiddenField ID="hfstatusKawasan" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlstatusKawasan" CssClass="form-control item_statusKawasan" runat="server" DataTextField="Text" DataValueField="Value"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh dan Masa</label>
                                        <asp:TextBox ID="txtTarikhKawasan" runat="server" CssClass="form-control item_dateKawasan"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Data Wujud (Ya/Tidak)</label>
                                        <asp:HiddenField ID="hfWujud" runat="server" ClientIDMode="Static" />
                                        <asp:DropDownList ID="ddlWujud" CssClass="form-control item_Wujud" runat="server" DataTextField="areacode" DataValueField="area_id">
                                            <asp:ListItem Value="">---PILIH---</asp:ListItem>
                                            <asp:ListItem Value="1">Ya</asp:ListItem>
                                            <asp:ListItem Value="2">Tidak</asp:ListItem>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="form-group">
                                        <label for="userName">Justifikasi / Halangan</label>
                                        <asp:TextBox ID="txtJustifikasi" runat="server" TextMode="MultiLine" CssClass="form-control item_Justifikasi"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfkawasan" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan4" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan4_Click" />
                            <asp:Button ID="btnbatal4" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->
    </div>
</asp:Content>
