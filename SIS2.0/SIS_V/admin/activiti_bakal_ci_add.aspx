﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_add.aspx.cs" Inherits="SIS_V.admin.activiti_bakal_ci_add" MasterPageFile="~/admin/Admin_Master.Master" %>

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
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Pilihanraya</label>
                                    <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Negeri</label>
                                    <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Parlimen</label>
                                    <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">DUN</label>
                                    <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Daerah Mengundi</label>
                                    <asp:DropDownList ID="DropDownList5" CssClass="form-control" runat="server">
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
                                    <asp:Button ID="Button1" CssClass="btn btn-primary waves-light" style="margin-top: 24px;" runat="server" Text="Cari Calon" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Jenis Aktiviti</label>
                                    <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Sumber Maklumat</label>
                                    <asp:DropDownList ID="DropDownList7" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Tahap Kesahihan Maklumat</label>
                                    <asp:DropDownList ID="DropDownList8" CssClass="form-control" runat="server">
                                        <asp:ListItem>Sila Pilih</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Tarikh dan Masa</label>
                                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="form-group">
<%--                                    <textarea class="form-control" style="width: 100%; min-height: 300px"></textarea>--%>
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
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
</asp:Content>
