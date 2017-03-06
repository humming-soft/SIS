<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Win_Candidate.aspx.cs" Inherits="SIS_V.state.Win_Candidate" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            parlimen_WC();
        });
    </script>
    <style type="text/css">
        .scroll::-webkit-scrollbar {
            width: 6px;
        }

        .scroll::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
        }

        .scroll::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
        }
    </style>
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
                    var $container = "";
                    for (var i = 0; i < data.d.length; i++) {
                        $dist = data.d[i].par_name;
                        var $sub = '';
                        for (var j = 0; j < data.d[i].dun.length; j++) {
                            $sub += '<p class="ta-center">' + data.d[i].dun[j] + '</p>';
                        }
                        var url = "winnable_candidate?id=" + data.d[i].par_id;
                        var twist = '<div class="grid-item"> <div class="ibox"><a href="' + url + '" class="txt-inherit redir"><div class="ibox-content bg-info txt-black"><div class="ibox-top"><h4 class="font-bold">PARLIMEN</h4><p class="f-w-600 ta-center" style="height:50px !important">' + $dist + '</p></div><div class="ibox-bottom"><h4 class="font-bold">DUN</h4><div style="height:200px !important">' + $sub + '</div></div></div></a></div></div>';
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

    <%--    <script type="text/javascript">
        $(document).on("click", ".redir", function () {
            //console.log($(this).prev().val());
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid" id="par">
    </div>
</asp:Content>
