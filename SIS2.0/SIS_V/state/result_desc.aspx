<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="result_desc.aspx.cs" Inherits="SIS_V.state.result_desc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <div class="row">
                    <h4 class="m-t-0 header-title" style="font-size: 25px; text-align: center; line-height: 25px;"><i class="fa fa-university"></i><b>KEPUTUSAN PILIHANRAYA 
                        <asp:Label ID="lbl_ele_name" runat="server" Text=""></asp:Label></b></h4>
                </div>
                <div class="col-md-12" id="noimage" runat="server">
                    <div class="col-lg-4" style="margin-left: 45%; margin-bottom: 10px; margin-top: 10px; align-content:center">
                        <asp:Image ID="cand_image1" CssClass="img-responsive" Style="width: 113px; height: 63px;" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <h4 class="m-t-0 header-title" style="font-size: 25px; text-align: center; line-height: 25px;"><b>
                        <asp:Label ID="lbl_state_name" runat="server" Text="Label"></asp:Label></b></h4>
                </div>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="hr-line-dashed"></div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-content-paste"></i> BUTIRAN SKOR</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <div class="alert alert-danger alert-dismissable" id="norec_1" runat="server">
                                        <p style="text-align: center"><b>No Records Found !</b></p>
                                    </div>
                                    <asp:DataList ID="dtlst_scoresheet" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="dtlst_scoresheet_ItemDataBound">
                                        <ItemTemplate>
                                            <div class="ibox icustom">
                                                <div class="ibox-title">
                                                    <h5><%# Eval("area_code")%> - <%# Eval("area_name")%></h5>
                                                </div>
                                                <div class="ibox-content">
                                                    <h4>MAKLUMAT PILIHANRAYA</h4>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-hover">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH PEMILIH BERDAFTAR</td>
                                                                    <td>: <%# Eval("total_vote1")%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI DITOLAK</td>
                                                                    <td>: <%# Eval("spoilt_vote1")%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI DALAM PETI UNDI</td>
                                                                    <td>: <%# Eval("accepted_vote1")%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI DIKELUARKAN</td>
                                                                    <td>: <%# Eval("turnout_vote1")%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI TIDAK DIKEMBALIKAN</td>
                                                                    <td>: <%# Eval("unreturned_vote1")%></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">PERATUS PENGUNDIAN</td>
                                                                    <td>: <%# Eval("perccetage")%></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="row  m-t-sm">
                                                        <div class="col-sm-12">
                                                            <dl class="dl-horizontal m-b-0">
                                                                <dt>PERATUSAN KAUM
                                                                </dt>
                                                                <dd>:  <%# Eval("race_one")%>
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="well" style="height: 100px; overflow: scroll">
                                                            <asp:DataList ID="dtlst_scoresheet_others" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                                <ItemTemplate>
                                                                    <address>
                                                                        <strong class="f-w-600"><%# Eval("candidate_name")%>  - ( <%# Eval("party_shortcode")%> - <%# Eval("coalition_shortcode")%> ) </strong>
                                                                        <br>
                                                                        Undi : <%# Eval("vote")%>  <%# Eval("difference_result")%>
                                                                    </address>
                                                                </ItemTemplate>
                                                            </asp:DataList>
                                                        </div>
                                                    </div>
                                                    <div class="row  m-t-sm">
                                                        <div class="col-sm-12">
                                                            <dl class="dl-horizontal m-b-0">
                                                                <dt>PENYANDANG
                                                                </dt>
                                                                <dd>: <%# Eval("incumbent_name")%> (<%# Eval("coalition_shortcode")%>) (Majoriti: <%# Eval("majority_incumbent1")%> Undi).
                                                                </dd>
                                                            </dl>
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
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-event-note"></i> DIWARTAKAN</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <div class="alert alert-danger alert-dismissable" id="norec_2" runat="server">
                                        <p style="text-align: center"><b>No Records Found !</b></p>
                                    </div>
                                    <asp:DataList ID="dtlst_gazetted" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                        <ItemTemplate>
                                            <div class="ibox icustom">
                                                <div class="ibox-title">
                                                    <%--                                        <span class="label label-primary pull-right">NEW</span>--%>
                                                    <h5><%# Eval("area_code")%> - <%# Eval("area_name")%></h5>
                                                </div>
                                                <div class="ibox-content">
                                                    <h4>MAKLUMAT PILIHANRAYA</h4>
                                                    <div class="table-responsive">
                                                        <table class="table table-striped table-hover">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH PEMILIH BERDAFTAR</td>
                                                                    <td>: 00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI DITOLAK</td>
                                                                    <td>: 00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI DALAM PETI UNDI</td>
                                                                    <td>: 00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI DIKELUARKAN</td>
                                                                    <td>: 00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">JUMLAH KERTAS UNDI TIDAK DIKEMBALIKAN</td>
                                                                    <td>: 00</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="f-w-600">PERATUS PENGUNDIAN</td>
                                                                    <td>: 00</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="row  m-t-sm">
                                                        <div class="col-sm-12">
                                                            <dl class="dl-horizontal m-b-0">
                                                                <dt>PERATUSAN KAUM
                                                                </dt>
                                                                <dd>:  Cina: 00%, Bumiputera Bukan Islam: 00%,
                                                                </dd>
                                                            </dl>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="well" style="height: 100px">
                                                        </div>
                                                    </div>
                                                    <div class="row  m-t-sm">
                                                        <div class="col-sm-12">
                                                            <dl class="dl-horizontal m-b-0">
                                                                <dt>PENYANDANG
                                                                </dt>
                                                                <dd>: () (Majoriti: 0 Undi).
                                                                </dd>
                                                            </dl>
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
    </div>
</asp:Content>
