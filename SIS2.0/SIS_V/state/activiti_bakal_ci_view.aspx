<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_view.aspx.cs" Inherits="SIS_V.state.activiti_bakal_ci_view" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">
                <div class="row m-b-30">
                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                        <h4 class="m-t-0 header-title"><b>Paparan Aktiviti Bakal Calon / Individu</b></h4>
                        <p class="text-muted font-13 m-b-30">500 Rekod Terkini.</p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                        <div class="btn-group m-b-10 pull-right">
                            <a href="activiti_bakal_ci_add" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                            <a href="activiti_bakal_ci_views" class="btn btn-primary pull-right"><i class="fa fa-search"></i>CARIAN </a>
                        </div>
                    </div>
                </div>
                <asp:GridView ID="GridDataTable" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" OnPreRender="GridDataTable_PreRender">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Nama Calon"></asp:BoundField>
                        <asp:BoundField DataField="party_name_bm" HeaderText="Parti"></asp:BoundField>
                        <asp:BoundField DataField="election_name" HeaderText="Pilihanraya"></asp:BoundField>
                        <asp:BoundField DataField="state_name" HeaderText="Negeri"></asp:BoundField>
                        <asp:BoundField DataField="coalition_name" HeaderText="Pakatan"></asp:BoundField>
                        <asp:BoundField DataField="activity_details" HeaderText="Jenis Aktiviti"></asp:BoundField>
                        <asp:BoundField DataField="lookup_name" HeaderText="Sumber Maklumat"></asp:BoundField>
                        <asp:BoundField DataField="validity_type" HeaderText="Tahap Kesahihan"></asp:BoundField>
                        <asp:BoundField DataField="polling_district_name" HeaderText="Daerah Mengundi"></asp:BoundField>
                        <asp:BoundField DataField="date" HeaderText="Tarikh"></asp:BoundField>
                        <asp:BoundField DataField="details" HeaderText="Butiran Aktiviti"></asp:BoundField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
