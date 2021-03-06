﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parlimen_info_add.aspx.cs" Inherits="SIS_V.state.parlimen_info_add" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation_parliment() {
            Parliment_Info.init();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>MAKLUMAT TERPERINCI KAWASAN PARLIMEN</b></h4>
                <p class="text-muted font-13 m-b-30">

                </p>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Kod Kawasan</label>
                                <asp:TextBox ID="txtKodKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Nama Kawasan</label>
                                <asp:TextBox ID="txtNamaKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Bil. Kampung</label>
                                <asp:TextBox ID="txtBil" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="checkbox checkbox-pink">
                                <asp:CheckBox ID="chkKawasanTumpuan" runat="server" />
                                <label for="checkbox1">Kawasan Tumpuan </label>
                            </div>
                            <div class="checkbox checkbox-pink">
                                <asp:CheckBox ID="chkKawasanTumpuanPenbangkang" runat="server" />
                                <label for="checkbox2">Kawasan Tumpuan Pembangkang </label>
                            </div>
                            <div class="checkbox checkbox-pink">
                                <asp:CheckBox ID="chkKawasanOperasi" runat="server" />
                                <label for="checkbox3">Kawasan Operasi </label>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Keluasan Kawasan</label>
                                <asp:TextBox ID="txtKeluasanKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Sempadan Kawasan</label>
                                <asp:TextBox ID="txtSempadanKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Kegiatan Ekonomi</label>
                                <asp:TextBox ID="txtKegiatanEkonomi" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Pecahan Kaum</label>
                                <asp:TextBox ID="txtPecahanKaum" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Populasi Penduduk</label>
                                <asp:TextBox ID="txtPopulasiPenduduk" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Purata Umur</label>
                                <asp:TextBox ID="txtPurataUmur" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Purata Jantina</label>
                                <asp:TextBox ID="txtPurataJantina" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Kemudahan Awam</label>
                                <asp:TextBox ID="txtKemudahanAwam" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Taburan Penduduk</label>
                                <asp:TextBox ID="txtTaburanPenduduk" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Komposisi Etnik</label>
                                <asp:TextBox ID="txtKomposisiEtnik" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Kadar Pertumbuhan Penduduk</label>
                                <asp:TextBox ID="txtKedarPertumbuhanPenduduk" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-left m-b-0 m-t-15">
                        <asp:Button ID="btnUpdate" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan"  OnClientClick="validation_parliment()" OnClick="btnUpdate_Click" />
                        <asp:Button ID="btnClear" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" OnClick="btnClear_Click"/>
                    </div>
                    <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <p>We could not process your request, please check your form fields!</p>
                    </div> 

            </div>
        </div>
    </div> 
</asp:Content>