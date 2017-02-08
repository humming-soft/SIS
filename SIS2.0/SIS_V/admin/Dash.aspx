<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dash.aspx.cs" Inherits="SIS_V.admin.Dash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <title>SIS</title>
    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/dashboard/widget.css" rel="stylesheet" type="text/css" />
    <link href="../assets/css/dashboard/typography.css" rel="stylesheet"/>
    <link href="../assets/css/dashboard/style.css" rel="stylesheet"/>
    <link href="../assets/css/dashboard/color.css" rel="stylesheet"/>
    <link href="../assets/css/core_sn.css" rel="stylesheet"/>
    <link href="../assets/css/dashboard/responsive.css" rel="stylesheet"/>
</head>
<body>
<!--Kode Wrapper Start-->
<div class="kode_wrapper">

    <!--Header Wrap Start-->
    <header>

        <!--Top Strip Wrap Start-->
        <div class="kode_navigation_outr_wrap">
            <div class="container">
                <div class="kode_logo">
                    <a href="index.html">
                        <img src="../assets/images/logo.png" alt="Logo Image Here"/>
                    </a>
                </div>
                <div class="kode_ui_element">
                    <div class="kode_menu">
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!--Header Wrap Start-->


    <!--Bread Crumb Wrap Start-->
    <div class="kode_about_bg">
        <div class="container">
            <div class="kode_aboutus_wrap">
            </div>
        </div>
    </div>
    <!--Bread Crumb Wrap Start-->



    <!--Content Wrap Start-->
    <div class="kode_content">

        <!--Comming Soon Wrap Start-->
        <section class="kf_comming_bg">
            <div class="container">
                <div class="kf_comming_wrap">
                    <a href="#"><img src="images/demo_logo.png" alt="Image Here"/></a>
                </div>
                <div class="kf_comming_counter">
                    <h2>Strategic Information System</h2>
                    <h4>State Officer</h4>
                    <ul class="countdown">
                        <li><a href="utama.aspx">
<!--                            <span class="days"><small>Dashboard Utama</small></span>-->
                            <p class="days_ref">Dashboard Utama</p></a>
                        </li>
                        <li><a href="parlimen_tumpuan.aspx">
<!--                            <span class="hours">00</span>-->
                            <p class="hours_ref">Dashboard Parlimen Tumpuan</p></a>
                        </li>
                        <li><a href="#">
<!--                            <span class="minutes">00</span>-->
                            <p class="minutes_ref">Ramusan Status Kawasan</p></a>
                        </li>
                        <li><a href="#">
<!--                            <span class="seconds last">00</span>-->
                            <p class="seconds_ref">Calon Bertanding</p></a>
                        </li>
                    </ul>
                    <ul class="countdown m-t-25">
                        <li><a href="#">
<!--                            <span class="days">00</span>-->
                            <p class="days_ref">Dafthar Pamilih</p></a>
                        </li>
                        <li><a href="#">
<!--                            <span class="hours">00</span>-->
                            <p class="hours_ref">Crytal Report</p></a>
                        </li>
                        <li><a href="#">
<!--                            <span class="minutes">00</span>-->
                            <p class="minutes_ref">Keputusan Pilihanriya</p></a>
                        </li>
                        <li><a href="#">
<!--                            <span class="seconds last">00</span>-->
                            <p class="seconds_ref">Second</p></a>
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
                <div class="kode_newsletter_form">
                        <form id="form1" runat="server">
                            <asp:TextBox ID="txtsearch" CssClass="placeholder2" placeholder="Need to remove" runat="server" ReadOnly="true"></asp:TextBox>
                    </form>
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
    <script type="text/javascript">
        $(document).ready(function () {
            get_date(); // to show current date
            get_time(); // to show timer
        });
    </script>
    <script type="text/javascript">
        function get_date()
        {
            var today = moment(new Date()).format("DD MMM YYYY");
            $('#dt').text(today);
        }
    </script>
    <script type="text/javascript">
        function get_time()
        {
            function checkTime(i) {
                return (i < 10) ? "0" + i : i;
            }

            function Timer() {
                var hr,D;
                var today = new Date(),
                    h = checkTime(today.getHours()),
                    m = checkTime(today.getMinutes()),
                    s = checkTime(today.getSeconds());
                if (h == 00)
                {
                    hr = 12;
                    D = ' AM';
                }
                else if(h > 0 && h <=11)
                {
                    hr = h;
                    D = ' AM';
                }
                else if (h > 12 && h <= 23)
                {
                    hr = h - 12;
                    D = ' PM';
                }
                else
                {
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
