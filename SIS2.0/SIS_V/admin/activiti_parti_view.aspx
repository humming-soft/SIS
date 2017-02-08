<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_parti_view.aspx.cs" Inherits="SIS_V.admin.activiti_parti_view" MasterPageFile="~/admin/Admin_Master.Master" %>

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

                <h4 class="m-t-0 header-title"><b>Paparan Maklumat Parti Bertanding</b></h4>
                <a href="activiti_parti_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i>TAMBAH</a>
                <p class="text-muted font-13 m-b-30">
                    Your description goes here(Malay / English).
                </p>
                <asp:GridView ID="GridDataTable2" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="GridDataTable2_PreRender"></asp:GridView>
                <%--                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">                       
                    </table>--%>
            </div>
        </div>
    </div>
</asp:Content>

