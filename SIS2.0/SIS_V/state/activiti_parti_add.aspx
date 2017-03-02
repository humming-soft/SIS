<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_parti_add.aspx.cs" Inherits="SIS_V.state.activiti_parti_add" MasterPageFile="~/state/state_master.Master" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
             $(window).on('load', function () {
                 var id = $('#drop_jenis').val();
                 var id1 = $('#drop_sumbar_isu').val();
                 var id2 = $('#drop_statusjanji').val();
                 if (id==6) {
                     $('#dr_one').show();
                     $('#dr_two').show();
                 }
                 if (id==14) {
                     $('#dr_three').show();
                     $('#dr_four').show();
                 }
                 if (id1==230) {
                     $('#dr_five').show();
                 }
                 if (id1 == 254) {
                     $('#dr_five').show();
                 }
                 if (id1 == 234) {
                     $('#dr_six').show();
                 }
                 if (id1 == 256) {
                     $('#dr_six').show();
                 }

             });
             $('.item_date').datetimepicker({
                 format: "dd/mm/yyyy hh:ii",
                 keyboardNavigation: false,
                 todayHighlight: true, // to highlight today
                 orientation: "bottom auto",
                 autoclose: true
             });
             $('#drop_jenis').on('change', function () {
                 var id = $('#drop_jenis').val();
                 if (id == 6) {
                     $("#drop_category").val("");
                     $('#drop_sumbar_isu').val("");
                     $('#dr_one').show();
                     $('#dr_two').show();
                     $('#dr_three').hide();
                     $('#dr_four').hide();
                     $('#dr_five').hide();
                     $('#dr_six').hide();

                 } else if (id == 14) {
                     $('#drop_status').val("");
                     $('#drop_statusjanji').val("");
                     $('#dr_one').hide();
                     $('#dr_two').hide();
                     $('#dr_three').show();
                     $('#dr_four').show();
                     $('#dr_five').hide();
                     $('#dr_six').hide();

                 } else {
                     $('#drop_status').val("");
                     $('#drop_statusjanji').val("");
                     $('#dr_one').hide();
                     $('#dr_two').hide();
                     $('#dr_three').hide();
                     $('#dr_four').hide();
                     $('#dr_five').hide();
                     $('#dr_six').hide();
                 }
             })
             $('#drop_statusjanji').on('change', function () {
                 $('#drop_agency').val("");
                 $('#drop_prtubuhan').val("");
                 var id = $('#drop_statusjanji').val();
                 if (id == 254) {
                     $('#drop_agency').val("");
                     $('#dr_five').show();
                     $('#dr_six').hide();
                 } else if (id == 256) {
                     $('#drop_prtubuhan').val("");
                     $('#dr_five').hide();
                     $('#dr_six').show();
                 } else {
                     $('#dr_five').hide();
                     $('#dr_six').hide();
                 }
             })
             $('#drop_sumbar_isu').on('change', function () {
                 var id = $('#drop_sumbar_isu').val();
                 $('#drop_agency').val("");
                 $('#drop_prtubuhan').val("");
                 if (id == 230) {
                     $('#drop_agency').val("");
                     $('#dr_five').show();
                     $('#dr_six').hide();
                 } else if (id == 234) {
                     $('#drop_prtubuhan').val("");
                     $('#dr_five').hide();
                     $('#dr_six').show();

                 } else {
                     $('#dr_five').hide();
                     $('#dr_six').hide();
                 }
             })
         });
       
         function getDistrict() {
             var data = {};
             var area_id = $('#drop_prlimen').val();
             $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"area_id":"' + area_id + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("activiti_parti_add.aspx/vot_district")%>',
                dataType: "json",
                success: function (data) {
                    if (data.d.length > 0) {
                        $('#drop_mengudi').empty();
                        $('#drop_mengudi').append($("<option></option>").attr("value", -1).text("-----SELECT----"));
                        $.each(data.d, function (key, value) {
                            $('#drop_mengudi').append($("<option></option>").attr("value", value.Dist_id).text(value.dist_name));
                        });
                    } else {
                        $('#drop_mengudi').empty();
                        $('#drop_mengudi').append($("<option></option>").attr("value", -1).text("NO DATA"));
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
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Tambah Maklumat Parti Bertanding</b></h4>
                <p class="text-muted font-13 m-b-30">
                    
                </p>
                    <div class="row">
                        <asp:HiddenField ID="hd_valid" ClientIDMode="Static" runat="server" />
                         <div class="alert alert-danger alert-dismissable" id="log_valid" runat="server">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <p>Please check , you have some form <b>errors</b>!</p>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Negeri</label>
                                <asp:TextBox ID="txt_negeri" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="userName">Parlimen-DUN</label>
                                <asp:DropDownList ID="drop_prlimen" CssClass="form-control parlimen-list" runat="server"
                                    ClientIDMode="Static" DataTextField="area_name" OnChange="getDistrict()" DataValueField="area_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                       <%-- <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">DUN</label>
                                <asp:DropDownList ID="drop_dun" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="rolename" DataValueField="roleid">
                                </asp:DropDownList>
                            </div>
                        </div>--%>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Daerah Mengundi</label>
                                <asp:DropDownList ID="drop_mengudi" CssClass="form-control" runat="server"
                                    ClientIDMode="Static">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Pilihanraya</label>
                                <asp:DropDownList ID="drop_pilihnraya" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="election_name" DataValueField="election_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Parti</label>
                                <asp:DropDownList ID="drop_parti" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="party_name_bm" DataValueField="party_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <%--<div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Tarikh</label>
                                <asp:TextBox ID="txt_tarikh" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>--%>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="userName">Tarik_Masa</label>
                                <%--  <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="time">--%>
                                <%--<asp:TextBox ID="txt_masa" CssClass="form-control" runat="server"></asp:TextBox>--%>
                                 <asp:TextBox ID="txt_datetime" CssClass="form-control item_date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Jenis Maklumat</label>
                                <asp:DropDownList ID="drop_jenis" CssClass="form-control" runat="server" 
                                    ClientIDMode="Static" DataTextField="activity_details" DataValueField="activity_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_one" hidden="hidden">
                            <div class="form-group">
                                <label for="userName">Kategory</label>
                                <asp:DropDownList ID="drop_category" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="current_issue_name" DataValueField="current_issue_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_two" hidden="hidden">
                            <div class="form-group">
                                <label for="userName">Sumber Isu</label>
                                <asp:DropDownList ID="drop_sumbar_isu" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="lookup_name" DataValueField="lookup_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_three" hidden="hidden">
                            <div class="form-group">
                                <label for="userName">Tindikan Status</label>
                                <asp:DropDownList ID="drop_status" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="lookup_name" DataValueField="lookup_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3" id="dr_four" hidden="hidden">
                            <div class="form-group">
                                <label for="userName">Sumber status janji pilihanraya</label>
                                <asp:DropDownList ID="drop_statusjanji" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="lookup_name" DataValueField="lookup_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                       <div class="col-lg-3" id="dr_five" hidden="hidden" >
                            <div class="form-group">
                                <label for="userName" id="ag_agency">Agensi</label>
                                <asp:DropDownList ID="drop_agency" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="agency_name" DataValueField="agency_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                          <div class="col-lg-3" id="dr_six" hidden="hidden" >
                            <div class="form-group">
                                <label for="userName" id="ag_pertu">Pertubuhan</label>
                                <asp:DropDownList ID="drop_prtubuhan" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="ngo_name" DataValueField="ngo_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Sumber Maklumat</label>
                                <asp:DropDownList ID="drop_sumber" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="lookup_name" DataValueField="lookup_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="userName">Tahap Kesahihan Maklumat</label>
                                <asp:DropDownList ID="drop_tahap" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="validity_type" DataValueField="validity_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="form-group">
                                <asp:TextBox ID="txt_detail" CssClass="form-control" style="width: 100%; min-height: 300px" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <%--<textarea class="form-control" style="width: 100%; min-height: 300px"></textarea>--%>
                            </div>
                        </div>
                    </div>
                 <div class="form-group text-left m-b-0 m-t-15">
                        <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClick="btn_submit_Click"  OnClientClick="validate_activity()"/>
                        <asp:Button ID="btn_cancel" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" OnClick="btn_cancel_Click" />
                 </div>
            </div>
        </div>
    </div>
     <script type="text/javascript">
         function validate_activity() {
             Add.init();
         }
    </script>
</asp:Content>

