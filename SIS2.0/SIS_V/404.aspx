<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="SIS_V._404" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc."/>
    <meta name="author" content="Coderthemes"/>

    <link rel="shortcut icon" href="assets/images/favicon_1.ico"/>

    <title>404</title>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/core.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/components.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/pages.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/menu.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/core_sn.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css"/>


    <script src="assets/js/modernizr.min.js"></script>
</head>
<body>
<header id="topnav">
    <div class="topbar-main">
        <div class="container">

            <!-- Logo container-->
            <div class="logo">
                <a href="index-2.html" class="logo"><img src="<?php echo base_url(); ?>/assets/images/logo/logo_4.png" alt="user-img" class="hidden-xs"> <img src="<?php echo base_url(); ?>/assets/images/logo/logo_xs.png" alt="user-img" class="visible-xs logo-img"> <span class="hidden-xs"> STRATEGIC INFORMATION SYSTEM</span></a>
            </div>
            <!-- End Logo container-->

            <div class="menu-extras">

                <ul class="nav navbar-nav navbar-right pull-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle waves-effect waves-light profile" data-toggle="dropdown" aria-expanded="true"><img src="<?php echo base_url(); ?>/assets/images/users/avatar-0.jpg" alt="user-img" class="img-circle"> </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)"><i class="ti-user m-r-5"></i> Profile</a></li>
                            <li><a href="javascript:void(0)" data-toggle="modal"  data-target="#sis-ape-modal"><i class="ti-settings m-r-5"></i> Maklumat Pengguna</a></li>
                            <li><a href="javascript:void(0)"><i class="ti-lock m-r-5"></i> Lock screen</a></li>
                            <li><a href="javascript:void(0)"><i class="ti-power-off m-r-5"></i> Keluar dari SIS</a></li>
                        </ul>
                    </li>
                </ul>

                <div class="menu-item">
                    <!-- Mobile menu toggle-->
                    <a class="navbar-toggle">
                        <div class="lines">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </a>
                    <!-- End mobile menu toggle-->
                </div>
            </div>

        </div>
    </div>
    <!-- End topbar -->


    <!-- Navbar Start -->
    <div class="navbar-custom">
        <div class="container">
            <div id="navigation">
                <!-- Navigation Menu-->
                <ul class="navigation-menu">
                    <li class="has-submenu active">
                        <a href="<?php echo base_url(); ?>dashboard"><i class="md md-dashboard"></i>Laman Utama</a>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-color-lens"></i>Dashboard</a>
                        <ul class="submenu">
                            <li><a href="<?php echo base_url(); ?>dashboard/utama">Dashboard Utama</a></li>
                            <li><a href="<?php echo base_url(); ?>dashboard/parlimen_tumpuan">Dashboard Parlimen Tumpuan</a></li>
                            <li><a href="<?php echo base_url(); ?>dashboard/kawasan_operasi">Kawasan Operasi</a></li>
                            <li><a href="<?php echo base_url(); ?>dashboard/bn_pembpangkang">Dashboard Tumpuan BN vs Pembpangkang</a></li>
                            <li><a href="ui-checkbox-radio.html">Keputusan Pilihan Raya</a></li>
                            <li><a href="ui-tabs.html">Ramusan Status Kawasan</a></li>
                            <li><a href="<?php echo base_url(); ?>dashboard/winnable_candidate">Winnable Candidate</a></li>
                            <li><a href="ui-progressbars.html">Penambahan Pengundi</a></li>
                            <li><a href="<?php echo base_url(); ?>dashboard/voters">Peratusan Keluar Mengundi</a></li>
                            <li><a href="ui-bootstrap.html">Peratusan Tahap Sokongan Agensi</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-invert-colors-on"></i>Pra-Pilihanraya</a>
                        <ul class="submenu">
                            <li class="has-submenu">
                                <a href="">Profil Bakal Calon / Individu</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Calon Boleh Menang</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                    <li><a href="map-vector.html"> Import Sumber</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="<?php echo base_url(); ?>dashboard/activiti_bakal">Aktiviti Bakal Calon / Individu</a>
                            </li>
                            <li>
                                <a href="<?php echo base_url(); ?>dashboard/activiti_parti">Aktiviti Parti Bertanding</a>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Aktiviti Agensi</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Aktiviti NGO</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                    <li><a href="map-vector.html"> Import</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Propaganda</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                    <li><a href="map-vector.html"> Import</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Tahap Sokongan</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                    <li><a href="map-vector.html"> Kemaskini Paparan Dashboard</a></li>
                                    <li><a href="map-vector.html"> Import</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Laporan Eksekutif</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Daftar Permilih</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Penambahan Pengundi</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li><a href="<?php echo base_url(); ?>dashboard/import_laporan_harian">Import Laporan Harian Dari Negeri</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-class"></i>Pilihanraya</a>
                        <ul class="submenu">
                            <li class="has-submenu">
                                <a href="#">Keputusan Pilihanraya</a>
                                <ul class="submenu">
                                    <li><a href="icons-glyphicons.html">Tambah</a></li>
                                    <li><a href="icons-materialdesign.html">Kemaskini</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Import Pecahan Kaum</a></li>
                            <li><a href="<?php echo base_url(); ?>dashboard/keluar_mengundi"">Keluar Mengundi</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-pages"></i>Pelaporan</a>
                        <ul class="submenu">
                            <li><a href="#"> Pelaporan Analisa Winnable Candidate</a></li>
                            <li><a href="#">Pelaporan Analisa Calon Bertanding</a></li>
                            <li><a href="#">Pautan Laporan Crystal Report</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-invert-colors-on"></i>Individu/Pertubuhan</a>
                        <ul class="submenu">
                            <li class="has-submenu">
                                <a href="#">Key-Communicator</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Individu Berpengaruh</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Organisasi Berpengaruh</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">NGO</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Pertubuhan Agama Bukan Islam</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Media</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Agensi</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="<?php echo base_url(); ?>dashboard/analisis_kawasan"><i class="md md-pages"></i>Analisis Kawasan</a>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-pages"></i>Tetapan</a>
                        <ul class="submenu">
                            <li><a href="<?php echo base_url(); ?>dashboard/parlimen_info">Tetapan parlimen info</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="<?php echo base_url(); ?>dashboard/tetapan_pentadbir"><i class="fa fa-user-plus"></i>Tetapan Pentadbir</a>
                    </li>
                </ul>
                <!-- End navigation menu -->
            </div>
        </div>
    </div>
</header>
<div class="ex-page-content">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-6">
                <div class="message-box m-t-30-percent">
                    <h1 class="m-b-0 above error-title">404</h1>
                    <p>Oops, an error has occurred. Page not found!</p>
                    <div class="buttons-con">
                        <div class="action-link-wrap">
                            <a onclick="history.back(-1)" class="btn btn-custom btn-success waves-effect waves-light m-t-20"> Previous page</a>
                            <a href="#" class="btn btn-custom btn-primary waves-effect waves-light m-t-20">Go to Home Page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer text-right">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 ta-center">
                2017 © Strategic Information System.
            </div>
        </div>
    </div>
</footer>

<script>
    var resizefunc = [];
</script>

<!-- Main  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>
</body>
</html>
