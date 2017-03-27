﻿<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="candidate_profile.aspx.cs" Inherits="SIS_V.state.candidate_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function showBrowseDialog() 
        {
            document.getElementById('<%=FileUpload1.ClientID%>').click();    
        }
        function showBrowseDialogAdd() {
            document.getElementById('<%=FileUpload2.ClientID%>').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>TAMBAH PROFIL BAKAL CALON / INDIVIDU</b></h4>
                <p class="text-muted font-13 m-b-30"></p>
                <div class="row">
                    <div class="col-lg-9">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PERIBADI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Gelaran</label>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="userName">Kad Pengenalan Calon (Format: 670112-01-2893)</label>
                                             <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                  <div class="row">
                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label for="userName">Nama Calon</label>
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Tarikh Lahir</label>
                                             <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Jantina</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Kaum</label>
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="userName">Agama</label>
                                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end col -8 -->

                    <div class="col-lg-3">
                        <div class="gal-detail thumb panel-custom-bg" style="margin-top:0px">
                            <div style="width:100%; padding: 0 28%">
                                <div class="gal-detail thumb" style="margin-top:0px">
                                    <img src="../assets/images/users/avatar-0.jpg" class="thumb-img" alt="work-thumbnail" style="width:156px;">
                                </div>
                            </div>
                            <h4 class="text-center" style="margin-top:10px !important">Calon Profile Image</h4>
                            <div class="ga-border"></div>
                                <div class="form-group text-left m-b-0 m-t-15">
                                    <asp:FileUpload ID="FileUpload1" runat="server" style="display:none" />
                                    <button type="button" class="btn btn-success waves-light" style="width:100%" runat="server" onclick="return showBrowseDialog();"><i class="fa fa-image"></i> Select Image</button>
                                </div>               
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" TextMode="MultiLine" Height="110px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Telefon Rumah</label>
                                                 <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Nombor Fax</label>
                                                 <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Telefon Pejabat</label>
                                                 <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Emel</label>
                                                 <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                             <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT UNTUK DIHUBUNGI</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                             <asp:DropDownList ID="DropDownList4" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox19" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox20" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="alamat">Alamat</label>
                                                <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="checkbox checkbox-pink" style="margin-top:32px;">
                                                <asp:CheckBox ID="CheckBox2" runat="server"/>
                                                <label for="checkbox1"> Ahil Seumur Hidup</label>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="alamat">Alamat</label>
                                                <asp:TextBox ID="TextBox23" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>                        
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox22" runat="server" CssClass="form-control" TextMode="MultiLine" Height="110px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox24" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox25" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox26" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox27" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="alamat">Alamat</label>
                                            <asp:TextBox ID="TextBox34" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox35" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="userName">Telefon Bimbit</label>
                                              <asp:TextBox ID="TextBox37" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                   <div class="col-lg-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">INFORMASI TAMBAHAN (OPTIONAL)</h3>
                            </div>
                            <div class="panel-body panel-custom-bg">
                                <div class="col-xs-12 col-sm-12 col-lg-4 col-md-4 webdesign illustrator">
                                    <div class="gal-detail thumb" style="margin-top:0px">
                                        <img src="../assets/images/users/avatar-0.jpg" style="height:250px" class="thumb-img" alt="work-thumbnail">
                                    </div>
                                 </div>
                                 <div class="col-xs-12 col-sm-12 col-lg-8 col-md-8">
                                   <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="userName">Telefon Bimbit</label>
                                                  <asp:TextBox ID="TextBox28" runat="server" CssClass="form-control" TextMode="MultiLine" Height="184px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <asp:FileUpload ID="FileUpload2" runat="server" style="display:none" />
                                                <button type="button" class="btn btn-success waves-light" style="width:100%" runat="server" onclick="return showBrowseDialogAdd();"><i class="fa fa-image"></i> Select Image</button>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                            </div>
                          </div>
                     </div>
                     <div class="col-lg-6">
                         <div class="panel panel-color panel-primary">
                            <div class="panel-heading panel-heading-custom">
                                <h3 class="panel-title">MAKLUMAT PARTY</h3>
                            </div>
                            <div class="panel-body panel-custom-bg" style="height:312px;">
                                <div class="col-lg-12">
                                    <table class="table table-bordered dt-responsive nowrap m-t-10">
                                        <thead>
                                            <tr>
                                                    <th>#</th>
                                                <th>Nama Fail</th>
                                                <th>Informasi</th>
                                                <th>Saiz (Kb)</th>
                      
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                    <td></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                     </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-lg-12 p-0">
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="button1" CssClass="btn btn-primary waves-light" runat="server" Text="Simpan" />
                                <asp:Button ID="button2" CssClass="btn btn-default waves-light m-l-5" runat="server" Text="Batal"/>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>