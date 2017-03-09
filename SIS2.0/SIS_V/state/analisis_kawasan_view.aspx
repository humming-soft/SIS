<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analisis_kawasan_view.aspx.cs" Inherits="SIS_V.state.analisis_kawasan_view" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../assets/plugins/jquery-confirm/jquery-confirm.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            TableData.init();
        });
        $('.dr-confirm').confirm({
            icon: "fa fa-question-circle",
            confirmButton: "Delete",
            confirmButtonClass: "btn-info add-loader",
            cancelButton: "Cancel",
            autoClose: 'cancel|8000',
            keyboardEnabled: true,
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
            <div class="row">
            <div class="col-sm-12">
                 <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                </div>
                <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <asp:Label ID="lblsuccess" runat="server"></asp:Label>
                </div>
                <div class="card-box table-responsive">
                   <div class="row m-b-10">
                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                              <h4 class="m-t-0 header-title"><b>Senarai Maklumat Analisis Kawasan</b></h4>
                             <p class="text-muted font-13 m-b-30">500 Rekod Terkini.</p>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                            <div class="btn-group m-b-10 pull-right">
                                <a href="analisis_kawasan_view_all" class="btn btn-primary pull-right"><i class="fa fa-search"></i> CARIAN TERPERINCI</a>
                             </div>
                        </div>
                    </div>
                  <asp:GridView ID="GridKawasan" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="GridKawasan_PreRender" AutoGenerateColumns="False" DataKeyNames="record_id" OnRowDeleting="GridKawasan_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="#" ItemStyle-Width="3%">
                            <ItemTemplate>
                             <span>
                             <%#Container.DataItemIndex + 1%>
                             </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="area_type_name" HeaderText="KAWASAN" />
                        <asp:BoundField DataField="areacode" HeaderText="KODE KAWASAN" />
                        <asp:BoundField DataField="areaname" HeaderText="NAMA KAWASAN" />
                        <asp:BoundField DataField="color" HeaderText="STATUS" />
                        <asp:BoundField DataField="date" HeaderText="TARIKH" />
                        <asp:TemplateField HeaderText="MAKLUMAT" ItemStyle-Width="5%" ItemStyle-CssClass="ta-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CssClass="fa fa-edit" Font-Underline="False" OnClick="lnkEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="BUANG" ItemStyle-Width="5%" ItemStyle-CssClass="ta-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="fa fa-trash no-loader" Font-Underline="False" OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;"  CommandName="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </div>
</asp:Content>
