﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_view.aspx.cs" Inherits="SIS_V.state.laporan_harian_view" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            lamporan.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">
                <h4 class="m-t-0 header-title"><b>Paparan Maklumat Parti Bertanding</b></h4>
                <a href="laporan_harian_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                <p class="text-muted font-13 m-b-30">
                    Your description goes here(Malay / English).
                </p>
                <div class="col-lg-12">
                    <div class="panel-group" id="accordion-test-2">
                        <div class="panel panel-default panel-custom">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseOne-2" aria-expanded="false" class="collapsed">1.0 AKTIVITI
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne-2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <asp:GridView ID="GridDataTable3" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDataTable3_PreRender" >                                   
                                        <Columns>
                                            <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Jenis Aktiviti" DataField="activity_type" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Butiran Aktiviti" DataField="details"></asp:BoundField>
                                            <asp:BoundField HeaderText="Parti" DataField="party_name_bm" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Masa" DataField="time" ItemStyle-Width="10%"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-custom">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseTwo-2" class="collapsed" aria-expanded="false">2.0 ISu-ISU
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo-2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <asp:GridView ID="GridDataTable4" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDataTable4_PreRender">
                                         <Columns>
                                            <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Kategori Isu" DataField="current_issue_name" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Butiran Isu" DataField="current_issue_details"></asp:BoundField>
                                            <asp:BoundField HeaderText="Sumber Isu" DataField="lookup_name" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Parti" DataField="party_name_bm" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Masa" DataField="time" ItemStyle-Width="10%"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-custom">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseThree-2" class="collapsed" aria-expanded="false">3.0 JANJI PILIHANRAYA
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree-2" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <asp:GridView ID="GridDataTable5" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDataTable5_PreRender">
                                       <Columns>
                                            <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Janji Yg Diberi" DataField="details"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nama Tokoh" DataField="details"></asp:BoundField>
                                            <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Masa" DataField="time" ItemStyle-Width="10%"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-custom">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseThree-3" class="collapsed" aria-expanded="false">4.0 INSIDEN
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree-3" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <asp:GridView ID="GridDataTable6" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDataTable6_PreRender">
                                        <Columns>
                                            <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Butiran Insiden" DataField="details"></asp:BoundField>
                                            <asp:BoundField HeaderText="Parti" DataField="party_name_bm" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Masa" DataField="time" ItemStyle-Width="10%"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default panel-custom">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseThree-5" class="collapsed" aria-expanded="false">5.0 ANALISIS STATUS KAWASAN
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree-5" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <asp:GridView ID="GridDataTable7" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDataTable7_PreRender">
                                        <Columns>
                                            <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Status" DataField="color" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Justifikasi/Kaveat" DataField="comment"></asp:BoundField>
                                            <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                            <asp:BoundField HeaderText="Data Wujud (Ya/Tidak)" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
