<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kawasan_operasi.aspx.cs" Inherits="SIS_V.state.kawasan_operasi" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .RedLnkBtn, .RedLnkBtn:hover {
            color: red !important;
            text-decoration: none !important;
        }

        .GreyLnkBtn {
            color: grey;
            text-decoration: none;
        }

        .hiddencol {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <div class="row">
                    <div class="col-md-6">
                        <h4 class="m-t-0 m-b-20 header-title"><b>KAWASAN TUMPUAN -</b>
                        <asp:Label ID="lblCon" runat="server" Text="Label"></asp:Label>
                        </h4>
                        <div>
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="ConGridView1" CssClass="table table-bordered dt-responsive nowrap m-t-10" AutoGenerateColumns="False" runat="server" OnPreRender="ConGridView1_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Kod"></asp:BoundField>
                                                <asp:BoundField DataField="row_color">
                                                    <ControlStyle CssClass="hiddencol"></ControlStyle>

                                                    <FooterStyle CssClass="hiddencol"></FooterStyle>

                                                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                                                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Kawasan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_arn1" runat="server" CssClass='<%# Isset((string)Eval("row_color")) %>' Text='<%# Bind("area_name") %>' Font-Underline="False" OnClick="lnk_arn1_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                        <asp:GridView ID="ConGridView2" CssClass="table table-bordered dt-responsive nowrap m-t-10" GridLines="None" AutoGenerateColumns="False" runat="server" OnPreRender="ConGridView2_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Kod"></asp:BoundField>
                                                <asp:BoundField DataField="row_color">
                                                    <ControlStyle CssClass="hiddencol"></ControlStyle>

                                                    <FooterStyle CssClass="hiddencol"></FooterStyle>

                                                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                                                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Kawasan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_arn2" runat="server" CssClass='<%# Isset((string)Eval("row_color")) %>' Text='<%# Bind("area_name") %>' Font-Underline="False" OnClick="lnk_arn2_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                        <asp:GridView ID="ConGridView3" CssClass="table table-bordered dt-responsive nowrap m-t-10" AutoGenerateColumns="False" runat="server" OnPreRender="ConGridView3_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Kod"></asp:BoundField>
                                                <asp:BoundField DataField="row_color">
                                                    <ControlStyle CssClass="hiddencol"></ControlStyle>

                                                    <FooterStyle CssClass="hiddencol"></FooterStyle>

                                                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                                                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Kawasan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_arn3" runat="server" CssClass='<%# Isset((string)Eval("row_color")) %>' Text='<%# Bind("area_name") %>' Font-Underline="False" OnClick="lnk_arn3_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                        <h4 class="m-t-0 m-b-20 header-title"><b>KAWASAN OPERASI -</b>
                        <asp:Label ID="lblOp" runat="server" Text="Label"></asp:Label>
                        </h4>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="content">
                                        <asp:GridView ID="OpGridView1" CssClass="table table-bordered dt-responsive nowrap m-t-10" AutoGenerateColumns="False" runat="server" OnPreRender="OpGridView1_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Kod"></asp:BoundField>
                                                <asp:BoundField DataField="row_color">
                                                    <ControlStyle CssClass="hiddencol"></ControlStyle>

                                                    <FooterStyle CssClass="hiddencol"></FooterStyle>

                                                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                                                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Kawasan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_arn4" runat="server" CssClass='<%# Isset((string)Eval("row_color")) %>' Text='<%# Bind("area_name") %>' Font-Underline="False" OnClick="lnk_arn4_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                        <asp:GridView ID="OpGridView2" CssClass="table table-bordered dt-responsive nowrap m-t-10" AutoGenerateColumns="False" runat="server" OnPreRender="OpGridView2_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Kod"></asp:BoundField>
                                                <asp:BoundField DataField="row_color">
                                                    <ControlStyle CssClass="hiddencol"></ControlStyle>

                                                    <FooterStyle CssClass="hiddencol"></FooterStyle>

                                                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                                                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Kawasan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_arn5" runat="server" CssClass='<%# Isset((string)Eval("row_color")) %>' Text='<%# Bind("area_name") %>' Font-Underline="False" OnClick="lnk_arn5_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                        <asp:GridView ID="OpGridView3" CssClass="table table-bordered dt-responsive nowrap m-t-10" AutoGenerateColumns="False" runat="server" OnPreRender="OpGridView3_PreRender" DataKeyNames="area_id">
                                            <Columns>
                                                <asp:BoundField DataField="area_code" HeaderText="Kod"></asp:BoundField>
                                                <asp:BoundField DataField="row_color">
                                                    <ControlStyle CssClass="hiddencol"></ControlStyle>

                                                    <FooterStyle CssClass="hiddencol"></FooterStyle>

                                                    <HeaderStyle CssClass="hiddencol"></HeaderStyle>

                                                    <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Kawasan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnk_arn6" runat="server" CssClass='<%# Isset((string)Eval("row_color")) %>' Text='<%# Bind("area_name") %>' Font-Underline="False" OnClick="lnk_arn6_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
