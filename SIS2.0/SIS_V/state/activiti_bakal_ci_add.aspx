<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_add.aspx.cs" Inherits="SIS_V.state.activiti_bakal_ci_add" MasterPageFile="~/state/state_master.Master" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation_activiti() {
            Activiti_Bakal.init();
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.item_date').datetimepicker({
                format: "dd/mm/yyyy hh:ii",
                keyboardNavigation: false,
                todayHighlight: true, // to highlight today
                orientation: "bottom auto",
                autoclose: true
            });
            $("#ddlName").customselect();
            //$("#ContentPlaceHolder1_ddlName").searchable({
            //    maxListSize: 200, // if list size are less than maxListSize, show them all
            //    maxMultiMatch: 300, // how many matching entries should be displayed
            //    exactMatch: false, // Exact matching on search
            //    wildcards: true, // Support for wildcard characters (*, ?)
            //    ignoreCase: true, // Ignore case sensitivity
            //    latency: 200, // how many millis to wait until starting search
            //    warnMultiMatch: 'top {0} matches ...',
            //    warnNoMatch: 'No Matches Found...',
            //    zIndex: 'auto'
            //});
        });
    </script>
    <script>
        function fill_polling_district() {
            var area_id = $('#ContentPlaceHolder1_ddlParlimen option:selected').val();
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"area_id":"' + area_id + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("activiti_bakal_ci_add.aspx/GetPollingDistrict")%>',
                dataType: "json",
                success: function (data) {
                    if (data.d.length > 0) {
                        $('#ContentPlaceHolder1_ddlDaerah').empty();
                        $('#ContentPlaceHolder1_ddlDaerah').append("<option value=''>-----SELECT-----</option>");
                        $.each(data.d, function (key, value) {
                            $("#ContentPlaceHolder1_ddlDaerah").append($("<option></option>").val(value.polling_district_id).html(value.polling_district_name));

                        });
                    } else {
                        $('#ContentPlaceHolder1_ddlDaerah').empty();
                        $("#ContentPlaceHolder1_ddlDaerah").append($("<option></option>").attr("value", null).text("NO DATA"));
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
                <h4 class="m-t-0 header-title"><b>Tambah Aktiviti Bakal Calon/Individu</b></h4>
                <p class="text-muted font-13 m-b-30">
                </p>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Pilihanraya</label>
                            <asp:DropDownList ID="ddlPilihanraya" CssClass="form-control" runat="server" DataTextField="election_name" DataValueField="election_id"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Negeri</label>
                            <asp:DropDownList ID="ddlNegeri" CssClass="form-control" runat="server" DataTextField="state_name" DataValueField="state_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Parlimen - DUN</label>
                            <asp:DropDownList ID="ddlParlimen" CssClass="form-control" runat="server" DataTextField="area_name" DataValueField="area_id" onchange="fill_polling_district()">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Daerah Mengundi</label>
                            <asp:DropDownList ID="ddlDaerah" CssClass="form-control" runat="server">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label for="userName">Name Calon</label>
                            <asp:DropDownList ID="ddlName" CssClass="custom-select" ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="Candidate_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Jenis Aktiviti</label>
                            <asp:DropDownList ID="ddlJenis" CssClass="form-control" runat="server" DataTextField="activity_details" DataValueField="activity_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Sumber Maklumat</label>
                            <asp:DropDownList ID="ddlSumber" CssClass="form-control" runat="server" DataTextField="lookup_name" DataValueField="lookup_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Tahap Kesahihan Maklumat</label>
                            <asp:DropDownList ID="ddlTahap" CssClass="form-control" runat="server" DataTextField="validity_type" DataValueField="validity_id">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="form-group">
                            <label for="userName">Tarikh dan Masa</label>
                            <asp:TextBox ID="dtTarikh" CssClass="form-control item_date" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label for="userName">Butiran Aktiviti</label>
                            <asp:TextBox ID="txtButiran" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group text-left m-b-0 m-t-15">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary waves-light" Text="Simpan" OnClientClick="validation_activiti()" OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnClear" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" OnClick="btnClear_Click" />
                </div>

                <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <p>We could not process your request, please check your form fields!</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

