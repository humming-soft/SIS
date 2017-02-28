<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analisis_kawasan_add.aspx.cs" Inherits="SIS_V.state.analisis_kawasan_add"  MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function justValidate(){
            justifikasi.init();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <asp:Label ID="lblinvalid" runat="server"></asp:Label>
            </div>
            <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <asp:Label ID="lblsuccess" runat="server"></asp:Label>
            </div>
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Tambah Maklumat Analisis Kawasan</b></h4>
                <p class="text-muted font-13 m-b-30">
                    Description (if needed).
                </p>
                <div>
                    <div class="row">
    <%--                    <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Negeri</label>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                    <asp:ListItem>Sila Pilih</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>--%>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Parlimen :</label>
                                <asp:Label ID="LabParlimen" runat="server" Text=""></asp:Label>
<%--                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                    <asp:ListItem>Sila Pilih</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">DUN :</label>
                                <asp:Label ID="LabDun" runat="server" Text=""></asp:Label>
<%--                                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                    <asp:ListItem>Sila Pilih</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Warna :</label>
                                <asp:Label ID="LabStatus" runat="server" Text=""></asp:Label>
<%--                                <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server">
                                    <asp:ListItem>Sila Pilih</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Tarikh :</label>
                                <asp:Label ID="LabDate" runat="server" Text=""></asp:Label>
<%--                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>--%>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="userName">Justifikasi :</label>
                                <asp:TextBox ID="TextComment" CssClass="form-control" runat="server" ClientIDMode="Static" Style="width: 100%; min-height: 200px" TextMode="MultiLine"></asp:TextBox>
                                <asp:HiddenField ID="recordId" runat="server" />
                            </div>
                        </div>
                    </div>
    <%--                <div class="row">
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
                    </div>--%>

    <%--                <div class="row m-t-15">
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
                    </div>--%>
                    <div class="form-group text-left m-b-0 m-t-15">
                        <asp:Button ID="saveJustification" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="justValidate()" OnClick="saveJustification_Click" />
                        <asp:Button ID="cancel" runat="server" CssClass="btn btn-default waves-light m-l-5 add-loader cancel" Text="Batal" OnClick="cancel_Click" />
                    </div>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>
