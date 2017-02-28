<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidate_detail.aspx.cs" Inherits="SIS_V.state.candidate_detail"  MasterPageFile="~/state/state_master.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
            $(document).ready(function () {
                fill_candidates();
        });
    </script>
    <script type="text/javascript">
        function fill_candidates() {
            var data = {};
            var areaid = '<%= Session["area_id"] %>';
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"areaid":"' + areaid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("candidate_detail.aspx/fill_candidates")%>',
                dataType: "json",
                success: function (data) {
                    var $container = "";
                    for (var i = 0; i < data.d.length; i++) {
                        $dist = data.d[i].par_name;
                        var $sub = '';
                        for (var j = 0; j < data.d[i].dun.length; j++) {
                            $sub += '<p class="ta-center">' + data.d[i].dun[j] + '</p>';
                        }
                        var twist = '<div class="grid-item"> <div class="ibox"><a href="' + url + '" class="txt-inherit redir"><div class="ibox-content bg-info txt-black"><div class="ibox-top"><h4 class="font-bold">PARLIMEN</h4><p class="f-w-600 ta-center">' + $dist + '</p></div><div class="ibox-bottom"><h4 class="font-bold">DUN</h4>' + $sub + '</div></div></a></div></div>';
                        $container += twist;
                    }
                    $("#par").html($container);
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
            <div class="card-box ta-center">
                <h4>BAKAL CALON PILIHANRAYA UMUM KE-13</h4>
                <h5>PULAU PINANG - SEHINGGA 07 Feb 2017</h5>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div class="contact-box">
                <div class="col-sm-4">
                    <div class="text-center">
                        <img alt="image" class="img-circle m-t-xs img-responsive" src="../assets/images/users/avatar-0.jpg">
                        <div class="m-t-xs font-bold">(BN - UMNO)</div>
                    </div>
                </div>
                <div class="col-sm-8">
                    <h4><strong>HILMI BIN ABD RASHID; DATO'</strong></h4>
                    <p><span class="label label-success fs-13">PILIHAN PERTAMA</span></p>
                    <address>
                        <strong>PEKERJAAN</strong><br>
                        BEKAS PENGERUSI UDA
                    </address>
                    <address>
                        <strong>JAWATAN</strong><br>
                        TIMBALAN KETUA BAHAGIAN UMNO
                    </address>
                    <address>
                        <strong>PENDIDIKAN</strong><br>
                        SARJANA PENGURUSAN PERNIAGAAN, MARSHALL
                            UNIVERSITY, USA
                    </address>
                    <address>
                        <strong>ULASAN</strong><br>
                        TIADA SEBARANG KONTROVERSI<br>
                        DITIMBULKAN, MULA BERGITI MENDEKATI<br>
                        PENGUNDI AKAR UMBI, MENANG DENGAN<br>
                        MAJORITI SELESA PADA PRU - 11<br>
                    </address>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</asp:Content>
