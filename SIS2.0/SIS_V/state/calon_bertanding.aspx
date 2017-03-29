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
                                <h3 class="panel-title"><i class="md md-contacts"></i> SENARAI CALON BERTANDING UNTUK NEGERI (State Name Goes Here) MENGIKUT PARLIMEN DAN DUN</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
<%--                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card-box ta-center">
                                            <h4><asp:Label ID="lblelection" runat="server" Text="PILIHANRAYA UMUM KE-13"></asp:Label></h4>
                                            <h5><asp:Label ID="lblstate" CssClass="t-t-upper" Font-Size="30px" runat="server" Text="PERLIS"></asp:Label></h5>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="col-lg-12">
                                    <div class="panel-group panel-group-joined" id="accordion-test">
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-test" href="#collapseOne" class="collapsed no-loader">
                                                        Collapsible Group Item #1
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse">
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
                                                                <p><span class="label label-primary fs-13"> PILIHAN KEDUA</span></p>
                                                                <address>
                                                                    <strong>PEKERJAAN</strong><br>
                                                                    BEKAS PENGERUSI UDA
                                                                </address>
                                                                <address>
                                                                    <strong>JAWATAN</strong><br>
                                                                    TIMBALAN KETUA BAHAGIAN UMNO
                                                                </address>
                                                                <address>
                                                                    <strong>PENDIDIKAN</strong><br>
                                                                    SARJANA PENGURUSAN PERNIAGAAN, MARSHALL
                                                                    UNIVERSITY, USA
                                                                </address>
                                                                <address>
                                                                    <strong>ULASAN</strong><br>
                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                    DITIMBULKAN, MULA BERGITI MENDEKATI<br>
                                                                    PENGUNDI AKAR UMBI, MENANG DENGAN<br>
                                                                    MAJORITI SELESA PADA PRU - 11<br>
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
                                                                <p><span class="label label-primary fs-13"> PILIHAN KEDUA</span></p>
                                                                <address>
                                                                    <strong>PEKERJAAN</strong><br>
                                                                    BEKAS PENGERUSI UDA
                                                                </address>
                                                                <address>
                                                                    <strong>JAWATAN</strong><br>
                                                                    TIMBALAN KETUA BAHAGIAN UMNO
                                                                </address>
                                                                <address>
                                                                    <strong>PENDIDIKAN</strong><br>
                                                                    SARJANA PENGURUSAN PERNIAGAAN, MARSHALL
                                                                    UNIVERSITY, USA
                                                                </address>
                                                                <address>
                                                                    <strong>ULASAN</strong><br>
                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                    DITIMBULKAN, MULA BERGITI MENDEKATI<br>
                                                                    PENGUNDI AKAR UMBI, MENANG DENGAN<br>
                                                                    MAJORITI SELESA PADA PRU - 11<br>
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
                                                                <p><span class="label label-primary fs-13"> PILIHAN KEDUA</span></p>
                                                                <address>
                                                                    <strong>PEKERJAAN</strong><br>
                                                                    BEKAS PENGERUSI UDA
                                                                </address>
                                                                <address>
                                                                    <strong>JAWATAN</strong><br>
                                                                    TIMBALAN KETUA BAHAGIAN UMNO
                                                                </address>
                                                                <address>
                                                                    <strong>PENDIDIKAN</strong><br>
                                                                    SARJANA PENGURUSAN PERNIAGAAN, MARSHALL
                                                                    UNIVERSITY, USA
                                                                </address>
                                                                <address>
                                                                    <strong>ULASAN</strong><br>
                                                                    TIADA SEBARANG KONTROVERSI<br>
                                                                    DITIMBULKAN, MULA BERGITI MENDEKATI<br>
                                                                    PENGUNDI AKAR UMBI, MENANG DENGAN<br>
                                                                    MAJORITI SELESA PADA PRU - 11<br>
                                                                </address>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                            <div class="col-lg-12">
                                                                <div class="panel-group panel-group-joined" id="accordion-test2">
                                                                    <div class="panel panel-custom-info">
                                                                        <div class="panel-heading">
                                                                            <h4 class="panel-title">
                                                                                <a data-toggle="collapse" data-parent="#accordion-test2" href="#collapseOne1" class="no-loader">
                                                                                    Collapsible Group Item #1
                                                                                </a>
                                                                            </h4>
                                                                        </div>
                                                                        <div id="collapseOne1" class="panel-collapse collapse in">
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
                                                                                            <p><span class="label label-primary fs-13"> PILIHAN KEDUA</span></p>
                                                                                            <address>
                                                                                                <strong>PEKERJAAN</strong><br>
                                                                                                BEKAS PENGERUSI UDA
                                                                                            </address>
                                                                                            <address>
                                                                                                <strong>JAWATAN</strong><br>
                                                                                                TIMBALAN KETUA BAHAGIAN UMNO
                                                                                            </address>
                                                                                            <address>
                                                                                                <strong>PENDIDIKAN</strong><br>
                                                                                                SARJANA PENGURUSAN PERNIAGAAN, MARSHALL
                                                                                                UNIVERSITY, USA
                                                                                            </address>
                                                                                            <address>
                                                                                                <strong>ULASAN</strong><br>
                                                                                                TIADA SEBARANG KONTROVERSI<br>
                                                                                                DITIMBULKAN, MULA BERGITI MENDEKATI<br>
                                                                                                PENGUNDI AKAR UMBI, MENANG DENGAN<br>
                                                                                                MAJORITI SELESA PADA PRU - 11<br>
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
                                                                                <a data-toggle="collapse" data-parent="#accordion-test2" href="#collapseTwo1" class="no-loader">
                                                                                    Collapsible Group Item #2
                                                                                </a>
                                                                            </h4>
                                                                        </div>
                                                                        <div id="collapseTwo1" class="panel-collapse collapse in">
                                                                            <div class="panel-body">
                                                                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="panel panel-custom-info">
                                                                        <div class="panel-heading">
                                                                            <h4 class="panel-title">
                                                                                <a data-toggle="collapse" data-parent="#accordion-test2" href="#collapseThree1" class="no-loader">
                                                                                    Collapsible Group Item #3
                                                                                </a>
                                                                            </h4>
                                                                        </div>
                                                                        <div id="collapseThree1" class="panel-collapse collapse in">
                                                                            <div class="panel-body">
                                                                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
                                                    <a data-toggle="collapse" data-parent="#accordion-test" href="#collapseTwo" class="no-loader">
                                                        Collapsible Group Item #2
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse in">
                                                <div class="panel-body panel-custom-bg-success">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-success">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-test" href="#collapseThree" class="collapsed no-loader">
                                                        Collapsible Group Item #3
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree" class="panel-collapse collapse">
                                                <div class="panel-body panel-custom-bg-success">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
</asp:Content>
