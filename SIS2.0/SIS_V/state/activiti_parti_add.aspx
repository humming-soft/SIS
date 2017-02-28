<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_parti_add.aspx.cs" Inherits="SIS_V.state.activiti_parti_add" MasterPageFile="~/state/state_master.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         jQuery(document).ready(function ($) {
             alert('here');
             $('.item_date').datepicker({
                 format: "dd/mm/yyyy hh:ii",
                 keyboardNavigation: false,
                 todayHighlight: true, // to highlight today
                 orientation: "bottom auto",
                 autoclose: true
             });
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
                        $('#drop_mengudi').append($("<option></option>").attr("value", null).text("NO DATA"));
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
                                 <asp:TextBox ID="dt_Tarikh" CssClass="form-control item_date" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="userName">Jenis Maklumat</label>
                                <asp:DropDownList ID="drop_jenis" CssClass="form-control" runat="server"
                                    ClientIDMode="Static" DataTextField="activity_details" DataValueField="activity_id">
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
                                <asp:TextBox ID="TextBox3" CssClass="form-control" style="width: 100%; min-height: 300px" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <%--<textarea class="form-control" style="width: 100%; min-height: 300px"></textarea>--%>
                            </div>
                        </div>
                    </div>
                 <div class="form-group text-left m-b-0 m-t-15">
                        <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" />
                        <asp:Button ID="btn_cancel" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" />
                 </div>
            </div>
        </div>
    </div>
</asp:Content>

