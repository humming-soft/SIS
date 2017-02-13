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
                    <asp:GridView ID="GridKM" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridKM_PreRender" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridKM_RowCancelingEdit" OnRowEditing="GridKM_RowEditing">
                        <Columns>
                            <asp:BoundField DataField="Tarikh" HeaderText="Tarikh" ReadOnly="true" />
                            <asp:BoundField DataField="Masa" HeaderText="Masa" ReadOnly="true" />
                            <asp:BoundField DataField="Negeri" HeaderText="Negeri" ReadOnly="true" />
                            <asp:BoundField DataField="Kod Kawasan" HeaderText="Kod Kawasan" ReadOnly="true" />
                            <asp:BoundField DataField="Nama Kawasan" HeaderText="Nama Kawasan" />
                            <asp:BoundField DataField="Daerah Mengundi" HeaderText="Daerah Mengundi" />
                            <asp:BoundField DataField="Parti Gabungan" HeaderText="Parti Gabungan" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:HiddenField ID="Key" runat="server" Value='<%Eval("Id")%>' />
                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-pencil" CommandName="Edit"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkdelete" runat="server" CssClass="fa fa-trash" CommandName="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="fa fa-refresh" CommandName="Update"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkcancel" runat="server" CssClass="fa fa-close" CommandName="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
