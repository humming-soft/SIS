﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="utama.aspx.cs" Inherits="SIS_V.admin.utama" MasterPageFile="~/admin/Master_Admin.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-3 col-lg-1">
            <div class="widget-simple-chart text-right card-box">
                <h4 class="text-dark  header-title m-t-0 m-b-30 ta-center">Status</h4>
                <h3 class="text-success portlet-status counter status-white">103</h3>
                <h3 class="text-warning portlet-status counter status-gray">39</h3>
                <h3 class="text-info portlet-status counter status-black">80</h3>
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
                        </div>
                        <!-- End row -->
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
                        </div>
                        <!-- end row -->
                    </div>
                </div>
                <!-- end row -->
            </div>
        </div>
        <!-- end col -->

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
                                    <h2 class="m-t-0 text-muted"><b>23°</b></h2>
                                    <p class="text-muted">Partly cloudy</p>
                                    <p class="text-muted">15km/h - 37%</p>
                                </div>
                            </div>
                            <!-- end row -->
                        </div>
                        <!-- weather-widget -->
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
                        </div>
                        <!-- End row -->
                    </div>
                    <!-- col-->
                </div>
                <!-- End row -->
            </div>
        </div>
        <!-- end col -->
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
</asp:Content>
