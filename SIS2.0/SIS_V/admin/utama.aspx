<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="utama.aspx.cs" Inherits="SIS_V.admin.utama" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-3 col-lg-2">
            <div class="widget-simple-chart text-right card-box">
                <h4 class="text-dark  header-title m-t-0 ta-center">Status</h4>
                <p class="text-muted m-b-25 font-13 ta-center">
                    Parlimen
                </p>
                <h3 class="text-success portlet-status counter status-white">103</h3>
                <h3 class="text-warning portlet-status counter status-gray">39</h3>
                <h3 class="text-info portlet-status counter status-black">80</h3>
            </div>
        </div>
        <div class="col-sm-3 col-lg-2">
            <div class="widget-simple-chart text-right card-box">
                <h4 class="text-dark  header-title m-t-0 ta-center">Status</h4>
                <p class="text-muted m-b-25 font-13 ta-center">
                    Dun
                </p>
                <h3 class="text-success portlet-status counter status-white">103</h3>
                <h3 class="text-warning portlet-status counter status-gray">39</h3>
                <h3 class="text-info portlet-status counter status-black">80</h3>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="card-box">
                <h4 class="text-dark header-title m-t-0 m-b-30">Parlimen</h4>

                <div class="widget-chart text-center">
                    <div id="gauge"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-5">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Jumlah Insiden</h4>
                <p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="table-responsive">
                            <asp:GridView ID="grdinsident1" CssClass ="table" runat="server" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="#" HeaderText="#" />
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("Name") %>' Font-Underline="False" OnClick="LinkButton1_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Num" HeaderText="No. of Incident" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="table-responsive">
                            <asp:GridView ID="grdinsident2" CssClass="table" runat="server" GridLines="None" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="#" HeaderText="#" />
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Bind("Name") %>' Font-Underline="False"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Num" HeaderText="No. of Incidents" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->




    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Isu Utama</h4>
                <p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>District</th>
                                        <th>Issue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/05/2016</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>District</th>
                                        <th>Issue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/05/2016</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Lorem Ipsum</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Situasi Semasa - Parlimen</h4>
                <p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>
                <div id="stackedp"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Situasi Semasa - DUN</h4>
                <p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>
                <div id="stackedd"></div>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
