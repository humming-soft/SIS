<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result.aspx.cs" Inherits="SIS_V.state.election_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation_keluar() {
            Keluar_Mengundi.init();
        }

        function fill_penyandang() {
            var area_id = $('#ContentPlaceHolder1_ddlArea option:selected').val();
            var election_id = '<%= Session["election_id"] %>';
            if (area_id != '') {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"area_id":"' + area_id + '","election_id":"' + election_id + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("election_result.aspx/GetPenyandang")%>',
                    dataType: "json",
                    success: function (data) {
                        if (data.d.length > 0) {
                            $('#ContentPlaceHolder1_lblPen').text('');
                            $.each(data.d, function (key, value) {
                                alert(value.winner_name);
                                $("#ContentPlaceHolder1_lblPen").text(value.winner_name);

                            });
                        } else {

                            $('#ContentPlaceHolder1_lblPen').text('');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                    }
                });
            } else {
                $('#ContentPlaceHolder1_lblPen').text('');
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
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH MAKLUMAT KEPUTUSAN PILIHANRAYA</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> Search Candidate (NEGERI : PERLIS)</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">PILIHANRAYA</label>
                                            <asp:TextBox ID="txtPil" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>                                            
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">NEGERI</label>
                                            <asp:TextBox ID="txtNegeri" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>                                            
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">KAWASAN</label>
                                            <asp:DropDownList ID="ddlArea" CssClass="form-control" DataTextField="area" DataValueField="area_id" runat="server" onchange="fill_penyandang()"></asp:DropDownList>
                                        </div>                                            
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PENYANDANG</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <strong > PENYANDANG : </strong>
                                        <pre><asp:Label ID="lblPen" runat="server" Text=""></asp:Label></pre>                                                                            
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                  </div>
                 <div class="row">
                    <div class="col-lg-8">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT CALON BERTANDING</h3>
                            </div>
                            <div class="panel-body panel-custom-bg" style="height:190px">
                                <div class="row">
                                    <table class="table table-bordered dt-responsive nowrap m-t-10 temp">
                                        <thead>
                                            <tr>
                                                <th>NAMA CALON BERTANDING</th>
                                                <th>PARTI</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Mukhriz Mahathir</td>
                                                <td>( BN - UMNO )</td>
                                            </tr>
                                            <tr>
                                                <td>Abd Ghani Bin Ahmad</td>
                                                <td>( PAS - PAS )</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-color panel-primary">
<%--                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"></h3>
                            </div>--%>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="form-group">
                                        <label>NAMA CALON</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                          <div class="form-group">
                                            <label for="userName">SELECT CANDIDATE</label>
                                            <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>                                       
                                    </div>
                                    <div class="col-lg-6">
                                        <button class="btn btn-purple w100 m-t-25">PADAM</button> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
                <div class="row">
                    <div class="col-lg-12">
                        <button class="btn btn-success pull-right">SIMPAN</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
