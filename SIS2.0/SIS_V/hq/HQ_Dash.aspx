﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HQ_Dash.aspx.cs" Inherits="SIS_V.hq.HQ_Dash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="apple-touch-icon" sizes="57x57" href="../assets/images/favicon/apple-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="60x60" href="../assets/images/favicon/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="../assets/images/favicon/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/images/favicon/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="../assets/images/favicon/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="../assets/images/favicon/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="../assets/images/favicon/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="../assets/images/favicon/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="../assets/images/favicon/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="../assets/images/favicon/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../assets/images/favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="../assets/images/favicon/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon/favicon-16x16.png" />
    <link rel="manifest" href="../assets/images/favicon/manifest.json" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="../assets/images/favicon/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />

    <title>SIS</title>
    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/dashboard/widget.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/dashboard/typography.css" rel="stylesheet" />
    <link href="../assets/css/dashboard/style.css" rel="stylesheet" />
    <link href="../assets/css/dashboard/color.css" rel="stylesheet" />
    <link href="../assets/js/dl-menu/component.css" rel="stylesheet" />
    <link href="../assets/css/core_sn.css" rel="stylesheet" />
    <link href="../assets/css/dashboard/responsive.css" rel="stylesheet" />
    <script type="text/javascript">
        //Disables the browser back button
        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
</head>
<body>
    <div class="splash">
        <!-- 			<div class="color-line"></div> -->
        <div class="splash-title">
            <!-- 				<h1>Homer - Responsive Admin Theme</h1> -->
            <!-- 				<p>Special Admin Theme for small and medium webapp with very clean and aesthetic style and feel. </p> -->
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
    <!--Kode Wrapper Start-->
    <div class="kode_wrapper">

        <!--Header Wrap Start-->
        <header>
            <div class="kode_navigation_outr_wrap">
                <div class="container">
                    <div class="kode_logo">
                        <a href="#">
                            <img src="../assets/images/logo/logo_6_1.png" alt="Logo Image Here" />
                        </a>
                    </div>
                    <div class="kode_ui_element">
                        <!--Navigation Wrap Start-->
                        <div class="kode_menu">
                            <ul>
                                <%--<li><a href="Dash.aspx">Laman Utama</a></li>--%>
                                <li><a href="#"><i class="md md-color-lens"></i>Dashboard</a>
                                    <ul>
                                        <li><a href="#"><i class="md md-desktop-windows"></i>Dashboard Utama</a></li>
                                        <li><a href="HQ_ParlimenTumpuan"><i class="md md-details"></i>Parlimen Tumpuan</a></li>
                                        <li><a href="#"><i class="md md-compare"></i>Kawasan Tumpuan BN VS Kawasan Tumpuan Pembangkang</a></li>
                                        <li><a href="#"><i class="md md-find-in-page"></i>Keputusan Pilihanraya</a></li>
                                        <li><a href="#"><i class="md md-place"></i>Rumusan Status Kawasan</a></li>
                                        <li><a href="#"><i class="md md-contacts"></i>Winnable Candidate</a></li>
                                        <li><a href="#"><i class="md md-group"></i>Peratusan Keluar Mengundi</a></li>
                                        <li><a href="#"><i class="md md-assignment-ind"></i>Calon Bertanding</a></li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="md md-poll"></i>Pra-Pilihanraya</a>
                                    <ul>
                                        <li class="has-submenu">
                                            <a href="#"><i class="md md-add-box"></i>Profil Bakal Calon / Individu<i class="md md-chevron-right pull-right"></i></a>
                                            <ul class="submenu">
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-submenu">
                                            <a href="#"><i class="md md-person"></i>Calon Boleh Menang <i class="md md-chevron-right pull-right"></i></a>
                                            <ul>
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                        <li class="has-submenu">
                                            <a href="#"><i class="md md-brightness-auto"></i>Aktiviti Bakal Calon / Individu<i class="md md-chevron-right pull-right"></i></a>
                                            <ul>
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                        <%--<li><a href="activiti_parti_view"><i class="md md-nature-people"></i>Aktiviti Parti Bertanding</a></li>--%>
                                        <li><a href="#"><i class="md md-question-answer"></i>Laporan Harian Negeri <i class="md md-chevron-right pull-right"></i></a>
                                            <ul>
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="#"><i class="md md-stars"></i>Pilihanraya</a>
                                    <ul>
                                        <li class="has-submenu">
                                            <a href="#"><i class="md md-find-in-page"></i>Keputusan Pilihanraya <i class="md md-chevron-right pull-right"></i></a>
                                            <ul class="submenu">
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-add"></i>Kemaskini</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><i class="md md-poll"></i>Keluar Mengundi</a></li>
                                    </ul>
                                </li>
                                <%--                                <li><a href="analisis_kawasan_view"><i class="md md-place"></i> Analisis Kawasan</a></li>--%>
                                <li><a href="#"><i class="md md-settings"></i>Tetapan</a>
                                    <ul>
                                        <li><a href="#"><i class="md md-info"></i>Parlimen Info</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <%-- <a href="tetapan_pentadbir_view.aspx">Tetapan Pentadbir</a>--%>

                                </li>
                            </ul>
                        </div>
                        <!--Navigation Wrap End-->
                        <!--DL Menu Start-->
                        <div id="kode-responsive-navigation" class="dl-menuwrapper">
                            <button class="dl-trigger">Open Menu</button>
                            <ul class="dl-menu">
                                <li class="menu-item kode-parent-menu"><a href="#"><i class="md md-color-lens"></i>Dashboard</a>
                                    <ul class="dl-submenu">
                                        <li><a href="#"><i class="md md-desktop-windows"></i>Dashboard Utama</a></li>
                                        <li><a href="HQ_ParlimenTumpuan"><i class="md md-details"></i>Parlimen Tumpuan</a></li>
                                        <li><a href="#"><i class="md md-compare"></i>Kawasan Tumpuan BN VS Kawasan Tumpuan Pembangkang</a></li>
                                        <li><a href="#"><i class="md md-place"></i>Rumusan Status Kawasan</a></li>
                                        <li><a href="#"><i class="md md-contacts"></i>Winnable Candidate</a></li>
                                        <li><a href="#"><i class="md md-group"></i>Peratusan Keluar Mengundi</a></li>
                                        <li><a href="#"><i class="md md-assignment-ind"></i>Calon Bertanding</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item kode-parent-menu"><a href="#"><i class="md md-poll"></i>Pra-Pilihanraya</a>
                                    <ul class="dl-submenu">
                                        <li><a href="#"><i class="md md-add-box"></i>Profil Bakal Calon / Individu</a>
                                            <ul class="dl-submenu">
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#"><i class="md md-brightness-auto"></i>Aktiviti Bakal Calon / Individu</a>
                                            <ul class="dl-submenu">
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                        <%-- <li><a href="activiti_parti_view"><i class="md md-nature-people"></i>Aktiviti Parti Bertanding</a></li>--%>
                                        <li><a href="#"><i class="md md-question-answer"></i>Laporan Harian Negeri</a>
                                            <ul class="dl-submenu">
                                                <li><a href="#"><i class="md md-add-circle-outline"></i>Tambah</a></li>
                                                <li><a href="#"><i class="md md-search"></i>Paparan</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item kode-parent-menu"><a href="#"><i class="md md-stars"></i>Pilihanraya</a>
                                    <ul class="dl-submenu">
                                        <li><a href="#"><i class="md md-poll"></i>Keluar Mengundi</a></li>
                                    </ul>
                                </li>
                                <%--                                <li><a href="analisis_kawasan_view"><i class="md md-place"></i> Analisis Kawasan</a></li>--%>
                                <li class="menu-item kode-parent-menu"><a href="#"><i class="md md-settings"></i>Tetapan</a>
                                    <ul class="dl-submenu">
                                        <li><a href="#"><i class="md md-info"></i>Parlimen Info</a></li>
                                    </ul>
                                </li>
                                <%--  <li><a href="tetapan_pentadbir_view.aspx">Tetapan Pentadbir</a></li>--%>
                            </ul>
                        </div>
                        <!--DL Menu End-->
                    </div>
                </div>
            </div>
        </header>
        <!--Content Wrap Start-->
        <div class="kode_content">

            <!--Comming Soon Wrap Start-->
            <section class="kf_comming_bg">
                <div class="container">
                    <div class="kf_comming_counter">
                        <h2>Strategic Information System</h2>
                        <h4>Headquarters</h4>
                        <ul class="countdown">
                            <li>
                                <img src="../assets/images/gallery/001_d.png" alt="Logo Image Here" />
                                <a href="#">

                                    <p class="days_ref">Dashboard Utama</p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/002_d.png" alt="Logo Image Here" />
                                <a href="HQ_ParlimenTumpuan">
                                    <p class="days_ref">
                                        Parlimen
                                        <br />
                                        Tumpuan
                                    </p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/006_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="days_ref">
                                        Parlimen Tumpuan BN VS Pembangkang
                                    </p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/003_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="minutes_ref">Rumusan Status Kawasan</p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/007_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="seconds_ref">Winnable Candidate</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="countdown m-t-25">
                            <li>
                                <img src="../assets/images/gallery/004_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="seconds_ref">Calon Bertanding</p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/005_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="days_ref b35">
                                        Peratusan
                                        <br />
                                        Keluar Mengundi
                                    </p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/008_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="minutes_ref b35">Keputusan Pilihanraya </p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/009_d.png" alt="Logo Image Here" />
                                <a href="../Logout">
                                    <p class="hours_ref">
                                        Keluar
                                        <br>
                                        dari SIS
                                    </p>
                                </a>
                            </li>
                        </ul>
                    </div>

                </div>
            </section>
            <!--Comming Soon Wrap Start-->

        </div>
        <!--Content Wrap End-->


        <!--Footer Wrap Start-->
        <footer>
            <div class="kode_newsletter_bg">
                <div class="container">
                    <div class="kode_newsletter_des">
                        <h5 id="tm"></h5>
                        <h3 id="dt"></h3>
                    </div>
                    <div class="kode_newsletter_form kode-cud">
                    </div>
                </div>
            </div>
        </footer>
        <!--Footer Wrap End-->
    </div>
    <!--Kode Wrapper End-->

    <!--Bootstrap core JavaScript-->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/plugins/moment/moment.js"></script>
    <script src="../assets/js/dl-menu/modernizr.custom.js"></script>
    <script src="../assets/js/dl-menu/jquery.dlmenu.js"></script>
    <script src="../assets/js/core_sn.js"></script>

    <!-- Timeout -->
    <script src="../assets/plugins/timeout/session_timeout.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            get_date(); // to show current date
            get_time(); // to show timer

            "use strict";
            if (typeof ($.fn.dlmenu) == 'function') {
                $('#kode-responsive-navigation').each(function () {
                    $(this).find('.dl-submenu').each(function () {
                        if ($(this).siblings('a').attr('href') && $(this).siblings('a').attr('href') != '#') {
                            var parent_nav = $('<li class="menu-item kode-parent-menu"></li>');
                            parent_nav.append($(this).siblings('a').clone());

                            $(this).prepend(parent_nav);
                        }
                    });
                    $(this).dlmenu();
                });
            }
        });
    </script>
    <script type="text/javascript">
        function get_date() {
            var today = moment(new Date()).format("DD MMM YYYY");
            $('#dt').text(today);
        }
    </script>
    <script type="text/javascript">
        function get_time() {
            function checkTime(i) {
                return (i < 10) ? "0" + i : i;
            }

            function Timer() {
                var hr, D;
                var today = new Date(),
                    h = checkTime(today.getHours()),
                    m = checkTime(today.getMinutes()),
                    s = checkTime(today.getSeconds());
                if (h == 00) {
                    hr = 12;
                    D = ' AM';
                }
                else if (h > 0 && h <= 11) {
                    hr = h;
                    D = ' AM';
                }
                else if (h > 12 && h <= 23) {
                    hr = h - 12;
                    if (hr < 10) {
                        hr = "0" + hr;
                    }
                    else {
                        hr = h - 12;
                    }
                    D = ' PM';
                }
                else {
                    hr = 12;
                    D = ' PM';
                }
                $('#tm').text(hr + ":" + m + ":" + s + D);
                t = setTimeout(function () {
                    Timer()
                }, 500);
            }
            Timer();
        }
    </script>
</body>
</html>
