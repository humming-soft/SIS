﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail_incident.aspx.cs" Inherits="SIS_V.state.detail_incident" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(window).load(function () {
            $('.progress-bar').css("width", $('#lbl_perc').text())
        });
    </script>
    <style>
        .table-bordered tr td.va-top{
            vertical-align:top !important;
        }
    </style>
    <div class="row">
        <div class="col-lg-3">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Kod Kawasan</h4>
                <div class="table-responsive mCustomScrollbar" style="height:942px;" data-mcs-theme="dark-3">
                    <asp:GridView ID="grid_kodkawasan" CssClass="table table-striped table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False" OnPreRender="grid_kodkawasan_PreRender">
                        <Columns>
                            <asp:BoundField DataField="area_code" HeaderText="#" SortExpression="area_code" />
                            <asp:BoundField DataField="area_name" HeaderText="Area Name" SortExpression="area_name" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
        <!-- end col -8 -->

        <div class="col-lg-5">
            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0">Maklumat Kawasan</h4>
                <div class="mCustomScrollbar" style="height:220px;" data-mcs-theme="dark-3">
                    <table class="table">
                        <tr>
                            <th colspan="4" style="padding-left:0px">Nama Kawasan :&nbsp;<asp:Label ID="lbl_area_code" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lbl_area_name" runat="server" Text=""></asp:Label></th>
                        </tr>
                        <tr>
                            <td>JUMLAH UNDI<br />
                                <asp:Label ID="lbl_no_voters" runat="server" Text=""></asp:Label>
                            </td>
                            <td>MAJORITI
                                <br />
                                <asp:Label ID="lbl_majority" runat="server" Text=""></asp:Label></td>
                            <td>PERATUS MENGUNDI<br />
                                <asp:Label ID="lbl_percent_vote" runat="server" Text=""></asp:Label></td>
                            <td>UNDI ROSAK<br />
                                <asp:Label ID="lbl_spoilt_vote" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">PENIYANG DANG
                                <br />
                                <asp:Label ID="lbl_winner" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">PECHAHUM KAUM
                                <br />
                                <asp:Label ID="lbl_raceFragment" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0">Calon</h4>
                 <div>
                    <asp:Image ID="img_candidate" runat="server" class="img-responsive img-rounded" alt="user" />
                    <%--<img src="../assets/images/users/avatar-0.jpg" class="img-responsive img-rounded" alt="user">--%>
                    <div class="wid-u-info mCustomScrollbar" style="height:255px;" data-mcs-theme="dark-3">
                        <table class="table">
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">NAMA</h5>
                                    <p class="text-muted m-b-5 font-13">
                                        <asp:Label ID="lbl_name" runat="server" Text=""></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">PEKERJAAN</h5>
                                    <p class="text-muted m-b-5 font-13">
                                        <asp:Label ID="lbl_job" runat="server" Text=""></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">JAWATAN POLITIK</h5>
                                    <p class="text-muted m-b-5 font-13">
                                        <asp:Label ID="lbl_political_pos" runat="server" Text=""></asp:Label>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">PENDIDIKAN</h5>
                                    <p class="text-muted m-b-5 font-13">
                                        <asp:Label ID="lbl_education" runat="server" Text=""></asp:Label>
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0">Masalah Dalaman Parti</h4>
                <div class="mCustomScrollbar" style="height:155px;" data-mcs-theme="dark-3">
                    <h6 class="m-t-0 m-b-5">MASALAH</h6>
                    <p class="text-muted m-b-5 font-13">
                        <asp:Label ID="lbl_issue" runat="server" Text=""></asp:Label>
                    </p>
                </div>
            </div>
            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0 m-b-25">Peratusan Keluar Mengundi</h4>
                <div>
                    <div class="progress progress-lgg">
                        <div class="progress-bar progress-bar-primary progress-bar-striped active progress-custom txt-black" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
                            <asp:Label ID="lbl_perc" runat="server" Text="" ClientIDMode="Static"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-4">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Maklumat Semasa</h4>
                <%--<p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>--%>

                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th style="padding-left:0px;"><span style="font-size:12px"> STATUS SEMASA KAWASAN :</span></th>
                            <td><asp:Label ID="lbl_status" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <th style="padding-left:0px;"><span style="font-size:12px"> JUSTIFIKASI :</span></th>
                            <td><asp:Label ID="lbl_justification" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <%--<tr>
                            <th>PROJEK :</th>
                            <td>Tiada maklumat diperolehi</td>
                        </tr>--%>
                        </table>
                            <%--<th>ACTIVITI :</th>--%>
                    <div class="table-responsive mCustomScrollbar" style="height:855px;" data-mcs-theme="dark-3">
                                <asp:GridView ID="grid_activity" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered dt-responsive nowrap m-t-10" OnPreRender="grid_activity_PreRender">
                                    <Columns>
                                        <asp:BoundField DataField="#" ItemStyle-CssClass="va-top f-w-600" HeaderText="#" ItemStyle-Width="5%" ItemStyle-VerticalAlign="Top"/>
                                        <asp:BoundField DataField="details" ItemStyle-CssClass="p-b-10" HeaderText="ACTIVITI :" SortExpression="details" />
                                    </Columns>
                                </asp:GridView>
                        </div>
                </div>
            </div>
        </div>

    </div>
    <!-- end row -->
</asp:Content>
