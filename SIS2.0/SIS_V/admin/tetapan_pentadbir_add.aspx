<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetapan_pentadbir_add.aspx.cs" Inherits="SIS_V.admin.tetapan_pentadbir_add" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="assets/js/Validations/tetapan_pentadbir_add.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            tetapan_view.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box" style="margin: 0 25%;">
                <h4 class="m-t-0 header-title"><b>Tambah Aktiviti Bakal Calon/Individu</b></h4>
                <p class="text-muted font-13 m-b-30">
                    Description (if needed).
                </p>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Login Pengguna</label>
                                <asp:TextBox ID="txt_log_name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Nama Penuh</label>
                                <asp:TextBox ID="txt_user_name" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">IC Number</label>
                                <asp:TextBox ID="txt_ic_number" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Position</label>
                                <asp:TextBox ID="txt_position" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Role</label>
                                <asp:DropDownList ID="drop_role" CssClass="form-control" runat="server"
                                     ClientIDMode="Static" DataTextField="rolename" DataValueField="roleid">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">State</label>
                                <asp:DropDownList ID="drop_state" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="state_name" DataValueField="state_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Kata Laluan</label>
                                <asp:TextBox ID="txt_kata_laulan" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Pengesahan Kata Laluan</label>
                                <asp:TextBox ID="txt_pen_kata_laulan" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>--%>
                    <div class="form-group text-left m-b-0 m-t-15">
                        <asp:Button ID="btn_add" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClick="btn_add_Click" />
                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                    </div>
            </div>
        </div>
    </div>
</asp:Content>
