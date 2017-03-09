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
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Kawasan</label>
                                <asp:DropDownList ID="drop_kawasan" CssClass="form-control" runat="server" ClientIDMode="Static" DataTextField="area_type_name" DataValueField="area_type" />
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_one" hidden="hidden">
                            <div class="form-group" >
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
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClick="btn_search_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <asp:GridView ID="GridKawasan" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" OnPreRender="GridKawasan_PreRender" AutoGenerateColumns="False">
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
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

