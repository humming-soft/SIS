<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_add.aspx.cs" Inherits="SIS_V.state.laporan_harian_add" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {

            $('.addToTable').click(function () {
                $copy = $(this).parent().parent().next();
                $length = $copy.find('.c-here').length;
                $append = $copy;
                $copy.find('.row_remove').removeClass('hidden');
                $cloned = $copy.clone();
                $cloned.find('input:text').each(function () {
                    $(this).val('');
                    //$(this).removeAttr("id").attr("id", "ContentPlaceHolder1_item_name" + ($length + 1))
                });
                $cloned.find('select').each(function () {
                    $(this).val('');
                });
                $cloned.find('textarea').each(function () {
                    $(this).val('');
                });

                $cloned.find('.item_date').removeAttr("id").attr("id", "ContentPlaceHolder1_item_date" + ($length + 1));
                $cloned.find('.item_activity').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlAktiviti" + ($length + 1));
                $cloned.find('.item_parti').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlparti" + ($length + 1));
                $cloned.find('.item_kodkawasan').removeAttr("id").attr("id", "ContentPlaceHolder1_ddlKodKawasan" + ($length + 1));
                $cloned.find('.item_butiran').removeAttr("id").attr("id", "ContentPlaceHolder1_txtButiran" + ($length + 1));

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
    <script type="text/javascript">
        function vali() {
            var chk;
            chk = $('.lamporan_act').length;
            //alert(chk);
            //setting the value for hiddenfield
            $('#hfaktivity').val(chk);
            laporan_harian_add_activity.init();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Start row -->
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Import Laporan Harian Dari Negeri</h4>
        <p class="text-muted m-b-25 font-13">
            Description here (if any).
        </p>
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
                                        <asp:DropDownList ID="ddlKodKawasan" CssClass="form-control item_kodkawasan" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Jenis Aktiviti</label>
                                        <asp:DropDownList ID="ddlAktiviti" CssClass="form-control item_activity" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:DropDownList ID="ddlparti" CssClass="form-control item_parti" runat="server"></asp:DropDownList>
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
                            <asp:HiddenField ID="hfaktivity" runat="server" ClientIDMode="Static" />
                            <asp:Button ID="btnsimpan" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="vali()" OnClick="btnsimpan_Click" />
                            <asp:Button ID="btnbatal" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
<%--                    <div class="tab-pane" id="profile1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable"><i class="fa fa-plus"></i>Add Baru Aktiviti</button>
                            </div>
                        </div>
                        <div class="c-here active">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row pre_here">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kategori Isu</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Isu</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Sumber Isu</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                Simpan
                            </button>
                            <button type="reset" class="btn btn-default waves-effect waves-light m-l-5">
                                Batal
                            </button>
                        </div>
                    </div>
                    <div class="tab-pane" id="messages1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable"><i class="fa fa-plus"></i>Add Baru Aktiviti</button>
                            </div>
                        </div>
                        <div class="c-here active">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Janji yg Diberi</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Tokoh</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                Simpan
                            </button>
                            <button type="reset" class="btn btn-default waves-effect waves-light m-l-5">
                                Batal
                            </button>
                        </div>
                    </div>
                    <div class="tab-pane" id="settings1">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable"><i class="fa fa-plus"></i>Add Baru Aktiviti</button>
                            </div>
                        </div>
                        <div class="c-here active">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Insiden</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                Simpan
                            </button>
                            <button type="reset" class="btn btn-default waves-effect waves-light m-l-5">
                                Batal
                            </button>
                        </div>
                    </div>
                    <div class="tab-pane" id="settings2">
                        <div class="row">
                            <div class="col-xs-12 col-md-12 col-md-12 col-lg-12">
                                <button type="button" class="btn btn-success pull-right addToTable"><i class="fa fa-plus"></i>Add Baru Aktiviti</button>
                            </div>
                        </div>
                        <div class="c-here active">
                            <a class="pull-right row_remove hidden" href="javascript:void(0)"><i class="fa fa-trash f-s-20"></i></a>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Status</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Justifikasi/Kaveat</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Data Wujud (Ya/Tidak)</label>
                                        <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                Simpan
                            </button>
                            <button type="reset" class="btn btn-default waves-effect waves-light m-l-5">
                                Batal
                            </button>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
