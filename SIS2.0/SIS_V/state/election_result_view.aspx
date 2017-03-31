<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="election_result_view.aspx.cs" Inherits="SIS_V.state.election_result_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-md-12">
        <div class="card-box">
            <h4 class="m-t-0 header-title"><b>KEMASKINI MAKLUMAT</b></h4>
            <p class="text-muted font-13 m-b-30"></p>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-color panel-custom-info">
                        <div class="panel-heading panel-heading-custom">
                            <h3 class="panel-title"><i class="fa fa-search-plus"></i> MAKLUMAT KAWASAN</h3>
                        </div>
                        <div class="panel-body panel-custom-bg-custom-info">
                            <div class="row">   
                                <div class="col-lg-10">
                                    <label class="control-label" for="example-input1-group2">PECAHAN KAUM</label>
                                    <div class="input-group form-group">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="input form-control"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <button type="button" data-toggle="modal" data-target="#percent-modal" class="btn waves-effect waves-light btn-primary">KEMASKINI KAUM</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">   
                                <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">JUMLAH PEMILIH BERDAFTAR</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="input form-control"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">JUMLAH KERTAS UNDI DITOLAK</label>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="input form-control"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">JUMLAH KERTAS UNDI DALAM PETI UNDI</label>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="input form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">   
                                <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">JUMLAH KERTAS UNDI DIKELUARKAN</label>
                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="input form-control"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">JUMLAH KERTAS UNDI TIDAK DIKEMBALIKAN</label>
                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="input form-control"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">PERATUS PENGUNDIAN </label>
                                         <pre>86.33</pre>
                                    </div>
                                </div>
                            </div>
                            <div class="row">   
                                <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">MAKLUMAT PEMENANG</label>
                                         <pre>Abu Hassan bin Sarif ( BN - UMNO )</pre>
                                    </div>
                                </div>
                                 <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">MAJORITI</label>
                                        <asp:TextBox ID="TextBox9" runat="server" CssClass="input form-control"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="col-lg-3">
                                     <div class="form-group">
                                         <label for="">MAKLUMAT PENYANDANG</label>
                                        <pre>Abu Hassan bin Sarif ( BN - UMNO ) Majoriti : 366</pre>
                                    </div>
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
                            <h3 class="panel-title"><i class="fa fa-bar-chart"></i> MAKLUMAT UNDI CALON</h3>
                        </div>
                        <div class="panel-body panel-custom-bg-custom-info">
                            <div class="row"> 
                                <div class="col-lg-6">
                                    <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10 tablec">
                                        <thead>
                                            <tr>
                                                <th style="width:3%">#</th>
                                                <th>NAMA CALON BERTANDING</th>
                                                <th style="width:15%">PARTI</th>
                                                <th style="width:8%">UNDI</th>
                                                <th style="width:8%">PEMENANG</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Abu Hassan bin Sarif</td>
                                                <td>( BN - UMNO )</td>
                                                <td>10777</td>
                                                <td><asp:CheckBox ID="CheckBox1" runat="server" Checked="true"/></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>Ismail BIn W.Teh @ Jaziz</td>
                                                <td>( PAS )</td>
                                                <td>8539</td>
                                                <td><asp:CheckBox ID="CheckBox2" runat="server"/></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                         <div class="col-lg-12">
                                             <div class="form-group">
                                                 <label for="">MAKLUMAT CALON BERTANDING</label>
                                                <pre>Abu Hassan bin Sarif ( BN - UMNO )</pre>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-12">
                                             <div class="form-group">
                                                 <label for="">JUMLAH UNDI CALON</label>
                                                <asp:TextBox ID="TextBox7" runat="server" CssClass="input form-control" Text="10777"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                         <div class="col-lg-12">  
                                               <button class="btn btn-success w100">KEMASKINI UNDI CALON</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="btn-block">
                        <button class="btn btn-primary pull-right">PADAM</button>
                        <button class="btn btn-success pull-right m-r-15">SIMPAN</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div id="percent-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <%--<asp:HiddenField ID="hd_password" ClientIDMode="Static" runat="server" />--%>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">KEMASKINI PERATUSAN KANUM</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select" ClientIDMode="Static">
                                <asp:ListItem Text="----SILA PILIH-----" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-4">                       
                        <div class="input-group">
                             <asp:TextBox ID="TextBox10" runat="server" CssClass="input form-control" placeholder="0"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <button class="btn btn-success w100"><i class="fa fa-plus"></i> TAMBAH</button>
                    </div>
                    <div class="col-lg-4">
                        <button class="btn btn-primary w100"><i class="fa fa-plus"></i> KAMASKINI</button>
                    </div>
                    <div class="col-lg-4">
                        <button class="btn btn-danger w100"><i class="fa fa-trash"></i> HAPUS</button>
                    </div>
                </div>
                <div class="row m-t-15">
                    <div class="col-md-12">
                        <div class="panel panel-color panel-success">
                            <div class="panel-body panel-custom-bg">
                                <table class="table table-bordered dt-responsive nowrap m-t-10 tablec">
                                    <thead>
                                        <tr>
                                            <th style="width:5%">#</th>
                                            <th>BANGSA</th>
                                            <th>PERATUS</th>                 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>India</td>
                                            <td>6</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Latin-Lain</td>
                                            <td>4</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                   <div class="col-lg-12">      
                       <label class="control-label" for="example-input1-group2">JUMLAH KESELURUHAN</label>                 
                        <div class="input-group">
                             <asp:TextBox ID="TextBox8" runat="server" CssClass="input form-control" placeholder="0"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-percent"></i></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="OK" />
                <button id="btnClear" class="btn btn-info waves-light" data-dismiss="modal">BATAL</button>
            </div>
        </div>
    </div>
</div>
<!-- /.modal -->    
</asp:Content>
