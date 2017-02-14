<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_add.aspx.cs" Inherits="SIS_V.state.laporan_harian_add" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Import Laporan Harian Dari Negeri</h4>
        <p class="text-muted m-b-25 font-13">
            Description here (if any).
        </p>
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs navtab-custom nav-justified">
                    <li class="active">
                        <a href="#home1" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">1.0 AKTIVITI</span>
                            <span class="hidden-xs">1.0 AKTIVITI</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#profile1" data-toggle="tab" aria-expanded="true">
                            <span class="visible-xs">2.0 ISI-ISU</span>
                            <span class="hidden-xs">2.0 ISI-ISU</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#messages1" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">3.0 JANJI PILIHANRAYA</span>
                            <span class="hidden-xs">3.0 JANJI PILIHANRAYA</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#settings1" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">4.0 INSIDEN</span>
                            <span class="hidden-xs">4.0 INSIDEN</span>
                        </a>
                    </li>
                    <li class="">
                        <a href="#settings2" data-toggle="tab" aria-expanded="false">
                            <span class="visible-xs">5.0 ANALISIS STATUS KAWASAN</span>
                            <span class="hidden-xs">5.0 ANALISIS STATUS KAWASAN</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="home1">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="kodKawasan">Kod Kawasan</label>
                                    <asp:TextBox ID="txtKodKawasan" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="namaKawasan">Nama Kawasan</label>
                                    <asp:TextBox ID="txtNamaKawasan" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="jenisAktiviti">Jenis Aktiviti</label>
                                    <asp:TextBox ID="txtJenisAktiviti" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="butiranAktiviti">Butiran Aktiviti</label>
                                    <asp:TextBox ID="txtButiranAktiviti" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Parti</label>
                                    <asp:TextBox ID="txtParti" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tarikh</label>
                                    <asp:TextBox ID="txtTarikh" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Masa</label>
                                    <asp:TextBox ID="txtMasa" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClick="btnAdd_Click" />
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="profile1">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Kod Kawasan</label>
                                    <asp:TextBox ID="txtISUKodKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Nama Kawasan</label>
                                    <asp:TextBox ID="txtISUNamaKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Kategori Isu</label>
                                    <asp:TextBox ID="txtISUKategori" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Butiran Isu</label>
                                    <asp:TextBox ID="txtISUButiran" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Sumber Isu</label>
                                    <asp:TextBox ID="txtISUSumber" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Parti</label>
                                    <asp:TextBox ID="txtISUParti" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tarikh</label>
                                    <asp:TextBox ID="txtISUTarikh" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Masa</label>
                                    <asp:TextBox ID="txtISUMasa" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:Button ID="btnISUAdd" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" OnClick="btnISUAdd_Click" />
                            <asp:Button ID="Button4" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="messages1">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Kod Kawasan</label>
                                    <asp:TextBox ID="txtJanjiKodKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Nama Kawasan</label>
                                    <asp:TextBox ID="txtJanjiNamaKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Janji yg Diberi</label>
                                    <asp:TextBox ID="txtJanjiYG" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Nama Tokoh</label>
                                    <asp:TextBox ID="txtJanjiNamaTokoh" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tarikh</label>
                                    <asp:TextBox ID="txtJanjiTarikh" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Masa</label>
                                    <asp:TextBox ID="txtJanjiMasa" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:Button ID="btnJanjiAdd" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" OnClick="btnJanjiAdd_Click" />
                            <asp:Button ID="Button6" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                        </div>
                    </div>
                    <div class="tab-pane" id="settings1">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Kod Kawasan</label>
                                    <asp:TextBox ID="txtInsidenKodKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Nama Kawasan</label>
                                    <asp:TextBox ID="txtInsidenNamaKawasan" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Butiran Insiden</label>
                                    <asp:TextBox ID="txtInsidenButiran" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Parti</label>
                                    <asp:TextBox ID="txtInsidenParti" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tarikh</label>
                                    <asp:TextBox ID="txtInsidenTarikh" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Masa</label>
                                    <asp:TextBox ID="txtInsidenMasa" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:Button ID="btnInsidenAdd" runat="server" CssClass="btn btn-primary waves-light" Text="Button" />
                            <asp:Button ID="Button8" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Button" />
                        </div>
                    </div>
                    <div class="tab-pane" id="settings2">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Kod Kawasan</label>
                                    <asp:TextBox ID="TextBox28" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Nama Kawasan</label>
                                    <asp:TextBox ID="TextBox29" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Status</label>
                                    <asp:TextBox ID="TextBox30" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Justifikasi/Kaveat</label>
                                    <asp:TextBox ID="TextBox31" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tarikh</label>
                                    <asp:TextBox ID="TextBox32" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Data Wujud (Ya/Tidak)</label>
                                    <asp:TextBox ID="TextBox33" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <asp:Button ID="Button9" runat="server" CssClass="btn btn-primary waves-light" Text="Button" />
                            <asp:Button ID="Button10" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
