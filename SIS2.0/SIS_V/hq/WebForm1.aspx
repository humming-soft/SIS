<%@ Page Title="" Language="C#" MasterPageFile="~/hq/hq_master.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SIS_V.hq.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <script type = "text/javascript">
function ShowCurrentTime() {
    $.ajax({
        type: "POST",
        url: "WebForm1.aspx/GetCurrentTime",
        data: '{}',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: OnSuccess,
        failure: function(response) {
            alert(response.d);
        }
    });
}
function OnSuccess(response) {
    alert(response.d);
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
