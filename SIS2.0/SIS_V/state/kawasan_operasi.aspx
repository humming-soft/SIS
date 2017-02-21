<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kawasan_operasi.aspx.cs" Inherits="SIS_V.state.kawasan_operasi" MasterPageFile="~/state/state_master.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="m-t-0 m-b-20 header-title"><b>KAWASAN TUMPUAN KERAJAAN</b></h4>
                        <div class="container table-custom">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="ConGridView1" CssClass="table table-bordered m-t-10 table-n" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Area Code"></asp:BoundField>
                                                <asp:BoundField DataField="area_name" HeaderText="Area Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%">
                                                    <ItemTemplate>
                                                         <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                    </ItemTemplate> 
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="ConGridView2" CssClass="table table-bordered m-t-10 table-n" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Area Code"></asp:BoundField>
                                                <asp:BoundField DataField="area_name" HeaderText="Area Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%">
                                                    <ItemTemplate>
                                                         <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                    </ItemTemplate> 
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="ConGridView3" CssClass="table table-bordered m-t-10 table-n" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Area Code"></asp:BoundField>
                                                <asp:BoundField DataField="area_name" HeaderText="Area Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%">
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
                    <div class="col-md-6">
                        <h4 class="m-t-0 m-b-20 header-title"><b>KAWASAN OPERASI KERAJAAN</b></h4>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="OpGridView1" CssClass="table table-bordered m-t-10 table-n" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Area Code"></asp:BoundField>
                                                <asp:BoundField DataField="area_name" HeaderText="Area Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%">
                                                    <ItemTemplate>
                                                         <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                    </ItemTemplate> 
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="OpGridView2" CssClass="table table-bordered m-t-10 table-n" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Area Code"></asp:BoundField>
                                                <asp:BoundField DataField="area_name" HeaderText="Area Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%">
                                                    <ItemTemplate>
                                                         <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                    </ItemTemplate> 
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="OpGridView3" CssClass="table table-bordered m-t-10 table-n" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" runat="server">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Area Code"></asp:BoundField>
                                                <asp:BoundField DataField="area_name" HeaderText="Area Name"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Status" ItemStyle-Width="13%">
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
</asp:Content>
