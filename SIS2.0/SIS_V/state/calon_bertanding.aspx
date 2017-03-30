<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="calon_bertanding.aspx.cs" Inherits="SIS_V.state.calon_bertanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>PELAPORAN ANALISA CALON BERTANDING</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-contacts"></i>SENARAI CALON BERTANDING UNTUK NEGERI (State Name Goes Here) MENGIKUT PARLIMEN DAN DUN</h3>
                            </div>
                            <%--  <div class="panel-body panel-custom-bg">--%>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card-box ta-center">
                                        <h4>
                                            <asp:Label ID="lblelection" runat="server" Text="PILIHANRAYA UMUM KE-13"></asp:Label></h4>
                                        <h5>
                                            <asp:Label ID="lblstate" CssClass="t-t-upper" Font-Size="30px" runat="server" Text="PERLIS"></asp:Label></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="panel-group panel-group-joined" id="accordion-test">
                                    <div class="panel panel-success">
                                        <%--<asp:DataList ID="datalstParlimenname" runat="server">
                                            <ItemTemplate>--%>
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion-test" href="#collapseOne" class=" no-loader">P.4 - LANGKAWI
                                                        </a>
                                                    </h4>
                                                </div>
                                           <%-- </ItemTemplate>
                                        </asp:DataList>--%>
                                        <div id="collapseOne" class="panel-collapse collapse in">
                                            <div class="panel-body panel-custom-bg-success">
                                               <%-- <asp:DataList ID="datalstParlimen" runat="server">
                                                    <ItemTemplate>--%>
                                                        <div class="col-lg-4">
                                                            <div class="contact-box">
                                                                <div class="col-sm-4">
                                                                    <div class="text-center">
                                                                        <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                        <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-8">
                                                                    <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                    <address>
                                                                        <strong>PARTY</strong><br>
                                                                        TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                    </address>
                                                                    <address>
                                                                        <strong>NO I/O</strong><br>
                                                                        12341234<br>
                                                                    </address>
                                                                    <address>
                                                                        <strong>UMUR</strong><br>
                                                                        TIADA SEBARANG KONTROVERSI<br>
                                                                    </address>
                                                                    <address>
                                                                        <strong>TARIK LAHIR</strong><br>
                                                                        TIADA SEBARANG KONTROVERSI<br>
                                                                    </address>
                                                                    <address>
                                                                        <strong>AGAMA</strong><br>
                                                                        TIADA SEBARANG KONTROVERSI<br>
                                                                    </address>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                            </div>
                                                        </div>
                                                  <%--  </ItemTemplate>
                                                </asp:DataList>--%>
                                                <div class="col-lg-4">
                                                    <div class="contact-box">
                                                        <div class="col-sm-4">
                                                            <div class="text-center">
                                                                <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                            <address>
                                                                <strong>PARTY</strong><br>
                                                                TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                            </address>
                                                            <address>
                                                                <strong>NO I/O</strong><br>
                                                                12341234<br>
                                                            </address>
                                                            <address>
                                                                <strong>UMUR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>TARIK LAHIR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>AGAMA</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="contact-box">
                                                        <div class="col-sm-4">
                                                            <div class="text-center">
                                                                <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                            <address>
                                                                <strong>PARTY</strong><br>
                                                                TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                            </address>
                                                            <address>
                                                                <strong>NO I/O</strong><br>
                                                                12341234<br>
                                                            </address>
                                                            <address>
                                                                <strong>UMUR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>TARIK LAHIR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>AGAMA</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="panel-group panel-group-joined" id="accordion-test2">
                                                        <div class="panel panel-custom-info">
                                                          <%--  <asp:DataList ID="datalstDunname" runat="server">
                                                                <ItemTemplate>--%>
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <a data-toggle="collapse" data-parent="#accordion-test2" href="#collapseOne1" class=" no-loader">N.2 - AYER HANGAT
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                              <%--  </ItemTemplate>
                                                            </asp:DataList>--%>
                                                            <div id="collapseOne1" class="panel-collapse collapse in">
                                                                <div class="panel-body">
                                                                   <%-- <asp:DataList ID="datalstDun" runat="server">
                                                                        <ItemTemplate>--%>
                                                                            <div class="col-lg-4">
                                                                                <div class="contact-box">
                                                                                    <div class="col-sm-4">
                                                                                        <div class="text-center">
                                                                                            <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                                            <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="col-sm-8">
                                                                                        <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                                        <address>
                                                                                            <strong>PARTY</strong><br>
                                                                                            TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                                        </address>
                                                                                        <address>
                                                                                            <strong>NO I/O</strong><br>
                                                                                            12341234<br>
                                                                                        </address>
                                                                                        <address>
                                                                                            <strong>UMUR</strong><br>
                                                                                            TIADA SEBARANG KONTROVERSI<br>
                                                                                        </address>
                                                                                        <address>
                                                                                            <strong>TARIK LAHIR</strong><br>
                                                                                            TIADA SEBARANG KONTROVERSI<br>
                                                                                        </address>
                                                                                        <address>
                                                                                            <strong>AGAMA</strong><br>
                                                                                            TIADA SEBARANG KONTROVERSI<br>
                                                                                        </address>
                                                                                    </div>
                                                                                    <div class="clearfix"></div>
                                                                                </div>
                                                                            </div>
                                                                       <%-- </ItemTemplate>
                                                                    </asp:DataList>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-custom-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion-test2" href="#collapseTwo1" class="collapsed no-loader">N.2 - KUAH
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseTwo1" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="col-lg-4">
                                                                        <div class="contact-box">
                                                                            <div class="col-sm-4">
                                                                                <div class="text-center">
                                                                                    <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                                    <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-8">
                                                                                <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                                <address>
                                                                                    <strong>PARTY</strong><br>
                                                                                    TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>NO I/O</strong><br>
                                                                                    12341234<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>UMUR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>TARIK LAHIR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>AGAMA</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-custom-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion-test2" href="#collapseThree1" class="collapsed no-loader">N.6 - JITRA
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseThree1" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="col-lg-4">
                                                                        <div class="contact-box">
                                                                            <div class="col-sm-4">
                                                                                <div class="text-center">
                                                                                    <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                                    <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-8">
                                                                                <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                                <address>
                                                                                    <strong>PARTY</strong><br>
                                                                                    TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>NO I/O</strong><br>
                                                                                    12341234<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>UMUR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>TARIK LAHIR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>AGAMA</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                            </div>
                                                                            <div class="clearfix"></div>
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
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordion-test" href="#collapseOne-1" class="collapsed no-loader">P.5 - JERLUN
                                                </a>
                                            </h4>
                                        </div>
                                        <div id="collapseOne-1" class="panel-collapse collapse">
                                            <div class="panel-body panel-custom-bg-success">
                                                <div class="col-lg-4">
                                                    <div class="contact-box">
                                                        <div class="col-sm-4">
                                                            <div class="text-center">
                                                                <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                            <address>
                                                                <strong>PARTY</strong><br>
                                                                TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                            </address>
                                                            <address>
                                                                <strong>NO I/O</strong><br>
                                                                12341234<br>
                                                            </address>
                                                            <address>
                                                                <strong>UMUR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>TARIK LAHIR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>AGAMA</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="contact-box">
                                                        <div class="col-sm-4">
                                                            <div class="text-center">
                                                                <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                            <address>
                                                                <strong>PARTY</strong><br>
                                                                TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                            </address>
                                                            <address>
                                                                <strong>NO I/O</strong><br>
                                                                12341234<br>
                                                            </address>
                                                            <address>
                                                                <strong>UMUR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>TARIK LAHIR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>AGAMA</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-4">
                                                    <div class="contact-box">
                                                        <div class="col-sm-4">
                                                            <div class="text-center">
                                                                <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                            <address>
                                                                <strong>PARTY</strong><br>
                                                                TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                            </address>
                                                            <address>
                                                                <strong>NO I/O</strong><br>
                                                                12341234<br>
                                                            </address>
                                                            <address>
                                                                <strong>UMUR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>TARIK LAHIR</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                            <address>
                                                                <strong>AGAMA</strong><br>
                                                                TIADA SEBARANG KONTROVERSI<br>
                                                            </address>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="panel-group panel-group-joined" id="accordion-test2-2">
                                                        <div class="panel panel-custom-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion-test2-2" href="#collapseOne1-1" class="collapsed no-loader">N.3 - KOTA SIPUTEH
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseOne1-1" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="col-lg-4">
                                                                        <div class="contact-box">
                                                                            <div class="col-sm-4">
                                                                                <div class="text-center">
                                                                                    <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                                    <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-8">
                                                                                <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                                <address>
                                                                                    <strong>PARTY</strong><br>
                                                                                    TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>NO I/O</strong><br>
                                                                                    12341234<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>UMUR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>TARIK LAHIR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>AGAMA</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-custom-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion-test2-2" href="#collapseTwo1-1" class="collapsed no-loader">N.4 - AYER HITAM
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseTwo1-1" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="col-lg-4">
                                                                        <div class="contact-box">
                                                                            <div class="col-sm-4">
                                                                                <div class="text-center">
                                                                                    <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                                    <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-8">
                                                                                <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                                <address>
                                                                                    <strong>PARTY</strong><br>
                                                                                    TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>NO I/O</strong><br>
                                                                                    12341234<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>UMUR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>TARIK LAHIR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>AGAMA</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="panel panel-custom-info">
                                                            <div class="panel-heading">
                                                                <h4 class="panel-title">
                                                                    <a data-toggle="collapse" data-parent="#accordion-test2-2" href="#collapseThree1-1" class="collapsed no-loader">N.5 - BUKIT KAYU HITAM
                                                                    </a>
                                                                </h4>
                                                            </div>
                                                            <div id="collapseThree1-1" class="panel-collapse collapse">
                                                                <div class="panel-body">
                                                                    <div class="col-lg-4">
                                                                        <div class="contact-box">
                                                                            <div class="col-sm-4">
                                                                                <div class="text-center">
                                                                                    <img alt="image" class="img-rounded m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                                                                                    <div class="m-t-xs font-bold">(BN - UMNO)</div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-8">
                                                                                <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                                                                                <address>
                                                                                    <strong>PARTY</strong><br>
                                                                                    TIMBALAN KETUA BAHAGIAN UMNO<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>NO I/O</strong><br>
                                                                                    12341234<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>UMUR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>TARIK LAHIR</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                                <address>
                                                                                    <strong>AGAMA</strong><br>
                                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                                </address>
                                                                            </div>
                                                                            <div class="clearfix"></div>
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
                            </div>
                            <%--  </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
