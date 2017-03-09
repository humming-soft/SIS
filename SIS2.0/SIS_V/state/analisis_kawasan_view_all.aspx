<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="analisis_kawasan_view_all.aspx.cs" Inherits="SIS_V.state.analisis_kawasan_view_all" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(window).on('load', function () {
            var id = $('#drop_kawasan').val();
            if (id == 1) {
                $('#dr_one').show();
            }
            if (id == 2) {
                $('#dr_two').show();
            }
        });
        $(document).ready(function () {
            TableData.init();
            $('#drop_kawasan').on('change', function () {
                var id = $('#drop_kawasan').val();
                if (id == 1) {
                    $("#drop_parlimen").val("");
                    $('#drop_dun').val("");
                    $('#dr_one').show();
                    $('#dr_two').hide();
                }
                if (id == 2) {
                    $("#drop_parlimen").val("");
                    $('#drop_dun').val("");
                    $('#dr_one').hide();
                    $('#dr_two').show();
                }
            })
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Tambah Maklumat Analisis Kawasan</b></h4>
                <div>
                    <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                    </div>
                    <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <asp:Label ID="lblsuccess" runat="server"></asp:Label>
                    </div>
                    <div class="alert alert-danger alert-dismissable" id="log_valid" runat="server">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <p>Please Select from the list to filter the result!</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Kawasan</label>
                                <asp:DropDownList ID="drop_kawasan" CssClass="form-control" runat="server" ClientIDMode="Static" DataTextField="area_type_name" DataValueField="area_type" />
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_one" hidden="hidden">
                            <div class="form-group">
                                <label for="userName">Parlimen :</label>
                                <asp:DropDownList ID="drop_parlimen" CssClass="form-control" runat="server" ClientIDMode="Static" DataTextField="area_name" DataValueField="area_id"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_two" hidden="hidden">
                            <div class="form-group">
                                <label for="userName">DUN :</label>
                                <asp:DropDownList ID="drop_dun" CssClass="form-control" runat="server" ClientIDMode="Static" DataTextField="area_name" DataValueField="area_id"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group text-left m-b-0 m-t-25">
                                <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary waves-light" Text="Carian" OnClick="btn_search_Click" />
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col-sm-12">
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
                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="fa fa-trash no-loader" Font-Underline="False" OnClientClick="if (!confirm('Are you sure you want to delete?')) return false;" CommandName="Delete"></asp:LinkButton>
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
</asp:Content>

