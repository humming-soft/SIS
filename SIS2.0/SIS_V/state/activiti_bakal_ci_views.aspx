<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_views.aspx.cs" Inherits="SIS_V.state.activiti_bakal_ci_views" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $("#ContentPlaceHolder1_ddlName").searchable({
                maxListSize: 200, // if list size are less than maxListSize, show them all
                maxMultiMatch: 300, // how many matching entries should be displayed
                exactMatch: false, // Exact matching on search
                wildcards: true, // Support for wildcard characters (*, ?)
                ignoreCase: true, // Ignore case sensitivity
                latency: 200, // how many millis to wait until starting search
                warnMultiMatch: 'top {0} matches ...',
                warnNoMatch: 'No Matches Found...',
                zIndex: 'auto'
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Paparan Aktiviti Bakal Calon / Individu</b></h4>
                <p class="text-muted font-13 m-b-30">
                </p>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="userName">Name Calon</label>
                            <asp:DropDownList ID="ddlName" CssClass="form-control" runat="server" DataTextField="Name" DataValueField="Candidate_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Jenis Aktiviti</label>
                            <asp:DropDownList ID="ddlJenis" CssClass="form-control" runat="server" DataTextField="activity_details" DataValueField="activity_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Sumber Maklumat</label>
                            <asp:DropDownList ID="ddlSumber" CssClass="form-control" runat="server" DataTextField="lookup_name" DataValueField="lookup_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Tahap Kesahihan Maklumat</label>
                            <asp:DropDownList ID="ddlTahap" CssClass="form-control" runat="server" DataTextField="validity_type" DataValueField="validity_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary waves-light" Text="Search" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <asp:GridView ID="GridView_Cdetails" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server"></asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
