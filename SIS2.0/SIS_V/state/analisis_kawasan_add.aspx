<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analisis_kawasan_add.aspx.cs" Inherits="SIS_V.state.analisis_kawasan_add"  MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Tambah Maklumat Analisis Kawasan</b></h4>
                <p class="text-muted font-13 m-b-30">
                    Description (if needed).
                </p>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Negeri</label>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Parlimen</label>
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">DUN</label>
                            <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Daerah Mengundi</label>
                            <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Lokaliti</label>
                            <asp:DropDownList ID="DropDownList5" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Warna</label>
                            <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Tarikh</label>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="userName">Justifikasi</label>
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Style="width: 100%; min-height: 200px" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="userName">Sumber Agensi</label>
                            <asp:DropDownList ID="DropDownList7" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <button type="button" class="btn btn-success waves-effect waves-light btn-md" data-toggle="modal" data-target="#sis-analisis-tambah-modal">
                            Tambah
                        </button>
                        <button type="button" class="btn btn-primary waves-effect waves-light btn-md" data-toggle="modal" data-target="#sis-analisis-carian-modal">
                            Carian Agensi
                        </button>
                    </div>
                </div>

                <div class="row m-t-15">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th>Sumber Maklumat</th>
                                        <th>Kod Agensi</th>
                                        <th>Kod Justifikasi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="form-group text-left m-b-0 m-t-15">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                </div>
            </div>
        </div>
    </div>

    <div id="sis-analisis-tambah-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Justfikasi dari Agensi</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-10">
                            <h4>Sila masukkan maklumat justifikasi warna dari agensi</h4>
                            <div class="form-group">
                                <label for="field-1" class="control-label">Justifikasi</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Style="width: 100%; min-height: 100px" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-primary waves-light" Text="Okay" />
                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->

    <div id="sis-analisis-carian-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Carian Agensi</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Jenis Carian</label>
                                <asp:DropDownList ID="DropDownList8" CssClass="form-control" runat="server">
                                    <asp:ListItem>Nama Agensi</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="field-2" class="control-label">Keyword</label>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                            </div>
                            <button type="button" class="btn btn-default waves-effect">Cari</button>
                        </div>
                    </div>
                    <div class="row m-t-15">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Kod</th>
                                        <th>Nama</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button5" runat="server" CssClass="btn btn-primary waves-light" Text="Okay" />
                    <asp:Button ID="Button6" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
<%--                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Okay</button>
                    <button type="button" class="btn btn-info waves-effect waves-light" data-dismiss="modal">Batal</button>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
</asp:Content>
