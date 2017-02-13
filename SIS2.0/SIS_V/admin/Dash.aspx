<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash.aspx.cs" Inherits="SIS_V.admin.Dash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

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
</head>
<body>
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
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Event</a>
                                    <ul>
                                        <li><a href="#">Event Grid</a></li>
                                        <li><a href="event-detail.html">Event Detail</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Press Release</a></li>
                                <li><a href="#">News</a>
                                    <ul>
                                        <li><a href="#">News Grid</a></li>
                                        <li><a href="#">News List</a></li>
                                        <li><a href="#">News Detail</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Team</a>
                                    <ul>
                                        <li><a href="#">team Grid</a></li>
                                        <li><a href="#">team Detail</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Pages</a>
                                    <ul>
                                        <li><a href="#">Services</a></li>
                                        <li><a href="#">404</a></li>
                                        <li><a href="#">Comming soon</a></li>
                                        <li><a href="#">ShortCode</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Contact Us</a></li>
                            </ul>
                        </div>
                        <!--Navigation Wrap End-->
                        <!--DL Menu Start-->
                        <div id="kode-responsive-navigation" class="dl-menuwrapper">
                            <button class="dl-trigger">Open Menu</button>
                            <ul class="dl-menu">
                                <li class="active"><a href="index.html">Home</a></li>
                                <li><a href="about-us.html">About</a></li>
                                <li class="menu-item kode-parent-menu"><a href="#">Event</a>
                                    <ul class="dl-submenu">
                                        <li><a href="event.html">Event Grid</a></li>
                                        <li><a href="event-detail.html">Event Detail</a></li>
                                    </ul>
                                </li>
                                <li><a href="press-release.html">Press Release</a></li>
                                <li class="menu-item kode-parent-menu"><a href="#">News</a>
                                    <ul class="dl-submenu">
                                        <li><a href="news.html">News Grid</a></li>
                                        <li><a href="news-list.html">News List</a></li>
                                        <li><a href="news-detail.html">News Detail</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item kode-parent-menu"><a href="#">Team</a>
                                    <ul class="dl-submenu">
                                        <li><a href="team.html">team Grid</a></li>
                                        <li><a href="team-detail.html">team Detail</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item kode-parent-menu"><a href="#">Pages</a>
                                    <ul class="dl-submenu">
                                        <li><a href="services.html">Services</a></li>
                                        <li><a href="404.html">404</a></li>
                                        <li><a href="comming-soon.html">Comming soon</a></li>
                                        <li><a href="shortcode.html">ShortCode</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact-us.html">Contact Us</a></li>
                            </ul>
                        </div>
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
                        <h4>State Officer</h4>
                        <ul class="countdown">
                            <li>
                                <img src="../assets/images/gallery/001_d.png" alt="Logo Image Here" />
                                <a href="utama.aspx">

                                    <p class="days_ref">Dashboard Utama</p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/002_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="hours_ref b15">Dashboard Parlimen Tumpuan</p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/003_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="minutes_ref">Ramusan Status Kawasan</p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/004_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="seconds_ref">Calon Bertanding</p>
                                </a>
                            </li>
                        </ul>
                        <ul class="countdown m-t-25">
                            <li>
                                <img src="../assets/images/gallery/005_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="days_ref b35">
                                        Daftar  
                                        <br>
                                        Pamilih
                                    </p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/007_d.png" alt="Logo Image Here" />
                                <a href="#">
                                    <p class="minutes_ref b35">Keputusan Pilihanriya </p>
                                </a>
                            </li>
                            <li>
                                <img src="../assets/images/gallery/009_d.png" alt="Logo Image Here" />
                                <a href="../Login.aspx">
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
