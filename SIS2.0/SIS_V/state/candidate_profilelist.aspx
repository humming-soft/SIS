<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="candidate_profilelist.aspx.cs" Inherits="SIS_V.state.candidate_profilelist" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        jQuery(document).ready(function () {
            "use strict";
            dtReference.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH PROFIL BAKAL CALON / INDIVIDU</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-success">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">Search Candidate</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-success">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">Nama Calon</label>
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">Nombor IC</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group text-left m-b-0 m-t-25">
                                            <asp:Button ID="button1" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" />
                                            <asp:Button ID="button2" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-success">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">Candidate List</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-success">
                                <div class="col-lg-12">
                                    <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10">
                                        <thead>
                                            <tr>
                                                <th style="width: 3%">#</th>
                                                <th style="width: 8%">Profile image</th>
                                                <th>Geleran</th>
                                                <th>Kad Pengenalan Calon</th>
                                                <th>Nama Calon</th>
                                                <th>Parti</th>
                                                <th style="width: 8%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <img src="../assets/images/users/avatar-0.jpg" style="width: 60px" class="thumb-img" alt="work-thumbnail">
                                                </td>
                                                <td>Datuk Seri Panglima</td>
                                                <td>550615-12-5069</td>
                                                <td>Lajim Bin Ukin</td>
                                                <td>PKR - Parti-Keadilan Rakyat</td>
                                                <td><a href="candidate_profile_view"><i class="fa fa-edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <img src="../assets/images/users/avatar-0.jpg" style="width: 60px" class="thumb-img" alt="work-thumbnail">
                                                </td>
                                                <td>Datuk Seri Panglima</td>
                                                <td>550615-12-5069</td>
                                                <td>Lajim Bin Ukin</td>
                                                <td>PKR - Parti-Keadilan Rakyat</td>
                                                <td><a href="candidate_profile_view"><i class="fa fa-edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <img src="../assets/images/users/avatar-0.jpg" style="width: 60px" class="thumb-img" alt="work-thumbnail">
                                                </td>
                                                <td>Datuk Seri Panglima</td>
                                                <td>550615-12-5069</td>
                                                <td>Lajim Bin Ukin</td>
                                                <td>PKR - Parti-Keadilan Rakyat</td>
                                                <td><a href="candidate_profile_view"><i class="fa fa-edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <img src="../assets/images/users/avatar-0.jpg" style="width: 60px" class="thumb-img" alt="work-thumbnail">
                                                </td>
                                                <td>Datuk Seri Panglima</td>
                                                <td>550615-12-5069</td>
                                                <td>Lajim Bin Ukin</td>
                                                <td>PKR - Parti-Keadilan Rakyat</td>
                                                <td><a href="candidate_profile_view"><i class="fa fa-edit"></i></a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
