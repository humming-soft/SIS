<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="candidate_profile_view.aspx.cs" Inherits="SIS_V.state.candidate_profile_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <script type="text/javascript">
        function showBrowseDialog() 
        {
            document.getElementById('<%=FileUpload1.ClientID%>').click();    
        }
        jQuery(document).ready(function () {
            "use strict";
            dtReference.init();
        });
    </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#DropDownList2').customselect();
            $('#DropDownList3').customselect();
            $('#DropDownList4').customselect();

            $('#TextBox25').datepicker({
                format: "dd/mm/yyyy",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            $('#TextBox26').datepicker({
                format: "dd/mm/yyyy",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            $('#TextBox27').datepicker({
                format: "dd/mm/yyyy",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });

            setter();
            $('#img').hide();

        });
    </script>
    <script type="text/javascript">
        function set() {
            var txtval = $("#TextBox2").val();
            var ret = txtval.split("-");
            if (ret.length != 3) {
                alert('Invalid Format');
                $('#TextBox29').val('');
                $('#TextBox4').val('');
            }
            else {
                yr = new Date().getFullYear().toString().substr(-2);
                dob = ret[0];
                gen = ret[2];
                if (parseInt(dob.substring(0, 2)) <= parseInt(yr)) {
                    dob2 = dob.substring(4, 6) + '/' + dob.substring(2, 4) + '/' + '20' + dob.substring(0, 2);

                }
                else {
                    dob2 = dob.substring(4, 6) + '/' + dob.substring(2, 4) + '/' + '19' + dob.substring(0, 2);
                }
                gen2 = gen.substring(0, 4);
                if (parseInt(gen2) % 2 == 0) // even number
                {
                    $('#TextBox29').val('Perempuan'); // Women
                }
                else {
                    $('#TextBox29').val('Lelaki'); // Men
                }
                $('#TextBox4').val(dob2);

            }
        }
        function showBrowseDialog() {
            $('#FileUpload1').click();
        }
        function showBrowseDialogAdd() {
            $('#FileUpload2').click();
        }
        function setter() {
            chk = $('#DropDownList4 option:selected').val();
            split_chk = chk.split("~");
            $('#TextBox18').val(split_chk[3]);
            $('#TextBox19').val(split_chk[2]);
            $('#TextBox20').val(split_chk[1]);
        }
    </script>
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var filename = $("#FileUpload1").val();
                var extension = filename.replace(/^.*\./, '');
                if (extension == filename) {
                    extension = '';
                } else {
                    extension = extension.toLowerCase();
                }
                if (extension == 'jpg' || extension == 'jpeg' || extension == 'png') {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#imager').attr('src', '');
                        $('#ContentPlaceHolder1_imager').hide();
                        $('#img').show();
                        $('#img').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
                else {
                    $("#FileUpload1").val('');
                    $('#imager').attr('src', '../assets/images/users/avatar-0.jpg');
                    alert("Invalid Extension - Supported Image types(JPG, JPEG, PNG) !");
                }
            }
        }
    </script>
    <script type="text/javascript">
        function readURL2(input) {
            if (input.files && input.files[0]) {
                var filename = $("#FileUpload2").val();
                var extension = filename.replace(/^.*\./, '');
                if (extension == filename) {
                    extension = '';
                } else {
                    extension = extension.toLowerCase();
                }
                if (extension == 'rar' || extension == 'zip') {
                    $('#rar_name').text(filename);
                }
                else {
                    $("#FileUpload2").val('');
                    $('#rar_name').text('');
                    alert("Invalid Extension - Supported Archive types(.rar, .zip) !");
                }
            }
        }
    </script>
    <script type="text/javascript">
        function reseter() {
            $("#FileUpload1").val('');
            $('#imager').attr('src', '../assets/images/users/avatar-0.jpg');
            $('#img').attr('src', '');
            $("#FileUpload2").val('');
            $('#rar_name').text('');
        }
    </script>
    <script type="text/javascript">
        function canprof_update() {
            cand_profile_update.init();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <asp:Label ID="lblinvalid" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH PROFIL BAKAL CALON / INDIVIDU</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PERIBADI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="title">Gelaran</label>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="ic">Kad Pengenalan Calon (Format: 670112-01-2893)</label>
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ClientIDMode="Static" onchange="set()"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="name">Nama Calon</label>
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="dob">Tarikh Lahir</label>
                                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="gender">Jantina</label>
                                            <asp:TextBox ID="TextBox29" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="race">Kaum</label>
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static" DataTextField="lookup_name" DataValueField="lookup_id"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="religion">Agama</label>
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static" DataTextField="lookup_name" DataValueField="lookup_id"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -8 -->

                    <div class="col-lg-3">
                        <div class="gal-detail thumb panel-custom-bg" style="margin-top: 0px">
                            <div style="width: 100%; padding: 0 28%">
                                <div class="gal-detail thumb" style="margin-top: 0px">
                                    <img id="imager" src="../assets/images/users/avatar-0.jpg" runat="server" class="thumb-img" alt="work-thumbnail" style="width: 156px;" />
                                    <img id="img" src="../assets/images/users/avatar-0.jpg" class="thumb-img" alt="work-thumbnail" style="width: 156px;" />
                                </div>
                            </div>
                            <h4 class="text-center" style="margin-top: 10px !important">Calon Profile Image</h4>
                            <div class="ga-border"></div>
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:FileUpload ID="FileUpload1" runat="server" Style="display: none" ClientIDMode="Static" onchange="readURL(this);" />
                                <button type="button" class="btn btn-success waves-light" style="width: 100%" runat="server" onclick="return showBrowseDialog();"><i class="fa fa-image"></i>Select Image</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="address">Alamat</label>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="MultiLine" Height="110px" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="House_Phone">Telefon Rumah</label>
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="Fax_Number">Nombor Fax</label>
                                        <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="Office_Phone">Telefon Pejabat</label>
                                        <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="Email">Emel</label>
                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="Cell_Phone">Telefon Bimbit</label>
                                    <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="Blog">Blog</label>
                                    <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Facebook">Facebook</label>
                                    <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Twitter">Twitter</label>
                                    <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">MAKLUMAT PEKERJAAN</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="job">Pekerjaan</label>
                                    <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="earnings">Pendapatan (RM)</label>
                                    <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">MAKLUMAT PASANGAN</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="Spouse_Name">Nama Pasangan</label>
                                    <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="Num.Young">Bil. Anak</label>
                                    <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">MAKLUMAT PARTI</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Party_Affiliation">Parti Gabungan</label>
                                    <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Parti">Parti</label>
                                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static" onchange="setter()" DataValueField="id" DataTextField="party"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Coalition_Party_Code">Kod Parti Gabungan</label>
                                    <asp:TextBox ID="TextBox19" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Party_Code">Kod Parti</label>
                                    <asp:TextBox ID="TextBox20" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="Member">Nombar Ahli</label>
                                        <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkbox checkbox-pink" style="margin-top: 32px;">
                                        <asp:CheckBox ID="CheckBox2" runat="server" ClientIDMode="Static" />
                                        <label for="lifetime">Ahil Seumur Hidup</label>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="branches">Cawangan</label>
                                        <asp:TextBox ID="TextBox23" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Political_Office">Jawatan Politik</label>
                                    <asp:TextBox ID="TextBox22" runat="server" CssClass="form-control" TextMode="MultiLine" Height="110px" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="Section">Bahagian</label>
                                    <asp:TextBox ID="TextBox24" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="date_join">Tarik Luput Ahli</label>
                                    <asp:TextBox ID="TextBox25" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="date_left">Tarik Daftar Parti</label>
                                    <asp:TextBox ID="TextBox26" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="expiry_date">Tarik Keluar Parti</label>
                                    <asp:TextBox ID="TextBox27" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">MAKLUMAT LAIN</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="asset">Asset</label>
                                    <asp:TextBox ID="TextBox34" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="education">Pendidikan</label>
                                    <asp:TextBox ID="TextBox35" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label for="Additional_Info">Maklumat Tambahan</label>
                                    <asp:TextBox ID="TextBox37" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px" ClientIDMode="Static"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading panel-heading-custom">
                        <h3 class="panel-title">TAMBAH FAIL ARCHIVES</h3>
                    </div>
                    <div class="panel-body panel-custom-bg">
                        <div class="col-xs-12 col-sm-12 col-lg-8 col-md-8">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:FileUpload ID="FileUpload2" runat="server" Style="display: none" ClientIDMode="Static" />
                                        <button type="button" class="btn btn-success waves-light" style="width: 100%" runat="server" ><i class="fa fa-file-zip-o"></i>Select Archives</button>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:Label ID="rar_name" runat="server" ClientIDMode="Static"></asp:Label>
                                    </div>
                                </div>
                                <%--<div class="col-lg-6">
                                    <div class="form-group">
                                        <asp:LinkButton ID="lnkDownload" runat="server" CssClass="fa fa-download no-loader" Font-Underline="false" OnClick="lnkDownload_Click"></asp:LinkButton>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding-left:10px">
            <div class="col-sm-12 col-lg-12 p-0">
                <div class="form-group text-left m-b-0 m-t-15">
                    <asp:Button ID="button1" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" ClientIDMode="Static" OnClick="button1_Click" OnClientClick="canprof_update()" />
                    <%--<asp:Button ID="button2" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Jelas" OnClientClick="reseter();this.form.reset();return false;"/>--%>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top:10px">

        </div>
    </div>

    

    <%--<div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>PAPARAN PROFIL BAKAL CALON / INDIVIDU</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PERIBADI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Gelaran</label>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="userName">Kad Pengenalan Calon (Format: 670112-01-2893)</label>
                                             <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                  <div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="userName">Nama Calon</label>
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Tarikh Lahir</label>
                                             <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Jantina</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Kaum</label>
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Agama</label>
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -8 -->

                    <div class="col-lg-3">
                        <div class="gal-detail thumb panel-custom-bg" style="margin-top:0px">
                            <div style="width:100%; padding: 0 28%">
                                <div class="gal-detail thumb" style="margin-top:0px">
                                    <img src="../assets/images/users/avatar-0.jpg" class="thumb-img" alt="work-thumbnail" style="width:156px;">
                                </div>
                            </div>
                            <h4 class="text-center" style="margin-top:10px !important">Calon Profile Image</h4>
                              <div class="ga-border"></div>
                            <div class="row">
                                <div class="col-lg-6">                              
                                        <div class="form-group text-left m-b-0">
                                            <asp:FileUpload ID="FileUpload1" runat="server" style="display:none" />
                                            <button type="button" class="btn btn-success waves-light" style="width:100%" runat="server" onclick="return showBrowseDialog();"><i class="fa fa-image"></i> Select Image</button>
                                        </div>
                                </div>
                                <div class="col-lg-6">
                                        <div class="form-group text-left m-b-0">
                                            <div class="checkbox checkbox-pink">
                                                <asp:CheckBox ID="CheckBox1" runat="server"/>
                                                <label for="checkbox1"> Hapus Imej</label>
                                            </div>
                                        </div>
                                </div>
                           </div>                                       
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="MultiLine" Height="110px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Telefon Rumah</label>
                                                 <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Nombor Fax</label>
                                                 <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Telefon Pejabat</label>
                                                 <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Emel</label>
                                                 <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                             <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                             <asp:DropDownList ID="DropDownList4" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox19" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox20" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="alamat">Alamat</label>
                                                <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkbox checkbox-pink" style="margin-top:32px;">
                                                <asp:CheckBox ID="CheckBox2" runat="server"/>
                                                <label for="checkbox1"> Ahil Seumur Hidup</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="alamat">Alamat</label>
                                                <asp:TextBox ID="TextBox23" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>                        
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox22" runat="server" CssClass="form-control" TextMode="MultiLine" Height="110px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox24" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox25" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox26" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox27" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox34" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox35" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox37" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col-lg-12">
                         <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="col-lg-12">
                                    <table id="candidate_list1" class="table table-bordered dt-responsive nowrap m-t-10">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>PILIHANRAYA</th>
                                                <th>TARIKH</th>
                                                <th>PARTI</th>
                                                <th>NEGERI</th>
                                                <th>PARLIMEN/DUN</th>
                                                <th>KAWASAN</th>
                                                <th>JUMLAH UNDI</th>
                                                <th>KEPUTUSAN</th>                  
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                     </div>
                    </div>
                  <div class="row">
                     <div class="col-lg-9">
                         <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="col-lg-12">
                                    <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10">
                                        <thead>
                                            <tr>
                                                    <th>#</th>
                                                <th>Nama Fail</th>
                                                <th>Informasi</th>
                                                <th>Muat Turun</th>
                      
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                     </div>
                     <div class="col-lg-3">
                         <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="col-lg-12">
                                    <div class="form-group text-left m-b-0 m-t-15">
                                        <button id="button3" data-toggle="modal" data-target="#file-archive-modal" type="button" class="btn btn-success waves-light" style="width:100%">Kemaskini Archive</button>
                                    </div>
                                </div>
                                 <div class="col-lg-12">
                                    <div class="form-group text-left m-b-0 m-t-15">
                                        <asp:Button ID="button4" CssClass="btn btn-warning waves-light" Width="100%" runat="server" Text="Hapus Archive" />
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-lg-12 p-0">
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="button1" CssClass="btn btn-primary waves-light" runat="server" Text="Kemaskini" />
                                <asp:Button ID="button2" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Hapus Rekod"/>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
        <!-- Modal -->
        <div id="file-archive-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog" style="width:55%">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">FAIL ARCHIVE PROFIL CALON</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                               <div class="panel panel-color panel-primary">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title">PAPARAN SEARAI FAIL ARCHIVES</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg">
                                        <table class="table table-bordered dt-responsive nowrap m-t-10 temp">
                                            <thead>
                                                <tr>
                                                        <th>#</th>
                                                    <th>Nama Fail</th>
                                                    <th>Informasi</th>
                                                    <th>Muat Turun</th>
                      
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                        <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                        <td></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-bottom:20px">
                            <div class="col-md-12">
                                <button id="button5" class="btn btn-warning pull-right">Tambah</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                               <div class="panel panel-color panel-primary">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title">JUSTIFIKASI</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg">
                                         <div class="form-group">
                                            <asp:TextBox ID="TextBox28" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="Kemaskini" />
                        <asp:Button ID="btnClear" CssClass="btn btn-info waves-light" runat="server" Text="Tutup" />
                    </div>
                </div>
            </div>
        </div>--%>
        <!-- /.modal -->
</asp:Content>
