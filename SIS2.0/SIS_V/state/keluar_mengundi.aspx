<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="keluar_mengundi.aspx.cs" Inherits="SIS_V.state.keluar_mengundi" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
        });
    </script>
    <script>
        function fill_area_list() {
            var area_type_id = $('#ContentPlaceHolder1_ddlKawasan option:selected').val();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"area_type_id":"' + area_type_id + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("keluar_mengundi.aspx/GetAreaList")%>',
                dataType: "json",
                success: function (data) {
                    if (data.d.length > 0) {
                        alert('here');
                        $('#ContentPlaceHolder1_ddlAreaList').empty();
                        $('#ContentPlaceHolder1_ddlAreaList').append("<option value=''>-----SELECT-----</option>");
                        $.each(data.d, function (key, value) {
                            $("#ContentPlaceHolder1_ddlAreaList").append($("<option></option>").val(value.area_id).html(value.area_name));

                        });
                    } else {
                        $('#ContentPlaceHolder1_ddlAreaList').empty();
                        $("#ContentPlaceHolder1_ddlAreaList").append($("<option></option>").attr("value", null).text("NO DATA"));
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Import Laporan Harian Dari Negeri</h4>
        <p class="text-muted m-b-25 font-13">
            Description here (if any).
        </p>
        <div class="row">
            <div class="col-lg-12">
                <div class="row" style="margin-bottom: 30px;">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Pilihanraya</label>
                            <asp:Label ID="lblPilihanraya" runat="server" CssClass="form-control"></asp:Label>
                            <%--<asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>--%>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Negeri</label>
                            <asp:Label ID="lblNageri" runat="server" CssClass="form-control"></asp:Label>
                            <%--<asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server">
                                <asp:ListItem>Sila Pilih</asp:ListItem>
                            </asp:DropDownList>--%>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Kawasan</label>
                            <asp:DropDownList ID="ddlKawasan" CssClass="form-control" runat="server"  onchange="fill_area_list()">
                                <asp:ListItem Value="">-----SELECT-----</asp:ListItem>
                                <asp:ListItem Value="1">Parliment</asp:ListItem>
                                <asp:ListItem Value="2">DUN</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="areaList">Area</label>
                            <asp:DropDownList ID="ddlAreaList" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="">
                    <asp:GridView ID="GridKM" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridKM_PreRender" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridKM_RowCancelingEdit" OnRowEditing="GridKM_RowEditing">
                        <Columns>
                            <asp:BoundField DataField="Tarikh" HeaderText="Tarikh" ReadOnly="true" />
                            <asp:BoundField DataField="Masa" HeaderText="Masa" ReadOnly="true" />
                            <asp:BoundField DataField="Negeri" HeaderText="Negeri" ReadOnly="true" />
                            <asp:BoundField DataField="Kod Kawasan" HeaderText="Kod Kawasan" ReadOnly="true" />
                            <asp:BoundField DataField="Nama Kawasan" HeaderText="Nama Kawasan" />
                            <asp:BoundField DataField="Daerah Mengundi" HeaderText="Daerah Mengundi" />
                            <asp:BoundField DataField="Parti Gabungan" HeaderText="Parti Gabungan" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:HiddenField ID="Key" runat="server" Value='<%Eval("Id")%>' />
                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-pencil" CommandName="Edit"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkdelete" runat="server" CssClass="fa fa-trash" CommandName="Delete"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkupdate" runat="server" CssClass="fa fa-refresh" CommandName="Update"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkcancel" runat="server" CssClass="fa fa-close" CommandName="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
