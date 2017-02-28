﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Win_Candidate.aspx.cs" Inherits="SIS_V.state.Win_Candidate" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            parlimen_WC();
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
                    var $container = "";
                    for (var i = 0; i < data.d.length; i++) {
                        $dist = data.d[i].par_name;
                        var $sub = '';
                        for (var j = 0; j < data.d[i].dun.length; j++) {
                            $sub += '<p class="ta-center">' + data.d[i].dun[j] + '</p>';
                        }
                        var url = "winnable_candidate?id=" + data.d[i].par_id;
                        var twist = '<div class="grid-item"> <div class="ibox"><a href="' + url + '" class="txt-inherit redir"><div class="ibox-content bg-info txt-black"><div class="ibox-top"><h4 class="font-bold">PARLIMEN</h4><p class="f-w-600 ta-center">' + $dist + '</p></div><div class="ibox-bottom"><h4 class="font-bold">DUN</h4>' + $sub + '</div></div></a></div></div>';
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