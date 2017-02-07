﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="parlimen_tumpuan.aspx.cs" Inherits="SIS_V.admin.parlimen_tumpuan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc."/>
    <meta name="author" content="Coderthemes"/>

    <link rel="shortcut icon" href="../assets/images/favicon_1.ico"/>

    <title>Minton - Responsive Admin Dashboard Template</title>

    <link href="../assets/plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />

    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/responsive.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script src="../assets/js/modernizr.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
<!-- Navigation Bar-->
<header id="topnav">
    <div class="topbar-main">
        <div class="container">

            <!-- Logo container-->
            <div class="logo">
                <a href="index-2.html" class="logo"><i class="md md-equalizer"></i><span> STRATEGIC INFORMATION SYSTEM</span> </a>
            </div>
            <!-- End Logo container-->

            <div class="menu-extras">

                <ul class="nav navbar-nav navbar-right pull-right">
                    <li class="dropdown hidden-xs">
                        <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light"
                           data-toggle="dropdown" aria-expanded="true">
                            <i class="md md-notifications"></i> <span
                                class="badge badge-xs badge-pink">3</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg">
                            <li class="text-center notifi-title">Notification</li>
                            <li class="list-group nicescroll notification-list">
                                <!-- list item-->
                                <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        <div class="pull-left p-r-10">
                                            <em class="fa fa-diamond noti-primary"></em>
                                        </div>
                                        <div class="media-body">
                                            <h5 class="media-heading">A new order has been placed A new
                                                order has been placed</h5>
                                            <p class="m-0">
                                                <small>There are new settings available</small>
                                            </p>
                                        </div>
                                    </div>
                                </a>

                                <!-- list item-->
                                <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        <div class="pull-left p-r-10">
                                            <em class="fa fa-cog noti-warning"></em>
                                        </div>
                                        <div class="media-body">
                                            <h5 class="media-heading">New settings</h5>
                                            <p class="m-0">
                                                <small>There are new settings available</small>
                                            </p>
                                        </div>
                                    </div>
                                </a>

                                <!-- list item-->
                                <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        <div class="pull-left p-r-10">
                                            <em class="fa fa-bell-o noti-success"></em>
                                        </div>
                                        <div class="media-body">
                                            <h5 class="media-heading">Updates</h5>
                                            <p class="m-0">
                                                <small>There are <span class="text-primary">2</span> new
                                                    updates available
                                                </small>
                                            </p>
                                        </div>
                                    </div>
                                </a>

                            </li>

                            <li>
                                <a href="javascript:void(0);" class=" text-right">
                                    <small><b>See all notifications</b></small>
                                </a>
                            </li>

                        </ul>
                    </li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle waves-effect waves-light profile" data-toggle="dropdown" aria-expanded="true"><img src="../assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> </a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)"><i class="ti-user m-r-5"></i> Profile</a></li>
                            <li><a href="javascript:void(0)"><i class="ti-settings m-r-5"></i> Settings</a></li>
                            <li><a href="javascript:void(0)"><i class="ti-lock m-r-5"></i> Lock screen</a></li>
                            <li><a href="javascript:void(0)"><i class="ti-power-off m-r-5"></i> Logout</a></li>
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
                        <a href="Dash.aspx"><i class="md md-dashboard"></i>Laman Utama</a>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-color-lens"></i>Dashboard</a>
                        <ul class="submenu">
                            <li><a href="utama.aspx">Dashboard Utama</a></li>
                            <li><a href="parlimen_tumpuan.aspx">Dashboard Parlimen Tumpuan</a></li>
                            <li><a href="#">Dashboard Tumpuan BN vs Pembpangkang</a></li>
                            <li><a href="#">Keputusan Pilihan Raya</a></li>
                            <li><a href="#">Ramusan Status Kawasan</a></li>
                            <li><a href="#">Winnable Candidate</a></li>
                            <li><a href="#">Penambahan Pengundi</a></li>
                            <li><a href="#">Peratusan Keluar Mengundi</a></li>
                            <li><a href="#">Peratusan Tahap Sokongan Agensi</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-invert-colors-on"></i>Pra-Pilihanraya</a>
                        <ul class="submenu">
                            <li class="has-submenu">
                                <a href="#">Profil Bakal Calon / Individu</a>
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
                            <li class="has-submenu">
                                <a href="#">Aktiviti Bakal Calon / Individu</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
                            </li>
                            <li class="has-submenu">
                                <a href="#">Aktiviti Parti Bertanding</a>
                                <ul class="submenu">
                                    <li><a href="map-google.html"> Tambah</a></li>
                                    <li><a href="map-vector.html"> Paparan</a></li>
                                </ul>
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
                            <li><a href="icons-glyphicons.html">IMport Laporan Harian Dari Negeri</a></li>
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
                            <li><a href="#">Keluar Mengundi</a></li>
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
                        <a href="#"><i class="md md-pages"></i>Analisis Kawasan</a>
                        <ul class="submenu">
                            <li><a href="#">Tambah Analisis Kawasan</a></li>
                            <li><a href="#">Paparan Alalisis Kawasan</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-pages"></i>Tetapan Pentadbir</a>
                        <ul class="submenu">
                            <li><a href="#">Tambah</a></li>
                            <li><a href="#">Paparan</a></li>
                        </ul>
                    </li>
                    <li class="has-submenu">
                        <a href="#"><i class="md md-pages"></i>Pengguna : State Officer</a>
                        <ul class="submenu">
                            <li><a href="#">Maklumat Pengguna state officer</a></li>
                            <li><a href="#">Keluar dari SIS</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- End navigation menu -->
            </div>
        </div>
    </div>
</header>
<!-- End Navigation Bar-->


<!-- =======================
     ===== START PAGE ======
     ======================= -->

<div class="wrapper">
    <div class="container">

        <!-- Page-Title -->
        <div class="row">
            <div class="col-sm-12">
                <h4 class="page-title">Welcome !</h4>
            </div>
        </div>
        <!-- Page-Title -->


        <div class="row">
            <div class="col-sm-6 col-lg-3">
                <div class="widget-simple-chart text-right card-box">
                    <div class="circliful-chart" data-dimension="90" data-text="35%" data-width="5" data-fontsize="14" data-percent="35" data-fgcolor="#5fbeaa" data-bgcolor="#ebeff2"></div>
                    <h3 class="text-success counter">2562</h3>
                    <p class="text-muted text-nowrap">Total Sales today</p>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="widget-simple-chart text-right card-box">
                    <div class="circliful-chart" data-dimension="90" data-text="75%" data-width="5" data-fontsize="14" data-percent="75" data-fgcolor="#3bafda" data-bgcolor="#ebeff2"></div>
                    <h3 class="text-primary counter">5685</h3>
                    <p class="text-muted text-nowrap">Daily visitors</p>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="widget-simple-chart text-right card-box">
                    <div class="circliful-chart" data-dimension="90" data-text="58%" data-width="5" data-fontsize="14" data-percent="58" data-fgcolor="#f76397" data-bgcolor="#ebeff2"></div>
                    <h3 class="text-pink">$ <span class="counter">12480</span></h3>
                    <p class="text-muted text-nowrap">Total Earning</p>
                </div>
            </div>

            <div class="col-sm-6 col-lg-3">
                <div class="widget-simple-chart text-right card-box">
                    <div class="circliful-chart" data-dimension="90" data-text="49%" data-width="5" data-fontsize="14" data-percent="49" data-fgcolor="#98a6ad" data-bgcolor="#ebeff2"></div>
                    <h3 class="text-inverse counter">62</h3>
                    <p class="text-muted text-nowrap">Pending Orders</p>
                </div>
            </div>
        </div>
        <!-- end row -->




        <div class="row">
            <div class="col-lg-4">
                <div class="card-box">
                    <h4 class="text-dark  header-title m-t-0 m-b-30">Total Revenue</h4>

                    <div class="widget-chart text-center">
                        <div id="sparkline1"></div>
                        <ul class="list-inline m-t-15">
                            <li>
                                <h5 class="text-muted m-t-20">Target</h5>
                                <h4 class="m-b-0">$1000</h4>
                            </li>
                            <li>
                                <h5 class="text-muted m-t-20">Last week</h5>
                                <h4 class="m-b-0">$523</h4>
                            </li>
                            <li>
                                <h5 class="text-muted m-t-20">Last Month</h5>
                                <h4 class="m-b-0">$965</h4>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="col-lg-4">
                <div class="card-box">
                    <h4 class="text-dark  header-title m-t-0 m-b-30">Yearly Sales Report</h4>

                    <div class="widget-chart text-center">
                        <div id="sparkline2"></div>
                        <ul class="list-inline m-t-15">
                            <li>
                                <h5 class="text-muted m-t-20">Target</h5>
                                <h4 class="m-b-0">$1000</h4>
                            </li>
                            <li>
                                <h5 class="text-muted m-t-20">Last week</h5>
                                <h4 class="m-b-0">$523</h4>
                            </li>
                            <li>
                                <h5 class="text-muted m-t-20">Last Month</h5>
                                <h4 class="m-b-0">$965</h4>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="col-lg-4">
                <div class="card-box">
                    <h4 class="text-dark header-title m-t-0 m-b-30">Weekly Sales Report</h4>

                    <div class="widget-chart text-center">
                        <div id="sparkline3"></div>
                        <ul class="list-inline m-t-15">
                            <li>
                                <h5 class="text-muted m-t-20">Target</h5>
                                <h4 class="m-b-0">$1000</h4>
                            </li>
                            <li>
                                <h5 class="text-muted m-t-20">Last week</h5>
                                <h4 class="m-b-0">$523</h4>
                            </li>
                            <li>
                                <h5 class="text-muted m-t-20">Last Month</h5>
                                <h4 class="m-b-0">$965</h4>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

        </div>
        <!-- end row -->



        <div class="row">
            <div class="col-lg-6">
                <div class="card-box">
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="row">
                                <div class="col-xs-6 text-center">
                                    <canvas id="partly-cloudy-day" width="100" height="100"></canvas>
                                </div>
                                <div class="col-xs-6">
                                    <h2 class="m-t-0 text-muted"><b>32°</b></h2>
                                    <p class="text-muted">Partly cloudy</p>
                                    <p class="text-muted">15km/h - 37%</p>
                                </div>
                            </div><!-- End row -->
                        </div>
                        <div class="col-sm-5">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <h4 class="text-muted m-t-0">SAT</h4>
                                    <canvas id="cloudy" width="35" height="35"></canvas>
                                    <h4 class="text-muted">30<i class="wi wi-degrees"></i></h4>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <h4 class="text-muted m-t-0">SUN</h4>
                                    <canvas id="wind" width="35" height="35"></canvas>
                                    <h4 class="text-muted">28<i class="wi wi-degrees"></i></h4>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <h4 class="text-muted m-t-0">MON</h4>
                                    <canvas id="clear-day" width="35" height="35"></canvas>
                                    <h4 class="text-muted">33<i class="wi wi-degrees"></i></h4>
                                </div>
                            </div><!-- end row -->
                        </div>
                    </div><!-- end row -->
                </div>
            </div> <!-- end col -->

            <div class="col-lg-6">
                <div class="card-box">
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="">
                                <div class="row">
                                    <div class="col-xs-6 text-center">
                                        <canvas id="snow" width="100" height="100"></canvas>
                                    </div>
                                    <div class="col-xs-6">
                                        <h2 class="m-t-0 text-muted"><b> 23°</b></h2>
                                        <p class="text-muted">Partly cloudy</p>
                                        <p class="text-muted">15km/h - 37%</p>
                                    </div>
                                </div><!-- end row -->
                            </div><!-- weather-widget -->
                        </div>
                        <div class="col-sm-5">
                            <div class="row">
                                <div class="col-xs-4 text-center">
                                    <h4 class="text-muted m-t-0">SAT</h4>
                                    <canvas id="sleet" width="35" height="35"></canvas>
                                    <h4 class="text-muted">30<i class="wi wi-degrees"></i></h4>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <h4 class="text-muted m-t-0">SUN</h4>
                                    <canvas id="fog" width="35" height="35"></canvas>
                                    <h4 class="text-muted">28<i class="wi wi-degrees"></i></h4>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <h4 class="text-muted m-t-0">MON</h4>
                                    <canvas id="partly-cloudy-night" width="35" height="35"></canvas>
                                    <h4 class="text-muted">33<i class="wi wi-degrees"></i></h4>
                                </div>
                            </div><!-- End row -->
                        </div> <!-- col-->
                    </div><!-- End row -->
                </div>
            </div> <!-- end col -->
        </div>
        <!--end row/ WEATHER -->



        <div class="row">
            <div class="col-lg-8">
                <div class="card-box">
                    <h4 class="text-dark  header-title m-t-0">Latest Projects</h4>
                    <p class="text-muted m-b-25 font-13">
                        Your awesome text goes here.
                    </p>

                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Project Name</th>
                                <th>Start Date</th>
                                <th>Due Date</th>
                                <th>Status</th>
                                <th>Assign</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Minton Admin v1</td>
                                <td>01/01/2016</td>
                                <td>26/04/2016</td>
                                <td><span class="label label-info">Released</span></td>
                                <td>Coderthemes</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Minton Frontend v1</td>
                                <td>01/01/2016</td>
                                <td>26/04/2016</td>
                                <td><span class="label label-success">Released</span></td>
                                <td>Minton admin</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Minton Admin v1.1</td>
                                <td>01/05/2016</td>
                                <td>10/05/2016</td>
                                <td><span class="label label-pink">Pending</span></td>
                                <td>Coderthemes</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>Minton Frontend v1.1</td>
                                <td>01/01/2016</td>
                                <td>31/05/2016</td>
                                <td><span class="label label-purple">Work in Progress</span>
                                </td>
                                <td>Minton admin</td>
                            </tr>
                            <tr>
                                <td>5</td>
                                <td>Minton Admin v1.3</td>
                                <td>01/01/2016</td>
                                <td>31/05/2016</td>
                                <td><span class="label label-warning">Coming soon</span></td>
                                <td>Coderthemes</td>
                            </tr>

                            <tr>
                                <td>6</td>
                                <td>Minton Admin v1.3</td>
                                <td>01/01/2016</td>
                                <td>31/05/2016</td>
                                <td><span class="label label-primary">Coming soon</span></td>
                                <td>Minton admin</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- end col -8 -->

            <div class="col-lg-4">
                <div class="card-box widget-user">
                    <div>
                        <img src="assets/images/users/avatar-1.jpg" class="img-responsive img-circle" alt="user">
                        <div class="wid-u-info">
                            <h4 class="m-t-0 m-b-5">Chadengle</h4>
                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                            <small class="text-warning"><b>Admin</b></small>
                        </div>
                    </div>
                </div>

                <div class="card-box widget-user">
                    <div>
                        <img src="assets/images/users/avatar-2.jpg" class="img-responsive img-circle" alt="user">
                        <div class="wid-u-info">
                            <h4 class="m-t-0 m-b-5">Tomaslau</h4>
                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                            <small class="text-success"><b>User</b></small>
                        </div>
                    </div>
                </div>

                <div class="card-box widget-user">
                    <div>
                        <img src="assets/images/users/avatar-7.jpg" class="img-responsive img-circle" alt="user">
                        <div class="wid-u-info">
                            <h4 class="m-t-0 m-b-5">Ok</h4>
                            <p class="text-muted m-b-5 font-13">coderthemes@gmail.com</p>
                            <small class="text-pink"><b>Admin</b></small>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- end row -->




        <!-- Footer -->
        <footer class="footer text-right">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        2016 © Minton.
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

    </div> <!-- end container -->
</div>
<!-- End wrapper -->



<!-- jQuery  -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/detect.js"></script>
<script src="../assets/js/fastclick.js"></script>
<script src="../assets/js/jquery.blockUI.js"></script>
<script src="../assets/js/waves.js"></script>
<script src="../assets/js/wow.min.js"></script>
<script src="../assets/js/jquery.nicescroll.js"></script>
<script src="../assets/js/jquery.scrollTo.min.js"></script>

<!-- Counter Up  -->
<script src="../assets/plugins/waypoints/lib/jquery.waypoints.js"></script>
<script src="../assets/plugins/counterup/jquery.counterup.min.js"></script>

<!-- circliful Chart -->
<script src="../assets/plugins/jquery-circliful/js/jquery.circliful.min.js"></script>
<script src="../assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>

<!-- skycons -->
<script src="../assets/plugins/skyicons/skycons.min.js" type="text/javascript"></script>

<!-- Page js  -->
<script src="../assets/pages/jquery.dashboard.js"></script>

<!-- Custom main Js -->
<script src="../assets/js/jquery.core.js"></script>
<script src="../assets/js/jquery.app.js"></script>


<script type="text/javascript">
    jQuery(document).ready(function($) {
        $('.counter').counterUp({
            delay: 100,
            time: 1200
        });
        $('.circliful-chart').circliful();
    });

    /* BEGIN SVG WEATHER ICON */
    if (typeof Skycons !== 'undefined'){
        var icons = new Skycons(
            {"color": "#3bafda"},
            {"resizeClear": true}
            ),
            list  = [
                "clear-day", "clear-night", "partly-cloudy-day",
                "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                "fog"
            ],
            i;

        for(i = list.length; i--; )
            icons.set(list[i], list[i]);
        icons.play();
    };

</script>
    </form>
</body>
</html>
