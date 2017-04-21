<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="result_view.aspx.cs" Inherits="SIS_V.state.result_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title" style="font-size: 25px; text-align: center; line-height: 25px;"><i class="fa fa-university"></i><b>KEPUTUSAN PILIHANRAYA  <asp:Label ID="lbl_ele_name" runat="server" Text=""></asp:Label> - <asp:Label ID="lbl_state_name" runat="server" Text="Label"></asp:Label></b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="hr-line-dashed"></div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-stars"></i>PARLIMEN</h3>
                                <h3 class="panel-title" style="float: right; margin-top: -30px">NEGERI :
                                    <asp:Label ID="lbl_state1" runat="server" Text=""></asp:Label></h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info" style="background: #e6e6e6;">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <ul class="sortable-list connectList agile-list ui-sortable">
                                            <li class="success-element-both">
                                                <asp:LinkButton ID="lnk_par_all" runat="server" CommandName="redirect" CommandArgument="-1,1"  OnClick="lnk_par_all_Click">
                                                <div class="agile-detail">
                                                    <div class="chat-user">
                                                        <div class="vertical-timeline-icon gray-bg pull-right" style="border-radius: 0px; margin-top: -16px;">
                                                            <span>
                                                                <asp:Label ID="lbl_parlimen_total" runat="server" style="padding-top: 0px;" Text=""></asp:Label></span>
                                                        </div>
                                                        <div class="file" style="width: 130px; background-color: transparent;">
                                                            <div class="file-name">
                                                                JUMLAH KERUSI
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div></asp:LinkButton>
                                            </li>
                                        </ul>
                                        <div class="alert alert-danger alert-dismissable" id="norec_2" runat="server">
                                            <p style="text-align: center"><b>Data tidak terdapat!</b></p>
                                        </div>
                                        <ul class="sortable-list connectList agile-list ui-sortable row">
                                            <asp:DataList ID="dtlst_coalition" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dtlst_coalition_ItemDataBound" DataKeyField="coalition_id">
                                                <ItemTemplate>
                                                    <li class="warning-element col-lg-3 p-0">
                                                        <asp:LinkButton ID="lnk_par" runat="server" CommandName="redirect" CommandArgument='<%# string.Concat(Eval("coalition_id"), ",","1")%>'  OnClick="lnk_par_Click">
                                                        <div class="agile-detail">
                                                            <div class="chat-user">
                                                                <asp:DataList ID="dtlst_count_par" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                                    <ItemTemplate>
                                                                        <div class="vertical-timeline-icon gray-bg pull-right">
                                                                            <span> <%# Eval("wincount_par")%></span>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <div class="file" style="width: 70px">
                                                                   <div class="image">
                                                                        <asp:Image ID="cand_image" CssClass="img-responsive" style="width: 70px; height: 40px;" ImageUrl='<%# Eval("image") %>' runat="server" />
                                                                    </div>
                                                                    <div class="file-name">
                                                                        <%# Eval("coalition_shortcode")%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:LinkButton>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-stars"></i>DUN</h3>
                                <h3 class="panel-title" style="float: right; margin-top: -30px">NEGERI :
                                    <asp:Label ID="lbl_state2" runat="server" Text=""></asp:Label></h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info" style="background: #e6e6e6;">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <ul class="sortable-list connectList agile-list ui-sortable">
                                            <li class="success-element-both">
                                                <asp:LinkButton ID="lnk_dun_all" runat="server" CommandName="redirect" CommandArgument="-1,2" OnClick="lnk_dun_all_Click">
                                                <div class="agile-detail">
                                                    <div class="chat-user">
                                                        <div class="vertical-timeline-icon gray-bg pull-right" style="border-radius: 0px; margin-top: -16px;">
                                                            <span>
                                                                <asp:Label ID="lbl_dun_total" runat="server" style="padding-top: 0px;" Text=""></asp:Label></span>
                                                        </div>
                                                        <div class="file" style="width: 130px; background-color: transparent;">
                                                            <div class="file-name">
                                                                JUMLAH KERUSI
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                    </asp:LinkButton>
                                            </li>
                                        </ul>
                                        <div class="alert alert-danger alert-dismissable" id="norec_1" runat="server">
                                            <p style="text-align: center"><b>Tiada rekod dijumpai. !</b></p>
                                        </div>
                                        <ul class="sortable-list connectList agile-list ui-sortable row">
                                            <asp:DataList ID="dtlst_dun" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dtlst_dun_ItemDataBound" >
                                                <ItemTemplate>
                                                    <li class="danger-element col-lg-3 p-0">
                                                        <asp:LinkButton ID="lnk_dun" runat="server" CommandName="redirect" CommandArgument='<%# string.Concat(Eval("coalition_id"), ",","2")%>' OnClick="lnk_dun_Click">
                                                        <div class="agile-detail">
                                                            <div class="chat-user">
                                                                <asp:DataList ID="dtlst_count_dun" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                                    <ItemTemplate>
                                                                        <div class="vertical-timeline-icon gray-bg pull-right">
                                                                            <span><%# Eval("wincount_dun")%></span>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                                <div class="file" style="width: 70px">
                                                                    <div class="image">
                                                                        <asp:Image ID="cand_image" CssClass="img-responsive" style="width: 70px; height: 40px;" ImageUrl='<%# Eval("image") %>' runat="server" />
                                                                    </div>
                                                                    <div class="file-name">
                                                                        <%# Eval("coalition_shortcode")%>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </asp:LinkButton>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </ul>
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
