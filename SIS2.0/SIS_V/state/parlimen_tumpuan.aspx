﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parlimen_tumpuan.aspx.cs" Inherits="SIS_V.state.parlimen_tumpuan" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-md-6" style="border-right:2px solid #cfcfcf">
<%--                        <h4 class="m-t-0 m-b-20 header-title f-s-20" style="margin-left: 36px;"><b>SENARAI KAWASAN BN - </b>
                            <asp:Label ID="k_count" runat="server" Text="3"></asp:Label></h4>--%>
                       <div class="">
                         <div class="panel panel-color panel-custom-info" style="margin-bottom: 0;">
                            <div class="panel-heading panel-heading-custom">
                                <h4 class="panel-title"><b>SENARAI KAWASAN BN - </b>
                                    <asp:Label ID="k_count" runat="server" Text="3"></asp:Label></h4>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info" style="min-height: 165px;">
                                <div class="row">
                                    <div class="col-lg-4" id="sena1" runat="server">
                                        <div class="content">
                                            <asp:GridView ID="grid_senarai_one" CssClass="table table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grid_senarai_one_PreRender" DataKeyNames="area_id">
                                                <Columns>
                                                    <asp:BoundField DataField="area_code" HeaderText="Kod" SortExpression="area_code" ItemStyle-CssClass="txt-black"/>
                                                    <asp:TemplateField HeaderText="Kawasan" SortExpression="area_name">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="link_area_name_skone" runat="server" CssClass='<%# Eval("isconcentrated_opposition").Equals("True") ? "txt-red" : "txt-black" %>' OnClick="link_area_name_skone_Click"><%# Eval("area_name")%></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%" ItemStyle-BackColor="Orange">
                                                        <ItemTemplate>
                                                            <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-lg-4" id="sena2" runat="server">
                                        <div class="content">
                                            <asp:GridView ID="grid_senarai_two" CssClass="table table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grid_senarai_two_PreRender" DataKeyNames="area_id">
                                                <Columns>
                                                    <asp:BoundField DataField="area_code" HeaderText="Kod" SortExpression="area_code" ItemStyle-CssClass="txt-black"/>
                                                    <asp:TemplateField HeaderText="Kawasan" SortExpression="area_name">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="link_area_name_sktwo" runat="server" CssClass='<%# Eval("isconcentrated_opposition").Equals("True") ? "txt-red" : "txt-black" %>' OnClick="link_area_name_sktwo_Click"><%# Eval("area_name")%></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%" ItemStyle-BackColor="Orange">
                                                        <ItemTemplate>
                                                            <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-lg-4" id="sena3" runat="server">
                                        <div class="content">
                                            <div class="content">
                                                <asp:GridView ID="grid_senarai_three" CssClass="table table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grid_senarai_three_PreRender" DataKeyNames="area_id">
                                                    <Columns>
                                                        <asp:BoundField DataField="area_code" HeaderText="Kod" SortExpression="area_code" ItemStyle-CssClass="txt-black"/>
                                                        <asp:TemplateField HeaderText="Kawasan" SortExpression="area_name">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="link_area_name_skthree" runat="server" CssClass='<%# Eval("isconcentrated_opposition").Equals("True") ? "txt-red" : "txt-black" %>' OnClick="link_area_name_skthree_Click"><%# Eval("area_name")%></asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%" ItemStyle-BackColor="Orange">
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
                             </div>
                        </div>
                    </div>
                    <div class="col-md-6">
<%--                        <h4 class="m-t-0 m-b-20 header-title f-s-20" style="margin-left: 36px;"><b>SENARAI KAWASAN PEMBANGKANG - </b>
                            <asp:Label ID="pem_count" runat="server" Text="2"></asp:Label></h4>--%>
                        <div class="">
                         <div class="panel panel-color panel-custom-info" style="margin-bottom: 0;">
                            <div class="panel-heading panel-heading-custom">
                                <h4 class="panel-title"><b>SENARAI KAWASAN PEMBANGKANG - </b>
                                    <asp:Label ID="pem_count" runat="server" Text="2"></asp:Label></h4>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info" style="min-height: 165px;">
                                <div class="row">
                                    <div class="col-lg-4" id="pem1" runat="server">
                                        <div class="content">
                                            <asp:GridView ID="grid_one" CssClass="table table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grid_one_PreRender" DataKeyNames="area_id">
                                                <Columns>
                                                    <asp:BoundField DataField="area_code" HeaderText="Kod" SortExpression="area_code" ItemStyle-CssClass="txt-black"/>
                                                    <asp:TemplateField HeaderText="Kawasan" SortExpression="area_name">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="link_area_name_skpone" runat="server" CssClass='<%# Eval("isconcentrated").Equals("True") ? "txt-red" : "txt-black" %>' OnClick="link_area_name_skpone_Click1">  <%# Eval("area_name")%></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%" ItemStyle-BackColor="Orange">
                                                        <ItemTemplate>
                                                            <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-lg-4" id="pem2" runat="server">
                                        <div class="content">
                                            <asp:GridView ID="grid_two" CssClass="table table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grid_two_PreRender" DataKeyNames="area_id">
                                                <Columns>
                                                    <asp:BoundField DataField="area_code" HeaderText="Kod" SortExpression="area_code" ItemStyle-CssClass="txt-black" />
                                                    <asp:TemplateField HeaderText="Kawasan" SortExpression="area_name">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="link_area_name_skptwo" runat="server" CssClass='<%# Eval("isconcentrated").Equals("True") ? "txt-red" : "txt-black" %>' OnClick="link_area_name_skptwo_Click1"><%# Eval("area_name")%></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%" ItemStyle-BackColor="Orange">
                                                        <ItemTemplate>
                                                            <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="col-lg-4" id="pem3" runat="server">
                                        <div class="content">
                                            <asp:GridView ID="grid_three" CssClass="table table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" ClientIDMode="Static" OnPreRender="grid_three_PreRender" DataKeyNames="area_id">
                                                <Columns>
                                                    <asp:BoundField DataField="area_code" HeaderText="Kod" SortExpression="area_code" ItemStyle-CssClass="txt-black" />
                                                    <asp:TemplateField HeaderText="Kawasan" SortExpression="area_name">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="link_area_name_skpthree" runat="server" CssClass='<%# Eval("isconcentrated").Equals("True") ? "txt-red" : "txt-black" %>' OnClick="link_area_name_skpthree_Click1"><%# Eval("area_name")%></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%" ItemStyle-BackColor="Orange">
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
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
