<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result.aspx.cs" Inherits="SIS_V.state.election_result" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ddlName").customselect();
        });

        function validation_election() {
            Election_Result.init();
        }
<%--        function fill_penyandang() {
            var area_id = $('#ContentPlaceHolder1_ddlArea option:selected').val();
            var election_id = '<%= Session["election_id"] %>';
            if (area_id != '') {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"area_id":"' + area_id + '","election_id":"' + election_id + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("election_result.aspx/GetPenyandang")%>',
                    dataType: "json",
                    success: function (data) {
                        if (data.d.length > 0) {
                            $('#ContentPlaceHolder1_lblPen').text('');
                            $.each(data.d, function (key, value) {
                                $("#ContentPlaceHolder1_lblPen").text(value.winner_name);
                            });
                        } else {

                            $('#ContentPlaceHolder1_lblPen').text('');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                });
            } else {
                $('#ContentPlaceHolder1_lblPen').text('');
            }
        }--%>

        <%--function fill_candidate() {
            var area_id = $('#ContentPlaceHolder1_ddlArea option:selected').val();
            var election_id = '<%= Session["election_id"] %>';
            if (area_id != '') {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"area_id":"' + area_id + '","election_id":"' + election_id + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("election_result.aspx/GetCandidate")%>',
                    dataType: "json",
                    success: function (data) {
                        $("#ContentPlaceHolder1_CanDetails").html('');
                        if (data.d.length > 0) {
                            $("#ContentPlaceHolder1_CanDetails").append("<tr><td><b>NAMA CALON BERTANDING</b></td><td><b>PARTI</b></td><td>ACTION</td></tr>");
                            for (var i = 0; i < data.d.length; i++) {
                                $("#ContentPlaceHolder1_CanDetails").append("<tr><td>" + data.d[i].candidate_name + "</td><td>" + data.d[i].party_shortcode + "</td><td style='display:none;'>" + data.d[i].election_result_id + "</td><td style='display:none;'>" + data.d[i].candidate_id + "</td><td style='display:none;'>" + data.d[i].party_id + "</td><td style='display:none;'>" + data.d[i].coalition_id + "</td><td style='display:none;'>" + data.d[i].no_of_vote + "</td><td><div class='checker'><input type='checkbox' class='checkall'></div></td</tr>");
                            }
                        } else {
                            $("#ContentPlaceHolder1_CanDetails").html('');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                });
            } else {
                $("#ContentPlaceHolder1_CanDetails").html('');
                $("#ContentPlaceHolder1_CanDetails").append("<tr><td><b>NAMA CALON BERTANDING</b></td><td><b>PARTI</b></td></tr>");
            }
        }--%>
    </script>
    <style type="text/css">
    .hideGridColumn
    {
        display:none;
    }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH MAKLUMAT KEPUTUSAN PILIHANRAYA</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> Search Candidate (NEGERI : PERLIS)</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">PILIHANRAYA</label>
                                            <asp:TextBox ID="txtPil" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>                                            
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">NEGERI</label>
                                            <asp:TextBox ID="txtNegeri" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>                                            
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">KAWASAN</label>
                                            <asp:DropDownList ID="ddlArea" CssClass="form-control" DataTextField="area" DataValueField="area_id" OnSelectedIndexChanged="ddlArea_OnSelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
                                        </div>                                            
                                    </div>                                    
                                    <%--<div class="col-lg-3"  style="padding-top: 25px;">
                                        <div class="form-group">
                                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary waves-light" OnClick="btnSubmit_Click" OnClientClick="validation_election();" Text="Papar" />
                                        </div>
                                    </div>--%>
                                </div>
                                <div class="col-md-12">
                                    <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                                    </div>
                                    <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <asp:Label ID="lblvalid" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PENYANDANG</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <strong > PENYANDANG : </strong>
                                        <pre><asp:Label ID="lblPen" runat="server" Text=""></asp:Label></pre>                                                                            
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                  </div>
                 <div class="row">
                    <div class="col-lg-8">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT CALON BERTANDING</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                        <asp:GridView ID="CanDetails" CssClass="table table-bordered dt-responsive nowrap" runat="server" AutoGenerateSelectButton="True"
                                        OnPreRender="CanDetails_PreRender" OnRowDataBound ="OnRowDataBound" OnSelectedIndexChanged = "OnSelectedIndexChanged" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="candidate_name" HeaderText="NAMA CALON BERTANDING"></asp:BoundField>
                                                <asp:BoundField DataField="party_shortcode" HeaderText="PARTI"></asp:BoundField>
                                                <asp:BoundField DataField="election_result_id" HeaderText="Ele_Res_Id" HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn"></asp:BoundField>
                                                <asp:BoundField DataField="candidate_id" HeaderText="Cand_Id" HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn"></asp:BoundField>
                                                <asp:BoundField DataField="party_id" HeaderText="Party_Id" Visible="false"></asp:BoundField>
                                                <asp:BoundField DataField="coalition_id" HeaderText="Coalition_Id" Visible="false"></asp:BoundField>
                                                <asp:BoundField DataField="no_of_vote" HeaderText="Coalition_Id" Visible="false"></asp:BoundField>
                                            </Columns>
                                        </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-color panel-primary">
<%--                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"></h3>
                            </div>--%>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="form-group">
                                        <label>NAMA CALON</label>
                                        <asp:TextBox ID="txtCanName" runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                          <div class="form-group">
                                            <label for="userName">SELECT CANDIDATE</label>
                                            <asp:DropDownList ID="ddlName" CssClass="custom-select" ClientIDMode="Static" runat="server" DataTextField="candidate_details" DataValueField="candidate_id" OnSelectedIndexChanged = "ddlName_OnSelectedIndexChanged" AutoPostBack ="true">
                                            </asp:DropDownList>
                                        </div>                                       
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <asp:Button ID="btnPadam" class="btn btn-purple w100 m-t-25" runat="server" Text="PADAM" OnClick="btnPadam_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                <%--<div class="row">
                    <div class="col-lg-12">
                        <button class="btn btn-success pull-right">SIMPAN</button>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
