<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_add.aspx.cs" Inherits="SIS_V.admin.laporan_harian_add" MasterPageFile="~/admin/Admin_Master.Master" %>

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
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Jenis Aktiviti</label>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Aktiviti</label>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" />
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                            </div>
                    </div>
                    <div class="tab-pane" id="profile1">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <asp:TextBox ID="TextBox9" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kategori Isu</label>
                                        <asp:TextBox ID="TextBox10" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Isu</label>
                                        <asp:TextBox ID="TextBox11" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Sumber Isu</label>
                                        <asp:TextBox ID="TextBox12" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:TextBox ID="TextBox13" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="TextBox14" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <asp:TextBox ID="TextBox15" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="Button3" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" />
                                <asp:Button ID="Button4" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                            </div>
                    </div>
                    <div class="tab-pane" id="messages1">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:TextBox ID="TextBox16" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <asp:TextBox ID="TextBox21" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Janji yg Diberi</label>
                                        <asp:TextBox ID="TextBox17" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Tokoh</label>
                                        <asp:TextBox ID="TextBox18" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="TextBox19" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <asp:TextBox ID="TextBox20" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="Button5" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" />
                                <asp:Button ID="Button6" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                            </div>
                    </div>
                    <div class="tab-pane" id="settings1">
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Kod Kawasan</label>
                                        <asp:TextBox ID="TextBox22" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Nama Kawasan</label>
                                        <asp:TextBox ID="TextBox23" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Butiran Insiden</label>
                                        <asp:TextBox ID="TextBox24" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Parti</label>
                                        <asp:TextBox ID="TextBox25" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Tarikh</label>
                                        <asp:TextBox ID="TextBox26" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="form-group">
                                        <label for="userName">Masa</label>
                                        <asp:TextBox ID="TextBox27" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="Button7" runat="server" CssClass="btn btn-primary waves-light" Text="Button" />
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
