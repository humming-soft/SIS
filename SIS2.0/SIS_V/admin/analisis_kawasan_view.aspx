<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analisis_kawasan_view.aspx.cs" Inherits="SIS_V.admin.analisis_kawasan_view" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            TableData.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
            <div class="row">
            <div class="col-sm-12">
                <div class="card-box table-responsive">

                    <h4 class="m-t-0 header-title"><b>Senarai Maklumat Analisis Kawasan</b></h4>
                    <a href="analisis_kawasan_add.aspx" class="btn btn-success pull-right"><i class="fa fa-file-text"></i> TAMBAH</a>
                    <p class="text-muted font-13 m-b-30">
                        Your description goes here(Malay / English).
                    </p>
                    <asp:GridView ID="GridKawasan" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="GridKawasan_PreRender"></asp:GridView>
                </div>
            </div>
        </div>
</asp:Content>
