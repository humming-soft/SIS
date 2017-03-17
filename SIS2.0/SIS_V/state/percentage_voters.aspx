<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="percentage_voters.aspx.cs" Inherits="SIS_V.state.percentage_voters"  MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <asp:DataList ID="OuterDataList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="OuterDataList_ItemDataBound">
                <ItemTemplate>
                <div class="card-box">
                    <div class="row">
                        <div class="col-md-12">
                            <h4 class="m-t-0 m-b-20 header-title"><b><%#Eval("dist_name") %> <%# Eval("perc") %>%</b></h4>
                            <div class="container table-custom">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="content">
                                                <asp:DataList ID="InnerDataList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="InnerDataList_ItemDataBound">
                                                    <ItemTemplate>
                                                        <div class="card-box m-t-15">
                                                            <h4 class="text-dark  header-title m-t-0"><%#Eval("subdist_name") %> <%# Eval("perc") %>%</h4>
                                                            <div class="row">
                                                                <div class="col-sm-12 col-lg-12">
                                                                    <div style="padding: 15px 0;">
                                                                        <asp:DataList ID="MainDataList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                                            <ItemTemplate>
                                                                                <div class="col-lg-2">
                                                                                    <div class="col-lg-12">
                                                                                        <span class="round-top"><%# Eval("perc") %>%</span>
                                                                                    </div>
                                                                                    <div class="col-lg-12">
                                                                                        <span data-plugin="peity-pie" data-colors="#3bafda,#ebeff2" data-width="70" data-height="70" id="peityTest" runat="server"><%#Eval("no_of_votes") %>/<%#Eval("total_voters") %></span>
                                                                                    </div>
                                                                                    <div class="col-lg-12">
                                                                                        <span class="fs-10"><%#Eval("district_info") %></span>
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
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
