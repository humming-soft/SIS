<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parlimen_info_view.aspx.cs" Inherits="SIS_V.state.parlimen_info_view" MasterPageFile="~/state/state_master.Master" %>

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

                <h4 class="m-t-0 header-title"><b>SENARAI KAWASAN PARLIMEN</b></h4>
<%--                <a href="parlimen_info_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>--%>
                <p class="text-muted font-13 m-b-30">

                </p>
                <asp:GridView ID="GridPinfo" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" runat="server" OnPreRender="GridPinfo_PreRender" AutoGenerateColumns="False" DataKeyNames="area_id">
                    <Columns>
                        <%--<asp:BoundField DataField="area_code" HeaderText="Area Code" />--%>
                        <asp:BoundField DataField="area" HeaderText="Nama Kawasan" />
                        <asp:BoundField DataField="no_of_villages" HeaderText="Bil. Kampung" />
                        <asp:BoundField DataField="area_size" HeaderText="Keluasan Kawasan" />
                        <asp:BoundField DataField="border_area" HeaderText="Sempadan Kawasan" />
                        <asp:BoundField DataField="economy_activities" HeaderText="Kegiatan Ekonomi" />
                        <%--<asp:BoundField DataField="race_fragment" HeaderText="Race Fragment" />--%>
                        <asp:BoundField DataField="no_of_population" HeaderText="Populasi Penduduk" />
                        <asp:BoundField DataField="average_age" HeaderText="Purata Umur" />
                        <asp:BoundField DataField="average_gender" HeaderText="Purata Jantina" />
                        <asp:BoundField DataField="basic_facilities" HeaderText="Kemudahan Awam" />
                        <%--<asp:BoundField DataField="distribution_of_population" HeaderText="Distribution of Population" />--%>
                        <%--<asp:BoundField DataField="ethnic_composition" HeaderText="Ethnic Composition" />--%>
                        <asp:BoundField DataField="rate_poulation_growth" HeaderText="Kadar Pertumbuhan Penduduk" />
                        <asp:BoundField DataField="Government" HeaderText="Kerajaan" />
                        <asp:BoundField DataField="Opposition" HeaderText="Pembangkang" />
                        <%--<asp:BoundField DataField="Operation Area" HeaderText="Operation Area" />--%>
                        <asp:TemplateField HeaderText="Tindakan">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-edit" Font-Underline="False" OnClick="lnkedit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
