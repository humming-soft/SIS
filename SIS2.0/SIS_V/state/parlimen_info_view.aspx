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

                <h4 class="m-t-0 header-title"><b>SENARI KAWASAN PARLIMEN</b></h4>
<%--                <a href="parlimen_info_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>--%>
                <p class="text-muted font-13 m-b-30">

                </p>
                <asp:GridView ID="GridPinfo" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" runat="server" OnPreRender="GridPinfo_PreRender" AutoGenerateColumns="False" DataKeyNames="area_id">
                    <Columns>
                        <%--<asp:BoundField DataField="area_code" HeaderText="Area Code" />--%>
                        <asp:BoundField DataField="area_name" HeaderText="Area Name" />
                        <asp:BoundField DataField="no_of_villages" HeaderText="No of Villages" />
                        <asp:BoundField DataField="area_size" HeaderText="Area Size" />
                        <asp:BoundField DataField="border_area" HeaderText="Border Area" />
                        <asp:BoundField DataField="economy_activities" HeaderText="Economy Activities" />
                        <%--<asp:BoundField DataField="race_fragment" HeaderText="Race Fragment" />--%>
                        <asp:BoundField DataField="no_of_population" HeaderText="No of Population" />
                        <asp:BoundField DataField="average_age" HeaderText="Average Age" />
                        <asp:BoundField DataField="average_gender" HeaderText="Average Gender" />
                        <asp:BoundField DataField="basic_facilities" HeaderText="Basic Facilities" />
                        <%--<asp:BoundField DataField="distribution_of_population" HeaderText="Distribution of Population" />--%>
                        <%--<asp:BoundField DataField="ethnic_composition" HeaderText="Ethnic Composition" />--%>
                        <asp:BoundField DataField="rate_poulation_growth" HeaderText="Rate Poulation Growth" />
                        <asp:BoundField DataField="Government" HeaderText="Government" />
                        <asp:BoundField DataField="Opposition" HeaderText="Opposition" />
                        <%--<asp:BoundField DataField="Operation Area" HeaderText="Operation Area" />--%>
                        <asp:TemplateField HeaderText="Actions">
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
