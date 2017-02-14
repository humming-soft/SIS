<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SIS_V.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="html-login">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc." />
    <meta name="author" content="Coderthemes" />

    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicon/apple-icon-57x57.png" />
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicon/apple-icon-60x60.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicon/apple-icon-72x72.png" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicon/apple-icon-76x76.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicon/apple-icon-114x114.png" />
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicon/apple-icon-120x120.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicon/apple-icon-144x144.png" />
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicon/apple-icon-152x152.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicon/apple-icon-180x180.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicon/android-icon-192x192.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicon/favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicon/favicon-96x96.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon/favicon-16x16.png" />
    <link rel="manifest" href="assets/images/favicon/manifest.json" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="assets/images/favicon/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />

    <title>SIS - Login</title>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/menu.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/core_sn.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />


    <script src="assets/js/modernizr.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="body-login">
    <header>
        <div class="kode_navigation_outr_wrap">
            <div class="container" style="width: 60%;">
                <div class="kode_logo">
                    <a href="#">
                        <img src="assets/images/logo/logo_5.png" alt="Logo Image Here" />
                    </a>
                </div>
                <div class="kode_ui_element">
                    <div class="kode_ui_element">
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="wrapper-page login-md">

        <div class="text-center">
            <img src="assets/images/logojatanegara_small.png" alt="Jata Negara" class="image image-jata-negara" />
            <p class="head-jata-negara">Majlis Keselamatan Negara</p>
            <a href="index-2.html" class="logo logo-lg"><span>Stategic Information System</span> </a>
        </div>
        <form id="form1" runat="server" class="form-horizontal m-t-20">
            <div class="section">
                <h4>Sign in to your account</h4>
                <p>Please enter your <code>username</code> and <code>password</code> to log in.</p>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <asp:TextBox ID="txtuname" CssClass="form-control" placeholder="Username" runat="server"></asp:TextBox>
                    <i class="md md-account-circle form-control-feedback l-h-34"></i>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12">
                    <asp:TextBox ID="txtpassword" CssClass="form-control" placeholder="Password" runat="server" TextMode="Password"></asp:TextBox>
                    <i class="md md-vpn-key form-control-feedback l-h-34"></i>
                </div>
            </div>
            <div class="form-group text-right m-t-40">
                <div class="col-xs-12">
                    <asp:Button ID="btnlogin" CssClass="btn btn-primary w100 btn-custom w-md waves-light" runat="server" Text="Log In" OnClientClick="vali()" OnClick="btnlogin_Click" />
                </div>
            </div>
            <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <p>Please check your <b>username</b> or <b>password</b>!</p>
            </div>
        </form>
    </div>


    <script>
        var resizefunc = [];
    </script>

    <!-- Main  -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/detect.js"></script>
    <script src="assets/js/fastclick.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/jquery.blockUI.js"></script>
    <script src="assets/js/waves.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>

    <!-- Custom main Js -->
    <script src="assets/js/jquery.core.js"></script>
    <script src="assets/js/jquery.app.js"></script>

    <!-- Validation js -->
    <script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
    <script src="assets/js/Validations/custom_login.js"></script>

    <script type="text/javascript">
        function vali() {
            Login.init();
        }
    </script>

</body>
</html>
