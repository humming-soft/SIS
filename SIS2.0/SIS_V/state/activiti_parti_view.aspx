<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_parti_view.aspx.cs" Inherits="SIS_V.state.activiti_parti_view" MasterPageFile="~/state/state_master.Master" %>

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
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-10">
                             <h4 class="m-t-0 header-title"><b>Paparan Maklumat Parti Bertanding</b></h4>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                            <a href="activiti_parti_add" class="btn btn-success pull-right"><i class="fa fa-file-text"></i> TAMBAH</a>
                        </div>
                    </div>
               <%-- <h4 class="m-t-0 header-title"><b>Paparan Maklumat Parti Bertanding</b></h4>
                <a href="activiti_parti_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                <p class="text-muted font-13 m-b-30">
                    Your description goes here(Malay / English).
                </p>--%>
                <asp:GridView ID="grid_areaInfoElectionParty" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="grid_areaInfoElectionParty_PreRender" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="election_name" HeaderText="Pilihanraya" SortExpression="election_name" />
                        <asp:BoundField DataField="area_name" HeaderText="Kawasan" SortExpression="area_name" />
                        <asp:BoundField DataField="party_name_bm" HeaderText="Parti" SortExpression="party_name_bm" />
                        <asp:BoundField DataField="date" HeaderText="Tarikh dan Masa" SortExpression="date" />
                        <asp:BoundField DataField="activity_details" HeaderText="Jenis Maklumat" SortExpression="activity_details" />
                        <asp:BoundField DataField="current_issue_name" HeaderText="Isu Semasa" SortExpression="current_issue_name" />
                        <asp:BoundField DataField="lookup_name" HeaderText="Sumber Isu" SortExpression="lookup_name" />
                        <%--                        <asp:BoundField DataField="details" HeaderText="Comments" SortExpression="details" />--%>
                        <%--<asp:TemplateField HeaderText="Comments">
                            <ItemTemplate>
                                <div class="rest-max-height-65 mCustomScrollbar" data-mcs-theme="dark-3">
                                    <%#Eval("details") %>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>
                <%--                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">                       
                    </table>--%>
            </div>
        </div>
    </div>
</asp:Content>
