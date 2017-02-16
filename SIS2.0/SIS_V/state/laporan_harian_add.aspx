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
                    $(this).datepicker({
                        format: "dd/mm/yyyy",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom",
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
                $cloned.find('.item_butiran').removeAttr("id").attr("id", "ContentPlaceHolder1_txtButiran" + ($length));

                $copy.removeClass('active');
                $cloned.insertBefore($append);
            });

            $(document).on("click", ".row_remove", function () {
                $sp = $(this).parent().parent();
                $c = $(this).parent();
                $length = $sp.find('.c-here').length;
                if (confirm("Do you want to Delete?")) {
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
                    $(this).datepicker({
                        format: "dd/mm/yyyy",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom",
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
                $cloned.find('.item_kod_kawasan').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKod_Kawasan" + ($length));
                $cloned.find('.item_KategoriIsu').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKategoriIsu" + ($length));
                $cloned.find('.item_SumberIsu').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlSumberIsu" + ($length));
                $cloned.find('.item_Parti1').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlParti1" + ($length));
                $cloned.find('.item_date').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikh" + ($length));
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
                    $(this).datepicker({
                        format: "dd/mm/yyyy",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom",
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
                $cloned.find('.item_kod_kawasan1').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasan1" + ($length));
                $cloned.find('.item_date').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikh1" + ($length));
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
                    $(this).datepicker({
                        format: "dd/mm/yyyy",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom",
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
                $cloned.find('.item_kod_kawasan2').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasan2" + ($length));
                $cloned.find('.item_parti2').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlParti2" + ($length));
                $cloned.find('.item_date').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikh2" + ($length));
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
                    $(this).datepicker({
                        format: "dd/mm/yyyy",
                        keyboardNavigation: false,
                        todayHighlight: true, // to highlight today
                        orientation: "bottom",
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
                $cloned.find('.item_kod_kawasan3').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasan3" + ($length));
                $cloned.find('.item_status').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlstatus" + ($length));
                $cloned.find('.item_date').removeAttr("id").attr("id", "ContentPlaceHolder1_txtTarikh3" + ($length));
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
            //alert('test');
            var chk;
            chk = $('.lamporan_act').length;
            //setting the value for hiddenfield
            $('#hfkaktivitiM').val(chk);
            laporan_harian_add_activity.init();
        }
    </script>
    <script type="text/javascript">

        function datepick() {
            var date = new Date();
            var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
            var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
            $('.item_date').datepicker({
                format: "dd/mm/yyyy",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom",
                autoclose: true
            });
        }

    </script>
    <script type="text/javascript">

        // Setting the hidden field values 

        $(document).on("change", ".item_kodkawasan", function () {
            $(this).next().val($(this).val());
        });

        $(document).on("change", ".item_activity", function () {
            $(this).next().val($(this).val());
        });

        $(document).on("change", ".item_parti", function () {
            $(this).next().val($(this).val());
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start row -->
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Import Laporan Harian Dari Negeri</h4>
        <p class="text-muted m-b-25 font-13">
            Description here (if any).
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
                        <a href="#home1" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">1.0 AKTIVITI</span>
                            <span class="hidden-xs">1.0 AKTIVITI</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#profile1" data-toggle="tab" aria-expanded="true">
                            <span class="visible-xs">2.0 ISI-ISU</span>
                            <span class="hidden-xs">2.0 ISI-ISU</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#messages1" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">3.0 JANJI PILIHANRAYA</span>
                            <span class="hidden-xs">3.0 JANJI PILIHANRAYA</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#settings1" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">4.0 INSIDEN</span>
                            <span class="hidden-xs">4.0 INSIDEN</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#settings2" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">5.0 ANALISIS STATUS KAWASAN</span>
                            <span class="hidden-xs">5.0 ANALISIS STATUS KAWASAN</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="home1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable"><i class="fa fa-plus"></i>Add Baru Aktiviti</button>
                            </div>
                        </div>
                        <div class="c-here active lamporan_act">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row pre_here">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:HiddenField ID="key" Value="2" runat="server" />
                                        <asp:DropDownList ID="ddlKodKawasan" CssClass="form-control item_kodkawasan" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                        <asp:HiddenField ID="hfkodkawasan" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Jenis Aktiviti</label>
                                        <asp:DropDownList ID="ddlAktiviti" CssClass="form-control item_activity" runat="server" DataTextField="ad" DataValueField="aid"></asp:DropDownList>
                                        <asp:HiddenField ID="hfkaktiviti" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:DropDownList ID="ddlparti" CssClass="form-control item_parti" runat="server" DataTextField="party_name_bm" DataValueField="party_id"></asp:DropDownList>
                                        <asp:HiddenField ID="hfparti" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="txtdate" runat="server" CssClass="form-control item_date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Aktiviti</label>
                                        <asp:TextBox ID="txtButiran" runat="server" TextMode="MultiLine" CssClass="form-control item_butiran"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfkaktivitiM" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan_Click" />
                            <asp:Button ID="btnbatal" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="profile1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable1"><i class="fa fa-plus"></i>Add Baru Isu</button>
                            </div>
                        </div>
                        <div class="c-here active lamporan_isu">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row pre_here">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:DropDownList ID="ddlKod_KawasanI" CssClass="form-control item_kod_kawasanI" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Kategori Isu</label>
                                        <asp:DropDownList ID="ddlKategoriIsu" CssClass="form-control item_KategoriIsu" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                        <asp:HiddenField ID="HiddenField2" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Sumber Isu</label>
                                        <asp:DropDownList ID="ddlSumberIsu" CssClass="form-control item_SumberIsu" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                        <asp:HiddenField ID="HiddenField3" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:DropDownList ID="ddlPartiI" CssClass="form-control item_PartiI" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                        <asp:HiddenField ID="HiddenField4" runat="server" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="txtTarikh" runat="server" CssClass="form-control item_date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Isu</label>
                                        <asp:TextBox ID="txtButiran_Isu" runat="server" TextMode="MultiLine" CssClass="form-control item_Butiran_Isu"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfisu" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan1" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" />
                            <asp:Button ID="btnbatal1" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="messages1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable2"><i class="fa fa-plus"></i>Add Baru Janji</button>
                            </div>
                        </div>
                        <div class="c-here active lamporan_janji">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:DropDownList ID="ddlKodKawasan1" CssClass="form-control item_kod_kawasan1" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="txtTarikh1" runat="server" CssClass="form-control item_date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Janji yg Diberi</label>
                                        <asp:TextBox ID="txtjanji" runat="server" TextMode="MultiLine" CssClass="form-control item_janji"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Tokoh</label>
                                        <asp:TextBox ID="txtNamaTokoh" runat="server" TextMode="MultiLine" CssClass="form-control item_NamaTokoh"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfjanji" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan2" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" />
                            <asp:Button ID="btnbatal2" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="settings1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable3"><i class="fa fa-plus"></i>Add Baru Insiden</button>
                            </div>
                        </div>
                        <div class="c-here active">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:DropDownList ID="ddlKodKawasan2" CssClass="form-control item_kod_kawasan2" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:DropDownList ID="ddlParti2" CssClass="form-control item_parti2" runat="server" DataTextField="party_name_bm" DataValueField="party_id"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="txtTarikh2" runat="server" CssClass="form-control item_date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Insiden</label>
                                        <asp:TextBox ID="txtButiranInsiden" runat="server" TextMode="MultiLine" CssClass="form-control item_ButiranInsiden"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfinsiden" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan3" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" />
                            <asp:Button ID="btnbatal3" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="settings2">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable4"><i class="fa fa-plus"></i>Add Baru Status Kawasan</button>
                            </div>
                        </div>
                        <div class="c-here active">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:DropDownList ID="ddlKodKawasan3" CssClass="form-control item_kod_kawasan3" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Status</label>
                                        <asp:DropDownList ID="ddlstatus" CssClass="form-control item_status" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="txtTarikh3" runat="server" CssClass="form-control item_date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Data Wujud (Ya/Tidak)</label>
                                        <asp:DropDownList ID="ddlWujud" CssClass="form-control item_Wujud" runat="server" DataTextField="areacode" DataValueField="area_id"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Justifikasi/Kaveat</label>
                                        <asp:TextBox ID="txtJustifikasi" runat="server" TextMode="MultiLine" CssClass="form-control item_Justifikasi"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:HiddenField ID="hfkawasan" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan4" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" />
                            <asp:Button ID="btnbatal4" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end row -->
    </div>
</asp:Content>
