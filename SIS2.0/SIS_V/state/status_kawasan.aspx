<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="status_kawasan.aspx.cs" Inherits="SIS_V.state.status_kawasan" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-md-4">
                        <div class="row">
                            <div class="container">
                                <div class="col-xs-12 col-md-4 col-lg-4">
                                    <h4 class="m-t-10 m-b-20 header-title w96" style="font-size:large"><b>PARLIMEN</b></h4>
                                </div>
                                <div class="col-xs-12 col-md-8 col-lg-8 p-0">
                                    <span class="label label-default label-custom pull-right portlet-status status-black" style="font-size:medium" id="statusblack" runat="server"></span>
                                    <span class="label label-primary label-custom pull-right portlet-status status-gray"  style="font-size:medium" id="statusgray" runat="server"></span>
                                    <span class="label label-success label-custom pull-right portlet-status status-white txt-black" style="font-size:medium" id="statuswhite" runat="server"></span>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="content">
                                        <asp:GridView ID="status_kawasan_dist" CssClass="table dt-responsive nowrap m-t-10" ClientIDMode="Static" AutoGenerateColumns="false" runat="server" OnPreRender="status_kawasan_dist_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField HeaderText="Kod" DataField="area_code" ItemStyle-Width="25%" ItemStyle-CssClass="success"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Nama Kawasan" ItemStyle-CssClass="success">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="link_area_name_skone" CssClass="no-loader" runat="server" Enabled='<%# IsEnabled((bool)Eval("isconcentrated")) %>' OnClick="link_area_name_skone_Click"><%# Eval("area_name")%></asp:LinkButton>
                                                        <img src="<%# Convert.ToBoolean(Eval("isconcentrated")) ? "../assets/images/logo/subaru.ico" : "" %>"></img>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%" ItemStyle-CssClass="success">
                                                    <ItemTemplate>
                                                        <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="container">
                                <div class="col-xs-12 col-md-4 col-lg-4">
                                    <h4 class="m-t-10 m-b-20 header-title w96" style="font-size:large"><b>DUN</b></h4>
                                </div>
                                <div class="col-xs-12 col-md-8 col-lg-8 p-0">
                                    <span class="label label-default label-custom pull-right portlet-status status-black" style="font-size:medium" id="statusblack_sd" runat="server"></span>
                                    <span class="label label-primary label-custom pull-right portlet-status status-gray" style="font-size:medium" id="statusgray_sd" runat="server"></span>
                                    <span class="label label-success label-custom pull-right portlet-status status-white txt-black" style="font-size:medium" id="statuswhite_sd" runat="server"></span>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="content">
                                        <asp:GridView ID="status_kawasan_subdist" CssClass="table dt-responsive nowrap m-t-10" ClientIDMode="Static" AutoGenerateColumns="False" runat="server" OnPreRender="status_kawasan_subdist_PreRender">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Nama Kawasan" ItemStyle-CssClass="warning">
                                                    <ItemTemplate>
                                                        <div class="rest-max-height-44 mCustomScrollbar">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("names") %>'></asp:Label>
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle Height="60px"></ItemStyle>
                                                </asp:TemplateField>
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

    </div>
</asp:Content>
