<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="keluar_mengundi.aspx.cs" Inherits="SIS_V.state.keluar_mengundi" MasterPageFile="~/state/state_master.Master" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            TableData.init();
            fill_area_list();
        });
    </script>
    <script type="text/javascript">
        function validation_keluar() {
            Keluar_Mengundi.init();
        }

        function fill_area_list() {
            var area_type_id = $('#ContentPlaceHolder1_ddlKawasan option:selected').val();
            var sid = '<%= Session["state"] %>';
            if (area_type_id != '') {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"area_type_id":"' + area_type_id + '","sid":"' + sid + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("keluar_mengundi.aspx/GetAreaList")%>',
                    dataType: "json",
                    success: function (data) {
                        if (data.d.length > 0) {
                            $('#ContentPlaceHolder1_ddlAreaList').empty();
                            $('#ContentPlaceHolder1_ddlAreaList').append("<option value=''>-----SELECT-----</option>");
                            $.each(data.d, function (key, value) {
                                $("#ContentPlaceHolder1_ddlAreaList").append($("<option></option>").val(value.area_id).html(value.area_name));

                            });
                            var hid_val = $('#ContentPlaceHolder1_hiddenArea').val();
                            if (hid_val) {
                                $('#ContentPlaceHolder1_ddlAreaList').val(hid_val).attr("selected", "selected");
                            }
                        } else {
                            $('#ContentPlaceHolder1_ddlAreaList').empty();
                            $("#ContentPlaceHolder1_ddlAreaList").append($("<option></option>").attr("value", null).text("NO DATA"));
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                });
            } else {
                $('#ContentPlaceHolder1_ddlAreaList').empty();
                $('#ContentPlaceHolder1_ddlAreaList').append("<option value=''>-----SELECT-----</option>");
            }
        }

        function get_area_selected() {
            var id = $('#ContentPlaceHolder1_ddlAreaList option:selected').val();
            $("#ContentPlaceHolder1_hiddenArea").val(id);
        }

        function hideGrid() {
            $("#voteGrid").hide();
        }

        function showGrid() {
            var area_type_id = $('#ContentPlaceHolder1_ddlKawasan option:selected').val();
            var area = $('#ContentPlaceHolder1_ddlAreaList option:selected').val();
            if (area_type_id != '' && area != '') {
                $("#voteGrid").show();
            } else {
                hideGrid();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-box">
        <h4 class="text-dark  header-title m-t-0">Kemaskini Maklumat Peratusan Keluar Mengundi</h4>
        <p class="text-muted m-b-25 font-13">
        </p>
        <div class="row">
            <div class="col-lg-12">
                <div class="row" style="margin-bottom: 30px;">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Pilihanraya</label>
                            <asp:Label ID="lblPilihanraya" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="userName">Negeri</label>
                            <asp:Label ID="lblNageri" runat="server" CssClass="form-control"></asp:Label>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Kawasan</label>
                            <asp:DropDownList ID="ddlKawasan" CssClass="form-control" runat="server" onchange="fill_area_list();hideGrid()">
                                <asp:ListItem Value="">-----SELECT-----</asp:ListItem>
                                <asp:ListItem Value="1">Parlimen</asp:ListItem>
                                <asp:ListItem Value="2">DUN</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="areaList">Area</label>
                            <asp:DropDownList ID="ddlAreaList" CssClass="form-control" runat="server" onChange="get_area_selected();hideGrid();">
                            </asp:DropDownList>
                            <asp:HiddenField ID="hiddenArea" runat="server" Value='' />
                        </div>
                    </div>
                    <div class="col-lg-2" style="padding-top: 25px;">
                        <div class="form-group">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary waves-light" Text="Show" OnClick="btnSubmit_Click" OnClientClick="validation_keluar();showGrid();" />
                        </div>
                    </div>
                    <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <p>We could not process your request, please check your form fields!</p>
                    </div>
                </div>
                <div id="voteGrid" class="">
                    <asp:GridView ID="GridKM" runat="server" CssClass="table table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridKM_PreRender" AutoGenerateColumns="False" DataKeyNames="polling_district_id" OnRowCancelingEdit="GridKM_RowCancelingEdit" OnRowEditing="GridKM_RowEditing" OnRowUpdating="GridKM_RowUpdating">
                        <Columns>
                            <asp:BoundField DataField="polling_district" HeaderText="NAMA DAERAH MENGUNDI" ReadOnly="true" />
                            <asp:TemplateField HeaderText="TELAH KELUAR">
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("no_of_vote") %>' ID="txtVotes"></asp:TextBox>
                                    <span style="color: red">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Value" ControlToValidate="txtVotes" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator runat="server" ID="cmpValues" ControlToValidate="txtVotes" ControlToCompare="txtJumlah" Operator="LessThanEqual" Type="Integer" ErrorMessage="Telah Keluar should be smaller than the Jumlah Pengundi and value must be a whole number " Display="Dynamic" />
                                        <asp:RegularExpressionValidator ID="negativevalidator" runat="server" ErrorMessage="Invalid Value" ControlToValidate="txtVotes" ValidationExpression="^[1-9]\d*$" Display="Dynamic"></asp:RegularExpressionValidator>
                                    </span>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%# Bind("no_of_vote") %>' ID="Label1"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="JUMLAH PENGUNDI">
                                <ItemTemplate>
                                    <asp:TextBox runat="server" Text='<%# Bind("total_voters") %>' ID="txtJumlah" ReadOnly="true" Style="border: none; display:inline-block"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="percentage" HeaderText="PERATUS" ReadOnly="true" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-pencil no-loader" CommandName="Edit"></asp:LinkButton>
                                    <%--<asp:LinkButton ID="lnkdelete" runat="server" CssClass="fa fa-trash" CommandName="Delete"></asp:LinkButton>--%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" runat="server" CssClass="fa fa-refresh no-loader" CommandName="Update"></asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancel" runat="server" CssClass="fa fa-close no-loader" CommandName="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
