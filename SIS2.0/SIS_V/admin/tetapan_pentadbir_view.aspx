<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetapan_pentadbir_view.aspx.cs" Inherits="SIS_V.admin.tetapan_pentadbir_view" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(window).on('load', function () {
                if ($('#hd_validation').val() == "0") {
                    $('#sis-user-edit-modal').modal('show');
                }
                if ($('#hd_password').val() == "0") {
                    $('#sis-password-change-modal').modal('show');
                }
            });
            TableData.init();
            $(document).on("click", '.lock', function () {
                $('#hd_pass').val($(this).closest("tr").find("input[type=hidden][id*=l_name]").val());
                $('#sis-password-change-modal').modal('show');
            });
            $(document).on("click", '.edit', function () {
                $('#txt_log_name').attr("readonly", "readonly");
                $('#txt_log_name').val($(this).closest("tr").find("input[type=hidden][id*=l_name]").val());
                $('#txt_user_name').val($(this).closest("tr").find("input[type=hidden][id*=f_name]").val());
                $('#txt_ic_number').val($(this).closest("tr").find("input[type=hidden][id*=ic_number]").val());
                $('#txt_position').val($(this).closest("tr").find("input[type=hidden][id*=u_position]").val());
                $('#drop_role').val($(this).closest("tr").find("input[type=hidden][id*=r_id]").val());
                $('#drop_state').val($(this).closest("tr").find("input[type=hidden][id*=s_id]").val());
                $('#sis-user-edit-modal').modal('show');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">
                <div class="row m-b-30">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-10">
                        <h4 class="m-t-0 header-title"><b>Paparan Pengguna SIS</b></h4>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                        <a href="tetapan_pentadbir_add" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                    </div>
                </div>
                <asp:GridView ID="grid_user" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="Gridteta_PreRender" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="fullname" HeaderText="Nama Penuh" />
                        <asp:BoundField DataField="log_name" HeaderText="Nama Pengguna" />
                        <asp:BoundField DataField="rolename" HeaderText="Role" />
                        <asp:BoundField DataField="icnumber" HeaderText="No Kad Pengenalan" />
                        <asp:BoundField DataField="position" HeaderText="Jawatan" />
                        <asp:BoundField DataField="regdate" HeaderText="Tarikh Daftar" />
                        <asp:BoundField DataField="state_name" HeaderText="Negeri" />
                        <asp:TemplateField HeaderText="Tindakan">
                            <ItemTemplate>
                                <asp:HiddenField ID="f_name" ClientIDMode="Static" runat="server" Value='<%#Eval("fullname")%>' />
                                <asp:HiddenField ID="l_name" ClientIDMode="Static" runat="server" Value='<%#Eval("log_name")%>' />
                                <asp:HiddenField ID="ic_number" ClientIDMode="Static" runat="server" Value='<%#Eval("icnumber")%>' />
                                <asp:HiddenField ID="u_position" ClientIDMode="Static" runat="server" Value='<%#Eval("position")%>' />
                                <asp:HiddenField ID="r_id" ClientIDMode="Static" runat="server" Value='<%#Eval("role_id")%>' />
                                <asp:HiddenField ID="s_id" ClientIDMode="Static" runat="server" Value='<%#Eval("state_id")%>' />
                                <a id="lock" href="#" class="fa fa-lock lock"></a>
                                <a id="edit" href="#" class="fa fa-edit edit"></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <div id="sis-password-change-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <asp:HiddenField ID="hd_password" ClientIDMode="Static" runat="server" />
            <div class="modal-content">
                <div class="alert alert-danger alert-dismissable" id="valid_match" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p><b>Passwords do not match</b>!</p>
                </div>
                <div class="alert alert-danger alert-dismissable" id="valid_empty" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p>Please check , you have some form <b>errors</b>!</p>
                </div>

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Kemaskini Katalaluan</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <h4>Kemaskini Katalaluan untuk 
                            (Nama Pengguna)
                        </h4>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Kata Laluan Baru</label>
                                <asp:TextBox ID="txt_pass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Pengesahan Kata Laluan</label>
                                <asp:TextBox ID="txt_con_pass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:HiddenField ID="hd_pass" runat="server" ClientIDMode="Static" />
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btn_resetpass" CssClass="btn btn-success" runat="server" Text="Kemaskini" OnClick="btn_resetpass_Click" OnClientClick="fun_passwrdd()" />
                    <asp:Button ID="btn_can" CssClass="btn btn-info waves-light" runat="server" Text="Tutup" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->

    <div id="sis-user-edit-modal" class="modal fade" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Butiran Pengguna</h4>
                </div>
                <div class="modal-body">
                    <asp:HiddenField ID="hd_validation" ClientIDMode="Static" runat="server" />
                    <div class="row">
                        <div class="alert alert-danger alert-dismissable" id="log_valid" runat="server">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <p>Please check , you have some form <b>errors</b>!</p>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Nama Pengguna</label>
                                <asp:TextBox ID="txt_log_name" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Nama Penuh</label>
                                <asp:TextBox ID="txt_user_name" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">No Kad Pengenalan</label>
                                <asp:TextBox ID="txt_ic_number" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Jawatan</label>
                                <asp:TextBox ID="txt_position" CssClass="form-control" runat="server" ClientIDMode="Static"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Role</label>
                                <asp:DropDownList ID="drop_role" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="rolename" DataValueField="roleid">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Negeri</label>
                                <asp:DropDownList ID="drop_state" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="state_name" DataValueField="state_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <asp:Button ID="btn_edit" CssClass="btn btn-default" runat="server" Text="Kemaskini" ClientIDMode="Static" OnClick="btn_edit_Click1" OnClientClick="validate_view()" />
                    <asp:Button ID="btn_cancel" CssClass="btn btn-info waves-light" data-dismiss="modal" ClientIDMode="Static" runat="server" Text="Batal" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function validate_view() {
            View.init();
        }
        function fun_passwrdd() {
            Passwrd.init();
        }
    </script>
    <!-- /.modal -->
</asp:Content>
