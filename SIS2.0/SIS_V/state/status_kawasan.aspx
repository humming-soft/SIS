<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="status_kawasan.aspx.cs" Inherits="SIS_V.state.status_kawasan" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="m-t-0 m-b-20 header-title w96"><b class="m-l-40">PARLIMEN</b>
                            <span class="label label-default label-custom pull-right portlet-status status-black" id="statusblack" runat="server"></span>
                            <span class="label label-primary label-custom pull-right portlet-status status-gray" id="statusgray" runat="server"></span>
                            <span class="label label-success label-custom pull-right portlet-status status-white txt-black" id="statuswhite" runat="server"></span>
                        </h4>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="content">
                                        <asp:GridView ID="status_kawasan_dist"  CssClass="table table-striped table-bordered dt-responsive nowrap m-t-10" ClientIDMode="Static" AutoGenerateColumns="false" runat="server" OnPreRender="status_kawasan_dist_PreRender">
                                            <Columns>
                                                <asp:BoundField HeaderText="Kod Kawasan" DataField="area_code" ItemStyle-Width="15%"></asp:BoundField>
                                                <asp:BoundField HeaderText="Nama Kawasan" DataField="area_name"></asp:BoundField>
                                                  <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                         <h3 class="portlet-table-status <%# Eval("color").Equals("PUTIH") ? "status-white" : Eval("color").Equals("HITAM") ? "status-black" : "status-gray" %>"></h3>
                                                    </ItemTemplate> 
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
<%--                                        <table class="table table-bordered m-t-10">
                                            <thead>
                                                <tr>
                                                    <th style="width: 66px;">#</th>
                                                    <th>Area</th>
                                                    <th style="width: 100px;">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>P.1</td>
                                                    <td class="text-danger">PADANG BESAR</td>
                                                    <td>
                                                        <h3 class="portlet-table-status status-white">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>P.2</td>
                                                    <td class="text-danger">KANGAR</td>
                                                    <td>
                                                        <h3 class="portlet-table-status status-black">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4 class="m-t-0 m-b-20 header-title w96"><b class="m-l-40">DUN</b>
                            <span class="label label-default label-custom pull-right portlet-status status-black" id="statusblack_sd" runat="server"></span>
                            <span class="label label-primary label-custom pull-right portlet-status status-gray" id="statusgray_sd" runat="server"></span>
                            <span class="label label-success label-custom pull-right portlet-status status-white txt-black" id="statuswhite_sd" runat="server"></span>
                        </h4>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="content">
                                        <asp:GridView ID="status_kawasan_subdist"  CssClass="table table-striped table-bordered dt-responsive nowrap m-t-10" ClientIDMode="Static" AutoGenerateColumns="false" runat="server" OnPreRender="status_kawasan_subdist_PreRender">
                                            <Columns>
                                                <asp:BoundField HeaderText="Kod Kawasan" DataField="area_code" ItemStyle-Width="15%"></asp:BoundField>
                                                <asp:BoundField HeaderText="Nama Kawasan" DataField="area_name"></asp:BoundField>
                                                  <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%">
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
