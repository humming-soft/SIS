<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="candidate_winnable_add.aspx.cs" Inherits="SIS_V.state.candidate_winnable_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../assets/js/fileupload/boostrap.fileupload.min.css" rel="stylesheet" />
    <script src="../assets/js/fileupload/boostrap.fileupload.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH PROFIL CALON BOLEH MENANG</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-success">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="fa fa-search-plus"></i> Search Candidate</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-success">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="input form-control" placeholder="Search Candidate.."></asp:TextBox>
                                            <span class="input-group-btn">
                                                <button type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                     <div class="col-lg-3">
                         <div class="panel panel-color panel-success">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title"><i class="md md-contacts"></i> Candidate Informaton</h3>
                            </div>
                            <div class="panel-body panel-custom-bg-success">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="m-b-sm">
                                            <img alt="image" class="img-rounded" src="../assets/images/users/avatar-0.jpg" style="width: 120px">
                                        </div>  
                                    </div>
                                    <div class="col-lg-8">
                                        <ul class="list-group clear-list">
                                            <li class="list-group-item fist-item">
                                                <span>  NAMA CALON :</span>
                                                <strong> Syafiq Kurahman bin Hj. Shamsudin </strong>
                                            </li>
                                            <li class="list-group-item">
                                                <span> KAD PENGENALAN : </span>
                                                <strong> 450527-99-5617 </strong>
                                            </li>
                                        </ul>
                                    </div>                                                        
                                    <div class="col-lg-12">
                                        <div class="row">
                                            <div class="client-detail">
                                                <div class="full-height-scroll">
                                                    <ul class="list-group clear-list">
                                                        <li class="list-group-item fist-item">
                                                            <span>  PARTI PENGENALAN :</span>
                                                            <strong> Barisan Nasional </strong>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span> KOD PARTI : </span>
                                                            <strong> UMNO </strong>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span> PARTI POLITIK : </span>
                                                            <strong> Pertubuhan Kebangsaan Melayu Bersatu </strong>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span> JAWATAN POLITIK : </span>
                                                                <strong> KETUA PEMUDA BAHAGIAN DAN MT PEMUDA PUSAT </strong>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span> PEKERJAAN : </span>
                                                            <strong> AHLI PERNIAGAAN </strong>
                                                        </li>
                                                        <li class="list-group-item">
                                                            <span> PENDIDIKAN : </span>
                                                            <strong> IJAZAH </strong>
                                                        </li>
                                                    </ul>
                                                    <strong>Komen </strong>
                                                        <div class="form-group">
                                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="130px"></asp:TextBox>
                                                        </div>
                                                    <hr/>
                                                </div>
                                            </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     </div>
                     <div class="col-lg-9">
                        <div class="row">
                             <div class="panel panel-color panel-success">
                                <div class="panel-heading panel-heading-custom">
                                    <h3 class="panel-title"><i class="fa fa-plus-square"></i> TAMBAH KAWASAN CALON BOLEH MENANG</h3>
                                </div>
                                <div class="panel-body panel-custom-bg-success">
                                    <div class="row">
                                       <div class="col-lg-12">
                                            <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>PILIHANRAYA</th>
                                                        <th>NEGERI</th>
                                                        <th>PENYANDANG</th>
                                                        <th>KAWASAN</th>
                                                        <th>PILIHAN</th>
                                                        <th>KOD KAWASAN</th>
                                                        <th style="width:8%"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="form-group m-b-0">
                                                                <asp:DropDownList ID="DropDownList7" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList8" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList9" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList10" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList11" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList12" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-warning w100" data-toggle="modal" data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="form-group m-b-0">
                                                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList4" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList5" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList6" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-warning w100" data-toggle="modal" data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="form-group m-b-0">
                                                                <asp:DropDownList ID="DropDownList13" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList14" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList15" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList16" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList17" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList18" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-warning w100" data-toggle="modal" data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="form-group m-b-0">
                                                                <asp:DropDownList ID="DropDownList21" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList22" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList23" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList24" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList25" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="DropDownList26" CssClass="form-control" runat="server"></asp:DropDownList>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-warning w100" data-toggle="modal" data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</button>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>  
                                       </div>
                                    <div class="row m-t-30">
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <button type="button" class="btn btn-danger w100"><i class="fa fa-trash"></i> KELUAR DARI SENARAI</button>
                                        </div>
                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <button type="button" class="btn btn-primary w100"><i class="fa fa-plus"></i> TAMBAH KAWASAN</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                             <div class="panel panel-color panel-success">
                                <div class="panel-heading panel-heading-custom">
                                    <h3 class="panel-title"><i class="fa fa-file-archive-o"></i> TAMBAH MAKLUMAT ARCHIVES</h3>
                                </div>
                                <div class="panel-body panel-custom-bg-success">
                                    <div class="row">
                                         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                             <label for="userName">PILIH FAIL YANG ANDA KENHANDAKI DI BAWAH</label>
                                              <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <span class="btn btn-primary btn-file" style="width:50%"><span class="fileupload-new"><i class="fa fa-file-text"></i> Select file</span>
                                                <span class="fileupload-exists"><i class="fa fa-reply"></i> Change</span><asp:FileUpload ID="FileUpload1" runat="server" /></span>
                                                <span class="fileupload-preview"></span>
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                              </div>
                                         </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="userName">INFORMASI TAMBAHAN</label>
                                                <asp:TextBox ID="TextBox3" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="130px"></asp:TextBox>
                                            </div>                                            
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                   </div>  
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="resource-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog" style="width:55%">
            <%--<asp:HiddenField ID="hd_password" ClientIDMode="Static" runat="server" />--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">TAMBAH AGENSI BAGI KAWASAN CALON BOLEH MENANG</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-color panel-success">
                                <div class="panel-heading panel-heading-custom">
                                    <h3 class="panel-title">PILIH AGENSI UNTUK KAWASAN CALON BOLEH MENANG</h3>
                                </div>
                                <div class="panel-body panel-custom-bg">
                                    <table class="table table-bordered dt-responsive nowrap m-t-10 temp">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th style="width:20%">TARIKH SUMBER</th>
                                                <th style="width:25%">AGENSI</th>
                                                <th>JUSTIFIKASI</th>                    
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="input form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group  m-b-0">
                                                        <asp:DropDownList ID="DropDownList19" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="input form-control" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="input form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group  m-b-0">
                                                        <asp:DropDownList ID="DropDownList20" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="input form-control" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="btn-group pull-right">
                                <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="HAPUS DARI SENARAI" />
                                <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="TAMBAH KE SENARAI" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="OK" />
                    <asp:Button ID="btnClear" CssClass="btn btn-info waves-light" runat="server" Text="BATAL" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->    
</asp:Content>
