<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tetapan_pentadbir_view.aspx.cs" Inherits="SIS_V.admin.tetapan_pentadbir_view" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();

            $('#lock').on('click', function () {
                $('#sis-password-change-modal').modal('show');
            });

            $('#edit').on('click', function () {
                $('#sis-user-edit-modal').modal('show');
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">

                <h4 class="m-t-0 header-title"><b>Paparan Pengguna SIS</b></h4>
                <a href="tetapan_pentadbir_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                <p class="text-muted font-13 m-b-30">
                    Your description goes here(Malay / English).
                </p>
                <asp:GridView ID="Gridteta" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="Gridteta_PreRender" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Tarikh" HeaderText="Tarikh" />
                        <asp:BoundField DataField="Masa" HeaderText="Masa" />
                        <asp:BoundField DataField="Negeri" HeaderText="Negeri" />
                        <asp:BoundField DataField="Kod Kawasan" HeaderText="Kod Kawasan" />
                        <asp:BoundField DataField="Nama Kawasan" HeaderText="Nama Kawasan" />
                        <asp:BoundField DataField="Daerah Mengundi" HeaderText="Daerah Mengundi" />
                        <asp:BoundField DataField="Parti Gabungan" HeaderText="Parti Gabungan" />
                        <asp:BoundField DataField="Parti" HeaderText="Parti" />
                        <asp:BoundField DataField="Calon" HeaderText="Calon" />
                        <asp:BoundField DataField="Jenis Aktiviti" HeaderText="Jenis Aktiviti" />
                        <asp:BoundField DataField="Sumber" HeaderText="Sumbar Maklumat" />
                        <asp:BoundField DataField="Tahap" HeaderText="Tahap Kesahihan Maklumat" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:HiddenField ID="Key" runat="server" Value='<%Eval("Id")%>' />
                                <a id="lock" href="#" class="fa fa-lock"></a>
                                <a id="edit" href="#" class="fa fa-edit"></a>
<%--                                <asp:LinkButton ID="lnkcp" runat="server" CssClass="fa fa-lock" Font-Underline="False" OnClick="lnkcp_Click"></asp:LinkButton>
                                <asp:LinkButton ID="lnkdelete" runat="server" CssClass="fa fa-edit" Font-Underline="False" OnClick="lnkdelete_Click"></asp:LinkButton>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

    <div id="sis-password-change-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Kemaskini Katalulan</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <h4>Kemaskini Kaka Laiuan untuk
                            (nama user)
                        </h4>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Kata Laluan Baru</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Pengesahan Kata Laluan</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Kemaskini" />
                    <asp:Button ID="Button2" CssClass="btn btn-info waves-light" runat="server" Text="Tutup" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->

    <div id="sis-user-edit-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">JPengguna Baru</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Login Pengguna</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Nama Penuh</label>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">IC Number</label>
                                <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Position</label>
                                <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Level</label>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem>BKS Management</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button3" CssClass="btn btn-default" runat="server" Text="Kemaskini" />
                    <asp:Button ID="Button4" CssClass="btn btn-info waves-light" runat="server" Text="Batal" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
</asp:Content>
