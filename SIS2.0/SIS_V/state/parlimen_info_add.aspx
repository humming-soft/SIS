<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parlimen_info_add.aspx.cs" Inherits="SIS_V.state.parlimen_info_add" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Kod Kawasan</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Nama Kawasan</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Bil. Kampung</label>
                                <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="checkbox checkbox-pink">
                                <asp:CheckBox ID="CheckBox4" runat="server" />
                                <label for="checkbox1">Kawasan Tumpuan </label>
                            </div>
                            <div class="checkbox checkbox-pink">
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                <label for="checkbox2">Kawasan Tumpuan Penbangkang </label>
                            </div>
                            <div class="checkbox checkbox-pink">
                                <asp:CheckBox ID="CheckBox2" runat="server" />
                                <label for="checkbox3">Kawasan Operasi </label>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Keluasan Kawasan</label>
                                <asp:ListBox ID="ListBox1" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Sempadan Kawasan</label>
                                <asp:ListBox ID="ListBox2" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Kegiatan Ekonomi</label>
                                <asp:ListBox ID="ListBox3" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Pecahan Kaum</label>
                                <asp:ListBox ID="ListBox4" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">populasi Penduduk</label>
                                <asp:ListBox ID="ListBox5" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Purata Umur</label>
                                <asp:ListBox ID="ListBox6" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Purata Jantina</label>
                                <asp:ListBox ID="ListBox7" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Kemudahan Awam</label>
                                <asp:ListBox ID="ListBox8" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Taburan Penduduk</label>
                                <asp:ListBox ID="ListBox9" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Komposisi Etnik</label>
                                <asp:ListBox ID="ListBox10" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Kedar Pertumbuhan Penduduk</label>
                                <asp:ListBox ID="ListBox11" CssClass="form-control" runat="server" SelectionMode="Multiple"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-left m-b-0 m-t-15">
                        <asp:Button ID="Button1" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" />
                        <asp:Button ID="Button2" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                    </div>
            </div>
        </div>
    </div>
</asp:Content>