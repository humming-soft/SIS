<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetapan_pentadbir_add.aspx.cs" Inherits="SIS_V.admin.tetapan_pentadbir_add" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <div class="card-box" style="margin: 0 25%;">
                <h4 class="m-t-0 header-title"><b>Tambah Pengguna SIS</b></h4>
                <p class="text-muted font-13 m-b-30">
<%--                    Description (if needed).--%>
                </p>
                <div class="row">
                     <div class="alert alert-danger alert-dismissable" id="log_valid" runat="server">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <p>Please check , you have some form <b>errors</b>!</p>
                        </div>
                    <div class="alert alert-danger alert-dismissable" id="log_uname" runat="server">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <p><b>Login Pengguna </b>is alredy exist!</p>
                        </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="field-1" class="control-label">Nama Pengguna</label>
                            <asp:TextBox ID="txt_log_name" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="field-1" class="control-label">Nama Penuh</label>
                            <asp:TextBox ID="txt_user_name" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="field-1" class="control-label">No Kad Pengenalan</label>
                            <asp:TextBox ID="txt_ic_number" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="field-1" class="control-label">Jawatan</label>
                            <asp:TextBox ID="txt_position" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
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
                            <label for="field-1" class="control-label">Negeri</label>
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
                                <asp:TextBox ID="txt_kata_laulan" CssClass="form-control" ClientIDMode="Static" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Pengesahan Kata Laluan</label>
                                <asp:TextBox ID="txt_pen_kata_laulan" CssClass="form-control" ClientIDMode="Static" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                    </div>--%>
                <div class="form-group text-left m-b-0 m-t-15">
                    <asp:Button ID="btn_add" runat="server" CssClass="btn btn-primary waves-light" ClientIDMode="Static" Text="Simpan" OnClick="btn_add_Click" OnClientClick="validate_tetapan()"/>
                    <asp:Button ID="btn_cancel" runat="server" CssClass="btn btn-default waves-light m-l-5" ClientIDMode="Static" Text="Batal" OnClick="btn_cancel_Click" />
                </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
         function validate_tetapan() {
             Add.init();
        }
    </script>
</asp:Content>
