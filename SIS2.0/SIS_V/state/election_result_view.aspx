﻿<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result_view.aspx.cs" Inherits="SIS_V.state.election_result_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hideGridColumn {
            display: none;
        }
    </style>
    <script type="text/javascript">
        var rowid;
        var rowvalue;
        var totp = 0;
        var fvals = "";
        var gper = 0;
        var gperu = 0;
        function add_to_table() {
            if ($('#ddlraces').val() != "" && $('#txtperc').val() != "") {
                gper = parseInt($('#txttperc').val()) + parseInt($('#txtperc').val());
                if (gper <= 100) { // check the total percentage if greater than 100 don't add
                    var checker = []; // create an array
                    var rowCount = $('#tb tr').length; // get the row count
                    if (rowCount == 0) { // if row count is zero just append
                        $('#tb').append('<tr id=' + $('#ddlraces').val() + ' class=' + $('#txtperc').val() + ' text=' + $('#ddlraces option:selected').text() + '><td>' + $('#ddlraces option:selected').text() + '</td>' + '<td>' + $('#txtperc').val() + '</td></tr>');
                        $('#txttperc').val($('#txtperc').val());
                        $('#ddlraces').val("");
                        $('#txtperc').val('');

                    }
                    else { // if row count is not zero loop through the current table and push the values into array
                        $("#tb tr").each(function () {
                            checker.push($(this).attr("id"));
                        });

                        // check the new selected value in the array
                        var finder = checker.includes($('#ddlraces').val());
                        if (finder == true) // if finder is true the value is already added for that race, false means not added
                        {
                            alert('Nilai sudah ditambah !');
                        }
                        else {
                            totp = 0;
                            $('#tb').append('<tr id=' + $('#ddlraces').val() + ' class=' + $('#txtperc').val() + ' text=' + $('#ddlraces option:selected').text() + '><td>' + $('#ddlraces option:selected').text() + '</td>' + '<td>' + $('#txtperc').val() + '</td></tr>');
                            $("#tb tr").each(function () {
                                totp += parseInt($(this).attr("class"));
                            });
                            $('#ddlraces').val("");
                            $('#txtperc').val('');
                            $('#txttperc').val(totp);
                        }

                    }
                }
                else {
                    $('#ddlraces').val("");
                    $('#txtperc').val('');
                    alert('Jumlah peratus tidak boleh melebihi daripada 100 !')
                }
            }
            else {
                alert('Pilih bangsa dan masukkan nilai peratus!')
            }
        }

        function del_frm_table() {
            $('#' + rowid).remove();
            $('#lnkkamaskini').prop('disabled', true);
            $('#lnkdelete').prop('disabled', true);
            $('#lnktambah').prop('disabled', false);
            $('#ddlraces').val("");
            $('#txtperc').val('');
            totp = 0;
            $("#tb tr").each(function () {
                totp += parseInt($(this).attr("class"));
            });
            $('#txttperc').val(totp);
            var rcount = $('#tb tr').length;
            if (rcount == 0) {
                $('#lnktambah').prop('disabled', false);
                $('#lnkkamaskini').prop('disabled', true);
                $('#lnkdelete').prop('disabled', true);
                $('#ddlraces').val("");
                $('#txtperc').val('');
            }
        }

        function up_table() {
            if ($('#ddlraces').val() != "" && $('#txtperc').val() != "") {
                // check for value less than 100 if yes first remove the row then add new row with the updated values, also can select new race at the same time
                gperu = parseInt($('#txttperc').val()) - parseInt(rowvalue) + parseInt($('#txtperc').val());
                if (gperu <= 100) {
                    $('#txttperc').val(gperu).change();
                    $('#' + rowid).remove();
                    $('#lnkkamaskini').prop('disabled', true);
                    $('#lnkdelete').prop('disabled', true);

                    //add_to_table();

                    var checker1 = []; // create an array
                    var rowCount1 = $('#tb tr').length; // get the row count
                    if (rowCount1 == 0) { // if row count is zero just append
                        $('#tb').append('<tr id=' + $('#ddlraces').val() + ' class=' + $('#txtperc').val() + ' text=' + $('#ddlraces option:selected').text() + '><td>' + $('#ddlraces option:selected').text() + '</td>' + '<td>' + $('#txtperc').val() + '</td></tr>');
                        $('#txttperc').val($('#txtperc').val());
                        $('#ddlraces').val("");
                        $('#txtperc').val('');

                    }
                    else { // if row count is not zero loop through the current table and push the values into array
                        $("#tb tr").each(function () {
                            checker1.push($(this).attr("id"));
                        });

                        // check the new selected value in the array
                        var finder1 = checker1.includes($('#ddlraces').val());
                        if (finder1 == true) // if finder is true the value is already added for that race, false means not added
                        {
                            alert('Nilai sudah ditambah !');
                        }
                        else {
                            totp = 0;
                            $('#tb').append('<tr id=' + $('#ddlraces').val() + ' class=' + $('#txtperc').val() + ' text=' + $('#ddlraces option:selected').text() + '><td>' + $('#ddlraces option:selected').text() + '</td>' + '<td>' + $('#txtperc').val() + '</td></tr>');
                            $("#tb tr").each(function () {
                                totp += parseInt($(this).attr("class"));
                            });
                            $('#ddlraces').val("");
                            $('#txtperc').val('');
                            $('#txttperc').val(totp);
                        }

                    }

                    $('#lnktambah').prop('disabled', false);
                    $('#lnkkamaskini').prop('disabled', true);
                    $('#lnkdelete').prop('disabled', true);
                }
                else {
                    $('#ddlraces').val("");
                    $('#txtperc').val('');
                    alert('Jumlah peratus tidak boleh melebihi daripada 100 !');
                }
            }
            else {
                alert('Pilih bangsa dan masukkan nilai peratus!')
            }

        }

        function get_values() {
            fvals = "";
            $("#tb tr").each(function () {
                fvals += $(this).find("td:eq(0)").text() + ' : ' + $(this).find("td:eq(1)").text() + '%, ';
            });
            var slice = " ";
            slice = fvals.replace(/,\s*$/, ""); // removing the last comma
            $('#tabular tbody').html("");
            $('#txttperc').val("0").change();
            $('#txtpk').val("");
            $('#txtpk').val(slice).change();
        }

        function clear_values() {
            $('#ddlraces').val("");
            $('#lnktambah').prop('disabled', false);
            $('#lnkkamaskini').prop('disabled', true);
            $('#lnkdelete').prop('disabled', true);
            $('#tabular tbody').html("");
            $('#txttperc').val("0");
            $('#txtperc').val("0");
        }
        $(document).ready(function () {
            $('#lnkkamaskini').prop('disabled', true);
            $('#lnkdelete').prop('disabled', true);
            $(document).on("click", "#tb tr", function (e) {
                $('#lnktambah').prop('disabled', true);
                $('#lnkkamaskini').prop('disabled', false);
                $('#lnkdelete').prop('disabled', false);
                rowid = this.id;
                rowvalue = this.className;
                $('#ddlraces').val(this.id).change();
                $('#txtperc').val(this.className);
            });
        });
    </script>
    <script type="text/javascript">
        function val_el_u() {
            Election_ResultA.init();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>KEMASKINI MAKLUMAT</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                        </div>
                        <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <asp:Label ID="lblvalid" runat="server"></asp:Label>
                        </div>
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> MAKLUMAT KAWASAN</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <div class="col-lg-10">
                                        <label class="control-label" for="example-input1-group2">PECAHAN KAUM</label>
                                        <div class="input-group form-group">
                                            <asp:TextBox ID="txtpk" runat="server" CssClass="input form-control" ClientIDMode="Static"></asp:TextBox>
                                            <span class="input-group-btn">
                                                <button type="button" data-toggle="modal" data-target="#percent-modal" class="btn waves-effect waves-light btn-primary">KEMASKINI KAUM</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">JUMLAH PEMILIH BERDAFTAR</label>
                                            <asp:TextBox ID="txtjpb" runat="server" CssClass="input form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">JUMLAH KERTAS UNDI DITOLAK</label>
                                            <asp:TextBox ID="txtjkud" runat="server" CssClass="input form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">JUMLAH KERTAS UNDI DALAM PETI UNDI</label>
                                            <asp:TextBox ID="txtjkudpu" runat="server" CssClass="input form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">JUMLAH KERTAS UNDI DIKELUARKAN</label>
                                            <asp:TextBox ID="txtjkudi" runat="server" CssClass="input form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">JUMLAH KERTAS UNDI TIDAK DIKEMBALIKAN</label>
                                            <asp:TextBox ID="txtjkutd" runat="server" CssClass="input form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">PERATUS PENGUNDIAN </label>
                                            <asp:TextBox ID="txtper" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">MAKLUMAT PEMENANG</label>
                                            <asp:Label ID="lblwinner" runat="server" CssClass="form-control" BorderStyle="None" BackColor ="White"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">MAJORITI</label>
                                            <asp:TextBox ID="txtmajority" runat="server" CssClass="input form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="">MAKLUMAT PENYANDANG</label>
                                            <asp:Label ID="lblinc" runat="server" CssClass="form-control" BorderStyle="None" BackColor ="White"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-bar-chart"></i> MAKLUMAT UNDI CALON</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:GridView ID="candidate_list" CssClass="table table-bordered dt-responsive nowrap m-t-10 tablec" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" OnRowEditing="candidate_list_RowEditing" OnRowCancelingEdit="candidate_list_RowCancelingEdit" OnRowUpdating="candidate_list_RowUpdating" DataKeyNames="election_result_id,candidate_id,party_id,coalition_id">
                                            <Columns>
                                                <asp:BoundField HeaderText="NAMA CALON BERTANDING" DataField="candidate_name" ReadOnly="true"></asp:BoundField>
                                                <asp:BoundField HeaderText="PARTI" DataField="party_shortcode" ReadOnly="true"></asp:BoundField>
                                                <asp:BoundField DataField="winner" HeaderText="Win" HeaderStyle-CssClass="hideGridColumn" ItemStyle-CssClass="hideGridColumn">
                                                    <HeaderStyle CssClass="hideGridColumn"></HeaderStyle>

                                                    <ItemStyle CssClass="hideGridColumn"></ItemStyle>
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="UNDI">
                                                    <EditItemTemplate>
                                                        <asp:TextBox runat="server" Text='<%# Bind("no_of_vote") %>' ID="txtvotes"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="Required" runat="server" ErrorMessage="This Field is Required" Type="Integer" ControlToValidate="txtvotes" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="negativevalidator" runat="server" ErrorMessage="Invalid Value" ControlToValidate="txtvotes" ValidationExpression="^[1-9]\d*$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Bind("no_of_vote") %>' ID="Label3"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="PEMENANG">
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="chkwinner" runat="server" Checked='<%# Eval("winner").Equals("YES") ? true : false %>' />
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" Checked='<%# Eval("winner").Equals("YES") ? true : false %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Tindakan">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkedit" runat="server" CssClass="fa fa-edit no-loader" CommandName="Edit"></asp:LinkButton>
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
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="btn-block">
                            <asp:Button ID="btnsimpan" CssClass="btn btn-success pull-right m-r-15" runat="server" OnClientClick="val_el_u()" Text="SIMPAN" OnClick="btnsimpan_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="percent-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">KEMASKINI PERATUSAN KAUM</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="form-group">
                                <asp:DropDownList ID="ddlraces" DataTextField="lookup_name" DataValueField="lookup_id" runat="server" CssClass="form-control rcs" ClientIDMode="Static">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group">
                                <asp:TextBox ID="txtperc" runat="server" CssClass="input form-control" placeholder="0" ClientIDMode="Static"></asp:TextBox>
                                <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <button type="button" id="lnktambah" class="btn btn-success w100" onclick="add_to_table()"><i class="fa fa-plus"></i>TAMBAH</button>
                        </div>
                        <div class="col-lg-4">
                            <button type="button" id="lnkkamaskini" class="btn btn-primary w100" onclick="up_table()"><i class="fa fa-plus"></i>KEMASKINI</button>
                        </div>
                        <div class="col-lg-4">
                            <button type="button" id="lnkdelete" class="btn btn-danger w100" onclick="del_frm_table()"><i class="fa fa-trash"></i>HAPUS</button>
                        </div>
                    </div>
                    <div class="row m-t-15">
                        <div class="col-md-12">
                            <div class="panel panel-color panel-success">
                                <div class="panel-body panel-custom-bg">
                                    <table class="table table-bordered dt-responsive nowrap m-t-10 tablec" id="tabular">
                                        <thead>
                                            <tr>
                                                <th>BANGSA</th>
                                                <th>PERATUS</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tb">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <label class="control-label" for="example-input1-group2">JUMLAH KESELURUHAN</label>
                            <div class="input-group">
                                <asp:TextBox ID="txttperc" runat="server" ReadOnly="true" CssClass="input form-control" ClientIDMode="Static" Text="0"></asp:TextBox>
                                <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSubmit" class="btn btn-success" onclick="get_values()" data-dismiss="modal">OK</button>
                    <button type="button" id="btnClear" class="btn btn-info waves-light" onclick="clear_values()" data-dismiss="modal">BATAL</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->
</asp:Content>
