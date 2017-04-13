<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result.aspx.cs" Inherits="SIS_V.state.election_result" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#ddlName").customselect();
        });
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
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> CARIAN CALON (NEGERI : PERLIS)</h3>
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
                                        <pre><asp:Label ID="lblPen" runat="server" Text="" Height="10px"></asp:Label></pre>                                                                            
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
                                    <div class="col-lg-12">
                                    <div class="form-group">
                                        <label>NAMA CALON</label>
                                        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                                        <asp:TextBox ID="txtCanName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                          <div class="form-group">
                                            <label for="userName">PILIH CALON</label>
                                            <asp:DropDownList ID="ddlName" CssClass="form-control custom-select" ClientIDMode="Static" runat="server" DataTextField="candidate_details" DataValueField="candidate_id" OnSelectedIndexChanged = "ddlName_OnSelectedIndexChanged" AutoPostBack ="true">
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
