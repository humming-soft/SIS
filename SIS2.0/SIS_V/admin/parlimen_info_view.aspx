<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parlimen_info_view.aspx.cs" Inherits="SIS_V.admin.parlimen_info_view" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">

                <h4 class="m-t-0 header-title"><b>SENARI KAWASAN (NAMA PARLIMEN) BAGI NEGERI PERLIS</b></h4>
                <a href="parlimen_info_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                <p class="text-muted font-13 m-b-30">
                    Your description goes here(Malay / English).
                </p>
                <asp:GridView ID="GridPinfo" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" runat="server" OnPreRender="GridPinfo_PreRender"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

