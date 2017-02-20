<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="utama.aspx.cs" Inherits="SIS_V.state.utama" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(function () {
            trends_vals();

        });
        //$(function () {
        //    Highcharts.setOptions({
        //        colors: ['#c64136', '#1e5799']
        //    });
        //    Highcharts.chart('gauge', {

        //        chart: {
        //            type: 'gauge',
        //            plotBackgroundColor: null,
        //            plotBackgroundImage: null,
        //            plotBorderWidth: 0,
        //            plotShadow: false
        //        },

        //        title: {
        //            text: ''
        //        },

        //        pane: {
        //            startAngle: -150,
        //            endAngle: 150,
        //            background: [{
        //                backgroundColor: {
        //                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
        //                    stops: [
        //                        [0, '#FFF'],
        //                        [1, '#333']
        //                    ]
        //                },
        //                borderWidth: 0,
        //                outerRadius: '109%'
        //            }, {
        //                backgroundColor: {
        //                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
        //                    stops: [
        //                        [0, '#333'],
        //                        [1, '#FFF']
        //                    ]
        //                },
        //                borderWidth: 1,
        //                outerRadius: '107%'
        //            }, {
        //                // default background
        //            }, {
        //                backgroundColor: '#DDD',
        //                borderWidth: 0,
        //                outerRadius: '105%',
        //                innerRadius: '103%'
        //            }]
        //        },

        //        // the value axis
        //        yAxis: {
        //            min: 0,
        //            max: 200,

        //            minorTickInterval: 'auto',
        //            minorTickWidth: 1,
        //            minorTickLength: 10,
        //            minorTickPosition: 'inside',
        //            minorTickColor: '#666',

        //            tickPixelInterval: 30,
        //            tickWidth: 2,
        //            tickPosition: 'inside',
        //            tickLength: 10,
        //            tickColor: '#666',
        //            labels: {
        //                step: 2,
        //                rotation: 'auto'
        //            },
        //            title: {
        //                text: ''
        //            },
        //            plotBands: [{
        //                from: 0,
        //                to: 100,
        //                color: '#55BF3B' // green
        //            }, {
        //                from: 100,
        //                to: 120,
        //                color: '#DDDF0D' // yellow
        //            }, {
        //                from: 120,
        //                to: 200,
        //                color: '#DF5353' // red
        //            }]
        //        },

        //        series: [{
        //            name: 'Value',
        //            data: [80],
        //            tooltip: {
        //                valueSuffix: ''
        //            }
        //        }]

        //    },
        //        // Add some life
        //        function (chart) {
        //            if (!chart.renderer.forExport) {
        //                setInterval(function () {
        //                    var point = chart.series[0].points[0],
        //                        newVal,
        //                        inc = Math.round((Math.random() - 0.5) * 20);

        //                    newVal = point.y + inc;
        //                    if (newVal < 0 || newVal > 200) {
        //                        newVal = point.y - inc;
        //                    }

        //                    point.update(newVal);

        //                }, 3000);
        //            }
        //        });

        //    Highcharts.chart('stackedp', {
        //        chart: {
        //            type: 'bar'
        //        },
        //        title: {
        //            text: ''
        //        },
        //        xAxis: {
        //            categories: ['Perlis', 'Kedah', 'Kelantan', 'Terengganu', 'Pulau Pinang',
        //                'Perak', 'Pahang', 'Selangor',
        //                'Negeri Sembilan', 'Melaka', 'Johar', 'Sabah', 'Sarawak', 'WP Kuala Lumpur', 'WP Putrajaya', 'WP Kabuan']
        //        },
        //        yAxis: {
        //            min: 0,
        //            max: 100,
        //            title: {
        //                text: ''
        //            }
        //        },
        //        legend: {
        //            reversed: true
        //        },
        //        plotOptions: {
        //            series: {
        //                stacking: 'normal'
        //            }
        //        },
        //        series: [{
        //            name: 'BN',
        //            data: [58, 30, 40, 70, 92, 50, 53, 40, 70, 20, 50, 83, 40, 70, 42, 55, 80]
        //        }, {
        //            name: 'PEMBANGKANG',
        //            data: [42, 70, 60, 30, 8, 50, 47, 60, 30, 80, 50, 17, 60, 30, 58, 45, 20]
        //        }, ]
        //    });
        //    Highcharts.chart('stackedd', {
        //        chart: {
        //            type: 'bar'
        //        },
        //        title: {
        //            text: ''
        //        },
        //        xAxis: {
        //            categories: ['Perlis', 'Kedah', 'Kelantan', 'Terengganu', 'Pulau Pinang',
        //                'Perak', 'Pahang', 'Selangor',
        //                'Negeri Sembilan', 'Melaka', 'Johar', 'Sabah', 'Sarawak', 'WP Kuala Lumpur', 'WP Putrajaya', 'WP Kabuan']
        //        },
        //        yAxis: {
        //            min: 0,
        //            max: 100,
        //            title: {
        //                text: ''
        //            }
        //        },
        //        legend: {
        //            reversed: true
        //        },
        //        plotOptions: {
        //            series: {
        //                stacking: 'normal'
        //            }
        //        },
        //        series: [{
        //            name: 'BN',
        //            data: [58, 30, 40, 70, 92, 50, 53, 40, 70, 20, 50, 83, 40, 70, 42, 55, 80]
        //        }, {
        //            name: 'PEMBANGKANG',
        //            data: [42, 70, 60, 30, 8, 50, 47, 60, 30, 80, 50, 17, 60, 30, 58, 45, 20]
        //        }, ]
        //    });
        //});
    </script>
    <script type="text/javascript">
        function trends_vals() {
            //alert('inside');
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: "{}",
                //url: "utama.aspx/test",
                url:'<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("utama.aspx/test")%>',
                dataType: "json",
                success: function (data) {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-xs-12 col-sm-3 col-md-2 col-lg-1">
            <div class="widget-simple-chart text-right card-box">
                <h4 class="text-dark  header-title m-t-0 ta-center">Status</h4>
                <p class="text-muted m-b-25 font-13 ta-center">
                    Parlimen
                </p>
                <h3 class="text-success portlet-status counter status-white">103</h3>
                <h3 class="text-warning portlet-status counter status-gray">39</h3>
                <h3 class="text-info portlet-status counter status-black">80</h3>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
            <div class="widget-simple-chart text-right card-box">
                <h4 class="text-dark  header-title m-t-0 ta-center">Status</h4>
                <p class="text-muted m-b-25 font-13 ta-center">
                    Dun
                </p>
                <h3 class="text-success portlet-status counter status-white">103</h3>
                <h3 class="text-warning portlet-status counter status-gray">39</h3>
                <h3 class="text-info portlet-status counter status-black">80</h3>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
            <div class="card-box">
                <h4 class="text-dark header-title m-t-0 m-b-30">Parlimen</h4>

                <div class="widget-chart text-center">
                    <div id="gauge"></div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Jumlah Insiden</h4>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="table-responsive">
                            <asp:GridView ID="grdinsident1" CssClass="table" runat="server" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="#" HeaderText="#" />
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Bind("Name") %>' Font-Underline="False" OnClick="LinkButton1_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Num" HeaderText="No. of Incident" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="table-responsive">
                            <asp:GridView ID="grdinsident2" CssClass="table" runat="server" GridLines="None" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="#" HeaderText="#" />
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Bind("Name") %>' Font-Underline="False"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Num" HeaderText="No. of Incidents" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Isu Utama</h4>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>District</th>
                                        <th>Issue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td><a href="<?php echo base_url(); ?>dashboard/perlis">Minton Admin v1</a></td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Minton Front v1</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Minton Admin v1.1</td>
                                        <td>01/05/2016</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Minton Front v1.1</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Minton Admin v1.3</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>District</th>
                                        <th>Issue</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Minton Admin v1</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Minton Front v1</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>Minton Admin v1.1</td>
                                        <td>01/05/2016</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>Minton Front v1.1</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>Minton Admin v1.3</td>
                                        <td>01/01/2016</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end row -->

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Situasi Semasa - Parlimen</h4>
                <div id="stackedp"></div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Situasi Semasa - DUN</h4>
                <div id="stackedd"></div>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
