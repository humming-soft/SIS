<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="result.aspx.cs" Inherits="SIS_V.state.result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-md-12">
        <div class="card-box">
            <h4 class="m-t-0 header-title"><b>KEPUTUSAN PILIHANRAYA PILIHAN</b></h4>
            <p class="text-muted font-13 m-b-30"></p>
            <div class="row">
                <div class="col-lg-4">
                    <div class="panel panel-color panel-custom-info">
                        <div class="panel-heading panel-heading-custom">
                            <h3 class="panel-title"><i class="md md-stars"></i> PILIHANRAYA</h3>
                        </div>
                        <div class="panel-body panel-custom-bg-custom-info" style="height:440px">
                            <div class="row">   
                                <div class="col-lg-12">
                                    <div class="file-manager">
                                        <div class="hr-line-dashed"></div>
                                        <h5>ELECTION TITLES</h5>
                                        <div class="hr-line-dashed"></div>
                                        <ul class="folder-list folder-list-c" style="padding: 0">
                                            <li><a href="#"><i class="fa fa-university"></i> PILIHANRAYA UMUM KE - 12</a></li>
                                            <li><a href="#"><i class="fa fa-university"></i> PILIHANRAYA UMUM KE - 13</a></li>
                                            <li class="active"><a href="#"><i class="fa fa-university"></i> PILIHANRAYA KECIL N.20 SUNGAI LIMAU, JERAI, KEDAH</a></li>
                                            <li><a href="#"><i class="fa fa-university"></i> PILIHANRAYA KECIL DUN N.25 KAJANG, SELANGOR</a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               <div class="col-lg-8">
                    <div class="panel panel-color panel-custom-info">
                        <div class="panel-heading panel-heading-custom">
                            <h3 class="panel-title"><i class="fa fa-university"></i> ELECTION DESCRIPTION</h3>
                        </div>
                        <div class="panel-body panel-custom-bg-custom-info">
                            <div class="row">  
                                <div class="col-lg-12">

                                    <h2 class="font-bold m-b-xs">
                                        PILIHAN RAYA KECIL N.20 SUNGAI LIMAU, JERAI, KEDAH
                                    </h2>
<%--                                    <small>Many desktop publishing packages and web page editors now.</small>
                                    <div class="m-t-md">
                                        <h2 class="product-main-price">$406,602 <small class="text-muted">Exclude Tax</small> </h2>
                                    </div>--%>
                                    <hr>

                                    <h4>ELECTION INFORMATION</h4>
                                    <dl class="dl-horizontal m-t-md" style="min-height:205px">
                                        <dt class="l-h-24">TARIKH PILIHANRAYA</dt>
                                        <dd>04/11/2013</dd>
                                        <dt class="l-h-24">TARIKH MULA KEMPEN</dt>
                                        <dd>23/10/2013</dd>
                                        <dt class="l-h-24">TARIKH AKHIR KEMPEN</dt>
                                        <dd>03/11/2013</dd>
                                        <dt class="l-h-24">BUTIRAN</dt>
                                        <dd>Suruhanjaya Pilihan Raya (SPR) telah menerima pemakluman rasmi daripada Speaker Dewan Undangan Negeri Kedah pada 29 September 2013 (Ahad) berhubang dengan kekosongan kerusi bahagian pilihan raya Dewan Undangan Negeri (DUN) N.20 Sungai Limau, Kedah, berikutan kematian Ahli Dewan Undangan Negeri, Y.B. Tan Sri Azizan bin Abd.</dd>
                                    </dl>
                                    <hr>
                                    <div>
                                        <div class="btn-group">
                                            <asp:LinkButton ID="LinkButton1" class="btn btn-default btn-sm" runat="server" OnClick="LinkButton1_Click"><i class="fa fa-star"></i> VIEW ELECTON RESULT </asp:LinkButton>
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
</asp:Content>
