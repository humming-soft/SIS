<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Win_Candidate.aspx.cs" Inherits="SIS_V.state.Win_Candidate" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            parlimen_WC();
            //dun_WC();
        });
    </script>

    <script type="text/javascript">
        function parlimen_WC() {
            var data = {};
            var sid = '<%= Session["state"] %>';
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"sid":"' + sid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("Win_Candidate.aspx/parlimen_WC")%>',
                dataType: "json",
                success: function (data) {
                    var $container="";
                    for (var i = 0; i < data.d.length; i++) {
                        var twist = '<div class="grid-item"> <div class="ibox"> <a href="candidate_detail" class="txt-inherit"><div class="ibox-content bg-info txt-black"><div class="ibox-top"><h4 class="font-bold">PARLIMEN</h4><p class="f-w-600 ta-center">' + data.d[i].area_name + '</p></div><div class="ibox-bottom"><h4 class="font-bold">DUN</h4><p>N.1 - PENAGA</p><p>N.2 - BERTAM</p><p>N.3 - PINANG TUNGGAL</p></div></div></a></div></div>';
                        $container += twist;
                    }
                    $("#par").html($container);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(errorThrown);
                },
                complete: function (data) {
                    $('.grid').masonry({
                        itemSelector: '.grid-item',
                        columnWidth: 250,
                        gutter: 25
                    });
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid" id="par">
        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail" class="txt-inherit">
                    <div class="ibox-content bg-info txt-black">
                        <div class="ibox-top">
                            <h4 class="font-bold">-
                            </h4>
                            <p>-</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">-
                            </h4>
                            <p>-</p>
                            <p>-</p>
                            <p>-</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</asp:Content>
