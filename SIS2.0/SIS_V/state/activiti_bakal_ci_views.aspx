<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_views.aspx.cs" Inherits="SIS_V.state.activiti_bakal_ci_views" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            TableData.init();
            $("#ddlName").customselect();
        });
    </script>
    <script type="text/javascript">
        function vali_filter() {
            activiti_bakal_ci_views.init();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Paparan Aktiviti Bakal Calon / Individu</b></h4>
                <p class="text-muted font-13 m-b-30">
                </p>
                <div class="col-md-12">
                    <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="userName">Nama Calon</label>
                            <asp:DropDownList ID="ddlName" CssClass="custom-select authSelect" ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="Candidate_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Jenis Aktiviti</label>
                            <asp:DropDownList ID="ddlJenis" CssClass="form-control authSelect" runat="server" DataTextField="activity_details" DataValueField="activity_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Sumber Maklumat</label>
                            <asp:DropDownList ID="ddlSumber" CssClass="form-control authSelect" runat="server" DataTextField="lookup_name" DataValueField="lookup_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Tahap Kesahihan Maklumat</label>
                            <asp:DropDownList ID="ddlTahap" CssClass="form-control authSelect" runat="server" DataTextField="validity_type" DataValueField="validity_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary waves-light" Text="Carian" OnClick="btnSubmit_Click" OnClientClick="vali_filter()" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView ID="GridView_Cdetails" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" OnPreRender="GridView_Cdetails_PreRender">
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="Nama Calon"></asp:BoundField>
                                <asp:BoundField DataField="party_name_bm" HeaderText="Parti"></asp:BoundField>
                                <asp:BoundField DataField="election_name" HeaderText="Pilihanraya"></asp:BoundField>
                                <asp:BoundField DataField="state_name" HeaderText="Negeri"></asp:BoundField>
                                <asp:BoundField DataField="coalition_name" HeaderText="Pakatan"></asp:BoundField>
                                <asp:BoundField DataField="activity_details" HeaderText="Jenis Aktiviti"></asp:BoundField>
                                <asp:BoundField DataField="lookup_name" HeaderText="Sumber Maklumat"></asp:BoundField>
                                <asp:BoundField DataField="validity_type" HeaderText="Tahap Kesahihan"></asp:BoundField>
                                <asp:BoundField DataField="polling_district_name" HeaderText="Daerah Mengundi"></asp:BoundField>
                                <asp:BoundField DataField="date" HeaderText="Tarikh"></asp:BoundField>
                                <asp:BoundField DataField="details" HeaderText="Butiran Aktiviti"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
