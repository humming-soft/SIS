<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="calon_bertanding.aspx.cs" Inherits="SIS_V.state.calon_bertanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box ta-center">
                <h4>
                    <asp:Label ID="lblelection" runat="server"></asp:Label></h4>
                <h5>
                    <asp:Label ID="lblstate" CssClass="t-t-upper" Font-Size="30px" runat="server"></asp:Label></h5>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-danger alert-dismissable" id="norec" runat="server">
                <p style="text-align: center"><b>No Records Found !</b></p>
            </div>
        </div>
    </div>
    <div class="panel-group" id="accordion-test-2">
        <div class="panel panel-default panel-custom">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-test-2" href="#collapseOne-2" aria-expanded="true" class="collapsed no-loader">P.1 LUNKAVI
                    </a>
                </h4>
            </div>
            <div id="collapseOne-2" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="col-lg-12">
                        <div class="portlet">
                            <div id="bg-primary" class="panel-collapse collapse in">
                                <div class="portlet-body">
                                    <div class="col-sm-2">
                                        <div class="text-center">
                                            <asp:Image ID="cand_image" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-160 img-c-border" ImageUrl='../assets/images/users/avatar-0.jpg' runat="server" />
                                            <div class="m-t-xs font-bold w-125">SHORT CODE</div>
                                        </div>
                                    </div>
                                    <div class="col-sm-10">
                                        <div class="col-sm-2">
                                             <strong>ANCY MATHEW</strong><br />
                                                NAMA
                                        <br />
                                        </div>
                                        <div class="col-sm-2">
                                             <address>
                                            <strong>PEKERJAAN</strong><br />
                                            MCA
                                        </address>
                                        </div>
                                        <div class="col-sm-2">
                                             <address>
                                            <strong>JAWATAN</strong><br />
                                                POST
                                        </address>
                                        </div>
                                        <div class="col-sm-2">
                                             <address style="height: 40px;">
                                            <strong>PENDIDIKAN</strong><br />
                                            PENDIDIKAN
                                        </address>
                                        </div>
                                        <div class="col-sm-2"> 
                                             <address>
                                            <strong>ULASAN</strong><br />
                                                ULASAN
                                        </address>
                                        </div>
                                         <div class="col-sm-2">  <address>
                                            <strong>ULASAN</strong><br />
                                                ULASAN
                                        </address>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="panel-group" id="accordion-test-3">
                    <div class="panel panel-default panel-custom">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion-test-3" href="#collapseOne-3" aria-expanded="true" class="collapsed no-loader">N.1 SURIAN
                                </a>
                            </h4>
                        </div>
                        <div id="collapseOne-3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <div class="col-lg-4">
                                    <div class="portlet">
                                        <div id="bg-primary_1" class="panel-collapse collapse in">
                                            <div class="portlet-body">
                                                <div class="col-sm-4">
                                                    <div class="text-center">
                                                        <asp:Image ID="Image1" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-160 img-c-border" ImageUrl='../assets/images/users/avatar-0.jpg' runat="server" />
                                                        <div class="m-t-xs font-bold w-125">SHORT CODE</div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-8">
                                                    <h4><strong>ANCY MATHEW</strong></h4>
                                                    <p><span class="label label-success fs-13">philiha betraya</span></p>
                                                    <br />
                                                    <address>
                                                        <strong>PEKERJAAN</strong><br>
                                                        MCA
                                                    </address>
                                                    <address>
                                                        <strong>JAWATAN</strong><br>
                                                        <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                                            POST
                                                        </div>
                                                    </address>
                                                    <address style="height: 40px;">
                                                        <strong>PENDIDIKAN</strong><br>
                                                        PENDIDIKAN
                                                    </address>
                                                    <address>
                                                        <strong>ULASAN</strong><br>
                                                        <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                                            ULASAN
                                                        </div>
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
    <div class="row" id="container">
        <%-- <div class="col-lg-12">
            <div class="panel bg-gray">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-12 text-center">
                                    <h3 class="m-0"><span class="fa fa-institution"></span> PARLIMEN</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

        <div class="col-lg-12">
            <div class="portlet">
                <div class="portlet-heading bg-success">
                    <h3 class="portlet-title">
                        <asp:Label ID="Label1" CssClass="t-t-upper" runat="server"></asp:Label>
                    </h3>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="portlet">
                        <div id="bg-primary" class="panel-collapse collapse in">
                            <div class="portlet-body">
                                <div class="col-sm-4">
                                    <div class="text-center">
                                        <asp:Image ID="cand_image" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-160 img-c-border" ImageUrl='<%# Eval("image") %>' runat="server" />
                                        <div class="m-t-xs font-bold w-125"><%# Eval("party_shortcode") %></div>
                                    </div>
                                </div>
                                <div class="col-sm-8">
                                    <h4><strong><%# Eval("name") %></strong></h4>
                                    <p><span class="label label-success fs-13"><%# Eval("choice_no_name") %></span></p>
                                    <address>
                                        <strong>PEKERJAAN</strong><br>
                                        <%# Eval("occupation") %>
                                    </address>
                                    <address>
                                        <strong>JAWATAN</strong><br>
                                        <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                            <%# Eval("political_post") %>
                                        </div>
                                    </address>
                                    <address style="height: 40px;">
                                        <strong>PENDIDIKAN</strong><br>
                                        <%# Eval("education") %>
                                    </address>
                                    <address>
                                        <strong>ULASAN</strong><br>
                                        <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                            <%# Eval("comments") %>
                                        </div>
                                    </address>
                                </div>
                                <div class="clearfix"></div>
                                <%-- </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div class="row">
        <%-- <div class="col-lg-12">
            <div class="panel bg-gray">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row">
                                <div class="col-xs-12 text-center">
                                    <h3 class="m-0"><span class="fa fa-institution"></span> DUN</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <asp:DataList ID="DataList2" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="DataList2_ItemDataBound">
            <ItemTemplate>
                <div class="col-lg-12">
                    <div class="portlet">
                        <div class="portlet-heading bg-warning">
                            <h3 class="portlet-title">
                                <asp:Label ID="Label1" CssClass="t-t-upper" runat="server" Text='<%# Eval("area_name")%>'></asp:Label>
                            </h3>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <asp:DataList ID="DataList3" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="col-lg-4">
                            <div class="portlet">
                                <div id="bg-primary" class="panel-collapse collapse in">
                                    <div class="portlet-body">
                                        <div class="col-sm-4">
                                            <div class="text-center">
                                                <asp:Image ID="cand_image" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-160 img-c-border" ImageUrl='<%# Eval("image") %>' runat="server" />
                                                <div class="m-t-xs font-bold w-125"><%# Eval("party_shortcode") %></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-8">
                                            <h4><strong><%# Eval("name") %></strong></h4>
                                            <p><span class="label label-success fs-13"><%# Eval("choice_no_name") %></span></p>
                                            <address>
                                                <strong>PEKERJAAN</strong><br>
                                                <%# Eval("occupation") %>
                                            </address>
                                            <address>
                                                <strong>JAWATAN</strong><br>
                                                <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                                    <%# Eval("political_post") %>
                                                </div>
                                            </address>
                                            <address style="height: 40px;">
                                                <strong>PENDIDIKAN</strong><br>
                                                <%# Eval("education") %>
                                            </address>
                                            <address>
                                                <strong>ULASAN</strong><br>
                                                <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                                    <%# Eval("comments") %>
                                                </div>
                                            </address>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </ItemTemplate>
        </asp:DataList>
    </div>

</asp:Content>
