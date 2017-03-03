<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidate_detail.aspx.cs" Inherits="SIS_V.state.candidate_detail" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            //fill_candidates();
        });
    </script>
    <script type="text/javascript">
        function fill_candidates() {
            var data = {};
            var areaid = '<%= Session["area_id"] %>';
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"areaid":"' + areaid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("candidate_detail.aspx/fill_candidates")%>',
                dataType: "json",
                success: function (data) {
                    var $container = "";
                    for (var i = 0; i < data.d.length; i++) {
                        $dist = data.d[i].par_name;
                        var $sub = '';
                        for (var j = 0; j < data.d[i].dun.length; j++) {
                            $sub += '<p class="ta-center">' + data.d[i].dun[j] + '</p>';
                        }
                        var twist = '<div class="col-lg-4"><div class="contact-box"><div class="col-sm-4"><div class="text-center"><img alt="image" class="img-circle m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg"><div class="m-t-xs font-bold">(BN - UMNO)</div></div></div><div class="col-sm-8"><h4><strong>NAME</strong></h4><p><span class="label label-success fs-13">CHOICE</span></p><address><strong>PEKERJAAN</strong><br>JOB</address><address><strong>JAWATAN</strong><br>POSITION</address><address><strong>PENDIDIKAN</strong><br>EDUCATION</address><address><strong>ULASAN</strong><br>COMMENT</address></div><div class="clearfix"></div></div></div>';
                        $container += twist;
                    }
                    $("#container").html($container);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box ta-center">
                <h4><asp:Label ID="lblelection" runat="server"></asp:Label></h4>
                <h5><asp:Label ID="lblstate" CssClass="t-t-upper" runat="server"></asp:Label></h5>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-danger alert-dismissable" id="norec" runat="server">
                <p style="text-align:center"><b>No Records Found !</b></p>
            </div>
        </div>
    </div>
    <div class="row" id="container">
        <div class="col-lg-12">
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
        </div>
        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="portlet">
                            <div class="portlet-heading bg-success">
                                <h3 class="portlet-title">
                                    <asp:Label ID="lblparlimen" CssClass="t-t-upper" runat="server" Text='<%# Eval("state_name")%>'></asp:Label>
                                </h3>
                                <div class="clearfix"></div>
                            </div>
                            <div id="bg-primary" class="panel-collapse collapse in">
                                <div class="portlet-body">
                                   <%-- <div class="contact-box">--%>
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
                                            <address>
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
      <div class="col-lg-12">
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
        </div>
        <asp:DataList ID="DataList2" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="col-lg-4">
                    <div class="portlet">
                            <div class="portlet-heading bg-warning">
                                <h3 class="portlet-title">
                                    <asp:Label ID="lbldun" runat="server" Text='<%# Eval("dun_name")%>'></asp:Label>
                                </h3>
                                <div class="clearfix"></div>
                            </div>
                            <div id="bg-primary" class="panel-collapse collapse in">
                                <div class="portlet-body">
                                    <div class="col-sm-4">
                                        <div class="text-center">
                                            <asp:Image ID="cand_image" CssClass="img-rounded m-t-xs img-responsive w-125 rest-height-160 img-c-border" ImageUrl='<%# Eval("imaged") %>' runat="server" />
                                            <div class="m-t-xs font-bold w-125"><%# Eval("party_shortcoded") %></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-8">
                                        <h4><strong><%# Eval("named") %></strong></h4>
                                        <p><span class="label label-success fs-13"><%# Eval("choice_no_named") %></span></p>
                                        <address>
                                            <strong>PEKERJAAN</strong><br>
                                            <%# Eval("occupationd") %>
                                        </address>
                                        <address>
                                            <strong>JAWATAN</strong><br>
                                            <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                                <%# Eval("political_postd") %>
                                            </div>
                                        </address>
                                        <address>
                                            <strong>PENDIDIKAN</strong><br>
                                            <%# Eval("educationd") %>
                                        </address>
                                        <address>
                                            <strong>ULASAN</strong><br>
                                            <div class="rest-height-65 mCustomScrollbar m-b-15" data-mcs-theme="dark-3">
                                                <%# Eval("commentsd") %>
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
    </div>
</asp:Content>
