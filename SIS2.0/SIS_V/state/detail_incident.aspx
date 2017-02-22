<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail_incident.aspx.cs" Inherits="SIS_V.state.detail_incident"  MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-3">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Kod Kawasan</h4>
                <%--<p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>--%>

                <div class="table-responsive">
                  <%--  <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Project Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Lorem Ipsum</td>
                            </tr>

                            <tr>
                                <td>6</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Lorem Ipsum</td>
                            </tr>

                            <tr>
                                <td>6</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Lorem Ipsum</td>
                            </tr>

                            <tr>
                                <td>6</td>
                                <td>Lorem Ipsum</td>
                            </tr>
                        </tbody>
                    </table>--%>
                    <asp:GridView ID="grid_kodkawasan" CssClass="table table-striped table-bordered dt-responsive nowrap m-t-10" runat="server" AutoGenerateColumns="False">
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
                <div>
                    <table class="table">
                        <tr>
                            <th colspan="4">Nama Kawasan :&nbsp;<asp:Label ID="lbl_area_code" runat="server" Text=""></asp:Label> <asp:Label ID="lbl_area_name" runat="server" Text=""></asp:Label></th>
                        </tr>
                        <tr>
                            <td>JUMLAH UNDI<br /> <asp:Label ID="lbl_no_voters" runat="server" Text=""></asp:Label> </td>
                            <td>MAJORITI <br /><asp:Label ID="lbl_majority" runat="server" Text=""></asp:Label></td>
                            <td>PERATUS MENGUNDI<br /><asp:Label ID="lbl_percent_vote" runat="server" Text=""></asp:Label></td>
                            <td>UNDI ROSAK<br /><asp:Label ID="lbl_spoilt_vote" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">PENIYANG DANG <br /><asp:Label ID="Label5" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="4">PECHAHUM KAUM <br /><asp:Label ID="lbl_raceFragment" runat="server" Text=""></asp:Label></td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0">Calon</h4>
                <div>
                    <img src="../assets/images/users/avatar-0.jpg" class="img-responsive img-rounded" alt="user">
                    <div class="wid-u-info">
                        <table class="table">
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">NAMA</h5>
                                    <p class="text-muted m-b-5 font-13" ><asp:Label ID="lbl_name" runat="server" Text=""></asp:Label></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">PEKERJAAN</h5>
                                    <p class="text-muted m-b-5 font-13"> <asp:Label ID="lbl_job" runat="server" Text=""></asp:Label></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">JAWATAN POLITIK</h5>
                                    <p class="text-muted m-b-5 font-13"><asp:Label ID="lbl_political_pos" runat="server" Text=""></asp:Label></p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <h5 class="m-t-0 m-b-5">PENDIDIKAN</h5>
                                    <p class="text-muted m-b-5 font-13"> <asp:Label ID="lbl_education" runat="server" Text=""></asp:Label></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0">Masalah Dalaman Parti</h4>
                <div>
                    <h6 class="m-t-0 m-b-5">MASALAH</h6>
                    <p class="text-muted m-b-5 font-13">Tiada Masalah</p>
                </div>
            </div>
            <div class="card-box widget-user">
                <h4 class="text-dark  header-title m-t-0 m-b-25">Peratusan Keluar Mengundi</h4>
                <div>
                    <div class="progress progress-lgg">
                        <div class="progress-bar  progress-bar-primary progress-bar-striped active progress-custom" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;">
                            85%
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-lg-4">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Maklumat Semasa</h4>
                <p class="text-muted m-b-25 font-13">
                    Your awesome text goes here.
                </p>

                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <th>STATUS SEMASA KAWASAN :</th>
                            <td>PUTIH</td>
                        </tr>
                        <tr>
                            <th>JUSTIFIKASI :</th>
                            <td>Nothing</td>
                        </tr>
                        <tr>
                            <th>PROJEK :</th>
                            <td>Tiada maklumat diperolehi</td>
                        </tr>
                        <tr>
                            <th>ACTIVITI :</th>
                            <td>1.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu rhoncus mauris. Donec quis leo rhoncus, fringilla mi vitae, pellentesque massa.<br>
                                <br>
                                2.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu rhoncus mauris. Donec quis leo rhoncus, fringilla mi vitae, pellentesque massa.<br>
                                <br>
                                3.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu rhoncus mauris. Donec quis leo rhoncus, fringilla mi vitae, pellentesque massa.<br>
                                <br>
                                4.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu rhoncus mauris. Donec quis leo rhoncus, fringilla mi vitae, pellentesque massa.<br>
                                <br>
                                5.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    -Ceramah Umum yang diadakan bersama Umi Hafilda.
                                    Diaggarkan seramai 5 ribu hadir.
                                    Mensasarkan golongan muda.<br>
                                <br>
                                6.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu rhoncus mauris. Donec quis leo rhoncus, fringilla mi vitae, pellentesque massa.<br>
                                <br>
                                7.Tarikh : 04/06/2012 Masa: 12:00 AM
                                    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu rhoncus mauris. Donec quis leo rhoncus, fringilla mi vitae, pellentesque massa.</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- end row -->
</asp:Content>
