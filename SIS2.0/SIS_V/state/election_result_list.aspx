<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result_list.aspx.cs" Inherits="SIS_V.state.election_result_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>PAPARAN MAKLUMAT KEPUTUSAN PILIHANRAYA</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i>Search</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">PILIHANRAYA</label>
                                            <asp:TextBox ID="txtPil" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="userName">KAWASAN</label>
                                            <asp:TextBox ID="txtNegeri" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group m-t-25">
                                            <asp:DropDownList ID="ddlArea" CssClass="form-control" DataTextField="area" DataValueField="area_id" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" Font-Underline="false" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-search-plus"></i> Cari</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-list"></i>Details</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <asp:GridView ID="GrdDetails" CssClass="table table-bordered dt-responsive nowrap" ClientIDMode="Static" runat="server" OnPreRender="GrdDetails_PreRender" AutoGenerateColumns="False" DataKeyNames="election_id,state_id,area_id,election_result_id">
                                        <Columns>
                                            <asp:BoundField DataField="RowNumber" HeaderText="#" />
                                            <asp:BoundField DataField="election_name" HeaderText="Pilihanraya" />
                                            <asp:BoundField DataField="area_code" HeaderText="Kod Kawasan" />
                                            <asp:BoundField DataField="area_name" HeaderText="Nama Kawasan" />
                                            <asp:TemplateField HeaderText="Tindakan">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="edit" CssClass="fa fa-edit" Font-Underline="false" OnClick="edit_Click" runat="server"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
