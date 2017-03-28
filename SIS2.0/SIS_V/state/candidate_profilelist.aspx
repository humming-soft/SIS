<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidate_profilelist.aspx.cs" Inherits="SIS_V.state.candidate_profilelist" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH PROFIL BAKAL CALON / INDIVIDU</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-success">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">Search Candidate</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-success">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">Nama Calon</label>
                                            <asp:DropDownList ID="ddlName" runat="server" CssClass="custom-select authSelect" DataTextField="name" DataValueField="candidate_id" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">Nombor IC</label>
                                            <asp:DropDownList ID="ddlIC" runat="server" CssClass="custom-select authSelect" DataTextField="candidate_ic" DataValueField="candidate_id" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group text-left m-b-0 m-t-25">
                                            <asp:Button ID="button1" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" />
                                            <asp:Button ID="button2" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-success">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">Candidate List</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-success">
                                <div class="col-lg-12">
                                    <asp:GridView ID="GridCInfo" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" runat="server" OnPreRender="GridCInfo_PreRender" AutoGenerateColumns="False" DataKeyNames="candidate_id">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Profil Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("image") %>' Height="100px" Width="100px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="title" HeaderText="Geleran" />
                                            <asp:BoundField DataField="candidate_ic" HeaderText="Kad Pengenalan Calon" />
                                            <asp:BoundField DataField="name" HeaderText="Nama Calon" />
                                            <asp:BoundField DataField="party_name_bm" HeaderText="Parti" />
                                            <asp:TemplateField HeaderText="Tindakan">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-edit" Font-Underline="False"></asp:LinkButton>
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
