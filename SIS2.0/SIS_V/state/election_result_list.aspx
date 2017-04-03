<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result_list.aspx.cs" Inherits="SIS_V.state.election_result_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>PAPARAN PROFIL CALON BOLEH MENANG</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> Search Candidate</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">PILIHANRAYA</label>
                                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>                                            
                                    </div>
                                    <div class="col-lg-2">
                                        <div class="form-group">
                                            <label for="userName">KAWASAN</label>
                                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>                                            
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group m-t-25">
                                            <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server"></asp:DropDownList>
                                        </div>                                            
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <button class="btn btn-primary"><i class="fa fa-search-plus"></i> Cari</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col-lg-12">
                         <div class="panel panel-color panel-custom-info">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-contacts"></i> Candidate List</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-custom-info">
                                <div class="col-lg-12">
                                    <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10">
                                        <thead>
                                            <tr>
                                                <th style="width:3%">#</th>
                                                <th style="width:8%">PILIHANRAYA</th>
                                                <th>KOD KAWASAN</th>
                                                <th>NAMA KAWASAN</th>
                                                <th style="width:8%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>PILIHANRAYA</td>
                                                <td>N.1</td>
                                                <td>AYER HANGAT</td>
                                                <td><a href="election_result_view"><i class="fa fa-edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>PILIHANRAYA</td>
                                                <td>N.2</td>
                                                <td>KUAH</td>
                                                <td><a href="election_result_view"><i class="fa fa-edit"></i></a></td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td>PILIHANRAYA</td>
                                                <td>N.3</td>
                                                <td>KOTA SIPUTECH</td>
                                                <td><a href="election_result_view"><i class="fa fa-edit"></i></a></td>
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
