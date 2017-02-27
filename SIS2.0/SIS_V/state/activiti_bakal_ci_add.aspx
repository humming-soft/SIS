<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_add.aspx.cs" Inherits="SIS_V.state.activiti_bakal_ci_add" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--    <script type="text/javascript">
        $(function () {
            $("#Button1").click(function () {
                alert('hi');
                $('#con-close-modal').modal('show');
            });
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Tambah Aktiviti Bakal Calon/Individu</b></h4>
                <p class="text-muted font-13 m-b-30">
                    Description (if needed).
                </p>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Pilihanraya</label>
                            <asp:DropDownList ID="ddlPilihanraya" CssClass="form-control" runat="server" DataTextField="election_name" DataValueField="election_id"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Negeri</label>
                            <asp:DropDownList ID="ddlNegeri" CssClass="form-control" runat="server" DataTextField="state_name" DataValueField="state_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Parlimen - DUN</label>
                            <asp:DropDownList ID="ddlParlimen" CssClass="form-control" runat="server" DataTextField="area_name" DataValueField="area_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Daerah Mengundi</label>
                            <asp:DropDownList ID="ddlDaerah" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label for="userName">Name Calon</label>
                            <%--                                    <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="name">--%>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <button class="btn btn-primary waves-effect waves-light" data-toggle="modal" data-target="#con-close-modal" type="button" style="margin-top: 24px;">
                                Cari Calon
                            </button>
                            <%--<asp:Button ID="Button1" CssClass="btn btn-primary waves-light" Style="margin-top: 24px;" runat="server" Text="Cari Calon" OnClick="Button1_Click" />--%>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Jenis Aktiviti</label>
                            <asp:DropDownList ID="ddlJenis" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Sumber Maklumat</label>
                            <asp:DropDownList ID="ddlSumber" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Tahap Kesahihan Maklumat</label>
                            <asp:DropDownList ID="ddlTahap" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Tarikh dan Masa</label>
                            <asp:TextBox ID="dtTarikh" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <%--                                    <textarea class="form-control" style="width: 100%; min-height: 300px"></textarea>--%>
                            <asp:TextBox ID="txtButiran" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group text-left m-b-0 m-t-15">
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" />
                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                </div>
            </div>
        </div>
    </div>
    <!-- modal -->
    <div id="con-close-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Carian Bakal Calon / Individu</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="form-group">
                                <label for="field-1" class="control-label">Jenis Carian</label>
                                <asp:DropDownList ID="DropDownList9" runat="server">
                                <asp:ListItem>Nama Bakal Calon/Individu</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="field-2" class="control-label">Keyword</label>
                                <asp:TextBox ID="TextBox4" CssClass="form-control" placeholder="Doe" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <asp:Button ID="Button1" CssClass="btn btn-default" style="margin-top: 24px;" runat="server" Text="Cari" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-responsive table-bordered">
                                <thead>
                                    <tr>
                                        <th>Nama</th>
                                        <th>No K.P</th>
                                        <th>Parti</th>
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
                    <asp:Button ID="Button4" runat="server" CssClass="btn btn-default" Text="Okay" />
                    <asp:Button ID="Button5" runat="server" CssClass="btn btn-info" Text="Batal" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
</asp:Content>

