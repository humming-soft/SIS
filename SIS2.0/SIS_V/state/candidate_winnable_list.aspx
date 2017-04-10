<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="candidate_winnable_list.aspx.cs" Inherits="SIS_V.state.candidate_winnable_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            min-height:900px;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {
                $("#candidates").customselect();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:ScriptManager ID="MainScriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">
           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:updateprogress id="UpdateProgress1" runat="server" associatedupdatepanelid="UpdatePanel1" dynamiclayout="true">
                        <progresstemplate>
                                <div class="splash">
                                    <div class="splash-title">
                                        <div class="spinner">
                                            <div class="rect1"></div>
                                            <div class="rect2"></div>
                                            <div class="rect3"></div>
                                            <div class="rect4"></div>
                                            <div class="rect5"></div>
                                        </div>
                                        <h4>Loading..</h4>
                                    </div>
                                </div>
                        </progresstemplate>
                    </asp:updateprogress>
                    <div class="card-box">
                        <h4 class="m-t-0 header-title"><b>PAPARAN MAKLUMAT KEPUTUSAN PILIHANRAYA</b></h4>
                        <p class="text-muted font-13 m-b-30"></p>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-color panel-custom-info">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="fa fa-search-plus"></i> Search Candidate</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-custom-info">
                                        <div class="row">
        <%--                                    <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="userName">JENIS CARIAN</label>
                                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static">
                                                        <asp:ListItem Text="----Select-----" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="Nama Calon" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Nombor IC" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            <div class="col-lg-6">
                                                <div class="input-group m-t-25">
                                                    <asp:DropDownList ID="candidates" runat="server" CssClass="input form-control custom-select" DataTextField="Candidate_name" DataValueField="Candidate_ic" ClientIDMode="Static"></asp:DropDownList>
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton ID="btnSelect" runat="server" CssClass="btn btn btn-primary no-loader" OnClick="btnSelect_Click"><i class="fa fa-search"></i> PILIH CALON</asp:LinkButton>n>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                             <div class="col-lg-12">
                                 <div class="panel panel-color panel-custom-info" id="listPanel" runat="server">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="md md-contacts"></i> Candidate List</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-custom-info">
                                        <div class="col-lg-12">
                                            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                                            <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10">
                                                <thead>
                                                    <tr>
                                                        <th style="width:3%">#</th>
                                                        <th style="width:8%">Profile image</th>
                                                        <th>Geleran</th>
                                                        <th>Kad Pengenalan Calon</th>
                                                        <th>Nama Calon</th>
                                                        <th>Parti</th>
                                                        <th style="width:8%">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>                                    
                                                            <img src="../assets/images/users/avatar-0.jpg" style="width:60px" class="thumb-img" alt="work-thumbnail">
                                                        </td>
                                                        <td>Datuk Seri Panglima</td>
                                                        <td>550615-12-5069</td>
                                                        <td>Lajim Bin Ukin</td>
                                                        <td>PKR - Parti-Keadilan Rakyat</td>
                                                        <td><a href="candidate_winnable_view"><i class="fa fa-edit"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>                                    
                                                            <img src="../assets/images/users/avatar-0.jpg" style="width:60px" class="thumb-img" alt="work-thumbnail">
                                                        </td>
                                                        <td>Datuk Seri Panglima</td>
                                                        <td>550615-12-5069</td>
                                                        <td>Lajim Bin Ukin</td>
                                                        <td>PKR - Parti-Keadilan Rakyat</td>
                                                        <td><a href="candidate_winnable_view"><i class="fa fa-edit"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>                                    
                                                            <img src="../assets/images/users/avatar-0.jpg" style="width:60px" class="thumb-img" alt="work-thumbnail">
                                                        </td>
                                                        <td>Datuk Seri Panglima</td>
                                                        <td>550615-12-5069</td>
                                                        <td>Lajim Bin Ukin</td>
                                                        <td>PKR - Parti-Keadilan Rakyat</td>
                                                        <td><a href="candidate_winnable_view"><i class="fa fa-edit"></i></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>                                    
                                                            <img src="../assets/images/users/avatar-0.jpg" style="width:60px" class="thumb-img" alt="work-thumbnail">
                                                        </td>
                                                        <td>Datuk Seri Panglima</td>
                                                        <td>550615-12-5069</td>
                                                        <td>Lajim Bin Ukin</td>
                                                        <td>PKR - Parti-Keadilan Rakyat</td>
                                                        <td><a href="candidate_winnable_view"><i class="fa fa-edit"></i></a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                             </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
