<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="calon_bertanding.aspx.cs" Inherits="SIS_V.state.calon_bertanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $('.panel-collapse.par').collapse('show');
        });
    </script>
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
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="card-box ta-center">
                                        <h4>
                                            <asp:Label ID="lblelection" runat="server" Text=""></asp:Label></h4>
                                        <h5>
                                            <asp:Label ID="lblstate" CssClass="t-t-upper" Font-Size="30px" runat="server" Text=""></asp:Label></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="alert alert-danger alert-dismissable" id="norec" runat="server">
                                    <p style="text-align: center"><b>No Records Found !</b></p>
                                </div>
                                <asp:DataList ID="datalstParlimenname" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="datalstParlimenname_ItemDataBound1">
                                    <ItemTemplate>
                                        <div class="panel-group panel-group-joined" id="parlimenName<%# Eval("area_id")%>">
                                            <div class="panel panel-success">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" id="parName<%# Eval("area_id")%>" data-parent="#parlimenName<%# Eval("area_id")%>" href="#parlimenNamecollapse<%# Eval("area_id")%>" class="collapsed no-loader">
                                                            <asp:Label ID="lbl_parlimen_name" runat="server" Text='<%# Eval("area_name")%>'></asp:Label>
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="parlimenNamecollapse<%# Eval("area_id")%>" class="panel-collapse collapse par">
                                                    <div class="panel-body panel-custom-bg-success">
                                                        <asp:DataList ID="datalstParlimen" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                                            <ItemTemplate>
                                                                <div class="col-lg-4">
                                                                    <div class="contact-box">
                                                                        <div class="col-sm-4">
                                                                            <div class="text-center">
                                                                                <asp:Image ID="cand_image" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-140 img-c-border" ImageUrl='<%# Eval("image") %>' runat="server" />
                                                                                <div class="m-t-xs font-bold"><%# Eval("party_shortcode")%></div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-sm-8">
                                                                            <h4><strong><%# Eval("name")%></strong></h4>
                                                                            <address>
                                                                                <strong>PARTY</strong><br>
                                                                                <%# Eval("party_shortcode")%><br>
                                                                            </address>
                                                                            <address>
                                                                                <strong>NO I/O</strong><br>
                                                                                <%# Eval("icnum")%><br>
                                                                            </address>
                                                                            <address>
                                                                                <strong>UMUR</strong><br>
                                                                                <%# Eval("age")%><br>
                                                                            </address>
                                                                            <address>
                                                                                <strong>TARIK LAHIR</strong><br>
                                                                                <%# Eval("dob")%><br>
                                                                            </address>
                                                                            <address>
                                                                                <strong>AGAMA</strong><br>
                                                                                <%# Eval("religion")%><br>
                                                                            </address>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:DataList ID="datalstDunname" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="datalstDunname_ItemDataBound">
                                                            <ItemTemplate>
                                                                <div class="col-lg-12">
                                                                    <div class="panel-group panel-group-joined" id="dun<%# Eval("area_id")%>">
                                                                        <div class="panel panel-custom-info">
                                                                            <div class="panel-heading">
                                                                                <h4 class="panel-title">
                                                                                    <a data-toggle="collapse" data-parent="#dun<%# Eval("area_id")%>" href="#dunlist<%# Eval("area_id")%>" class="collapsed no-loader">
                                                                                        <asp:Label ID="lbl_parlimen_name" runat="server" Text='<%# Eval("area_name")%>'></asp:Label>
                                                                                    </a>
                                                                                </h4>
                                                                            </div>
                                                                            <div id="dunlist<%# Eval("area_id")%>" class="panel-collapse collapse">
                                                                                <div class="panel-body">
                                                                                    <asp:DataList ID="datalstDun" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                                                        <ItemTemplate>
                                                                                            <div class="col-lg-4">
                                                                                                <div class="contact-box">
                                                                                                    <div class="col-sm-4">
                                                                                                        <div class="text-center">
                                                                                                            <asp:Image ID="cand_image" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-140 img-c-border" ImageUrl='<%# Eval("image") %>' runat="server" />
                                                                                                            <div class="m-t-xs font-bold"><%# Eval("party_shortcode")%></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="col-sm-8">
                                                                                                        <h4><strong><%# Eval("name")%></strong></h4>
                                                                                                        <address>
                                                                                                            <strong>PARTY</strong><br>
                                                                                                            <%# Eval("party_shortcode")%><br>
                                                                                                        </address>
                                                                                                        <address>
                                                                                                            <strong>NO I/O</strong><br>
                                                                                                            <%# Eval("icnum")%><br>
                                                                                                        </address>
                                                                                                        <address>
                                                                                                            <strong>UMUR</strong><br>
                                                                                                            <%# Eval("age")%><br>
                                                                                                        </address>
                                                                                                        <address>
                                                                                                            <strong>TARIK LAHIR</strong><br>
                                                                                                            <%# Eval("dob")%><br>
                                                                                                        </address>
                                                                                                        <address>
                                                                                                            <strong>AGAMA</strong><br>
                                                                                                            <%# Eval("religion")%><br>
                                                                                                        </address>
                                                                                                    </div>
                                                                                                    <div class="clearfix"></div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
