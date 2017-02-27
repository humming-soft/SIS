<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analisis_kawasan_view.aspx.cs" Inherits="SIS_V.state.analisis_kawasan_view" MasterPageFile="~/state/state_master.Master" %>

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
                    <a href="analisis_kawasan_add" class="btn btn-success pull-right"><i class="fa fa-file-text"></i> TAMBAH</a>
                    <p class="text-muted font-13 m-b-30">
                        Your description goes here(Malay / English).
                    </p>
                  <asp:GridView ID="GridKawasan" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="GridKawasan_PreRender" AutoGenerateColumns="False" DataKeyNames="record_id">
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
                        <asp:BoundField DataField="poll" HeaderText="DEARAH MENGUNDI" />
                        <asp:BoundField DataField="locality" HeaderText="LOKALITI" />
                        <asp:BoundField DataField="color" HeaderText="STATUS" />
                        <asp:BoundField DataField="date" HeaderText="TARIKH" />
                        <asp:TemplateField HeaderText="MAKLUMAT" ItemStyle-Width="5%" ItemStyle-CssClass="ta-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CssClass="fa fa-edit" Font-Underline="False" OnClick="lnkEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="BUANG" ItemStyle-Width="5%" ItemStyle-CssClass="ta-center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="fa fa-trash" Font-Underline="False" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                </div>
            </div>
        </div>
</asp:Content>
