<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="keluar_mengundi.aspx.cs" Inherits="SIS_V.admin.keluar_mengundi" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Import Laporan Harian Dari Negeri</h4>
        <p class="text-muted m-b-25 font-13">
            Description here (if any).
        </p>
        <div class="row">
            <div class="col-lg-12">
                <div class="row" style="margin-bottom: 30px;">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Pilihanraya</label>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Negeri</label>
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Kawasan</label>
                            <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName"></label>
                            <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="">
                    <asp:GridView ID="GridKM" runat="server" CssClass="table table-responsive table-bordered" ClientIDMode="Static" OnPreRender="GridKM_PreRender">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" HeaderText="Edit" />
                            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete" />
                        </Columns>
                    </asp:GridView>
<%--                    <table class="table table-responsive table-bordered" id="datatable-editable">
                        <thead>
                            <tr>
                                <th>Nama Daerah Mengundi</th>
                                <th>Telah Keluar</th>
                                <th>Jumlah Pengundi</th>
                                <th>Peratus</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="gradeX">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeC">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                            <tr class="gradeA">
                                <td>40210 - Lubok Chempedak</td>
                                <td>0</td>
                                <td>427</td>
                                <td>0</td>
                                <td class="actions">
                                    <a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>
                                    <a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>
                                    <a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>--%>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
