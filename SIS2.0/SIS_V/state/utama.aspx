<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="utama.aspx.cs" Inherits="SIS_V.state.utama" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(function () {
            parlimen();
            dun();
            Highcharts.setOptions({
                colors: ['#c64136', '#1e5799']
            });
            situasi_parlimen()
            situasi_dun();
        });
    </script>
    <script type="text/javascript">
        function parlimen() {
            var data = {};
            var sid = '<%= Session["state"] %>';
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"sid":"' + sid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("utama.aspx/parlimen")%>',
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        if (data.d[i].Color_code == 1) {
                            $('#black').html(data.d[i].Color_Value);
                        }
                        else if (data.d[i].Color_code == 2) {
                            $('#grey').text(data.d[i].Color_Value);
                        }
                        else if (data.d[i].Color_code == 3) {
                            $('#white').text(data.d[i].Color_Value);
                        }
                        else {
                            console.log('Unused Value');
                        }

                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(errorThrown);
                }
            });
        }
    </script>
    <script type="text/javascript">

        function guage(total, vals) {
            var fty = 0, tn = 0, frty = 0;
            frty = (total * 40) / 100;
            tn = frty + (total * 10) / 100;
            fty = tn + (total * 50) / 100;
            //console.log(fty + '---' + frty + '---' + tn);
            Highcharts.chart('gauge', {

                chart: {
                    type: 'gauge',
                    plotBackgroundColor: null,
                    plotBackgroundImage: null,
                    plotBorderWidth: 0,
                    plotShadow: false
                },

                title: {
                    text: ''
                },

                pane: {
                    startAngle: -150,
                    endAngle: 150,
                    background: [{
                        backgroundColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [
                                [0, '#FFF'],
                                [1, '#333']
                            ]
                        },
                        borderWidth: 0,
                        outerRadius: '109%'
                    }, {
                        backgroundColor: {
                            linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                            stops: [
                                [0, '#333'],
                                [1, '#FFF']
                            ]
                        },
                        borderWidth: 1,
                        outerRadius: '107%'
                    }, {
                        // default background
                    }, {
                        backgroundColor: '#DDD',
                        borderWidth: 0,
                        outerRadius: '105%',
                        innerRadius: '103%'
                    }]
                },

                // the value axis
                yAxis: {
                    min: 0,
                    max: total,

                    minorTickInterval: 'auto',
                    minorTickWidth: 1,
                    minorTickLength: 10,
                    minorTickPosition: 'inside',
                    minorTickColor: '#666',

                    tickPixelInterval: 30,
                    tickWidth: 2,
                    tickPosition: 'inside',
                    tickLength: 10,
                    tickColor: '#666',
                    labels: {
                        step: 2,
                        rotation: 'auto'
                    },
                    title: {
                        text: ''
                    },
                    plotBands: [{
                        from: 0,
                        to: frty,          //40 % of total
                        color: '#DF5353' // red
                    }, {
                        from: frty,
                        to: tn,            //10 % of total
                        color: '#DDDF0D' // yellow
                    }, {
                        from: tn,
                        to: total,        //50 % of total
                        color: '#55BF3B' // green
                    }]
                },

                series: [{
                    name: 'Value',
                    data: [vals],
                    tooltip: {
                        valueSuffix: ''
                    }
                }]

            });
        }
    </script>
    <script type="text/javascript">
        function dun() {
            var total = 0, vals = 0;
            var data = {};
            var sid = '<%= Session["state"] %>';
            //alert(sid);
            $.ajax({
                type: "POST",
                contentType: "application/json",
                data: '{"sid":"' + sid + '"}',
                url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("utama.aspx/dun")%>',
                dataType: "json",
                success: function (data) {
                    for (var i = 0; i < data.d.length; i++) {
                        total = total + parseInt(data.d[i].Color_Value);
                        if (data.d[i].Color_code == 1) {
                            $('#blackd').html(data.d[i].Color_Value);
                        }
                        else if (data.d[i].Color_code == 2) {
                            $('#greyd').text(data.d[i].Color_Value);
                        }
                        else if (data.d[i].Color_code == 3) {
                            $('#whited').text(data.d[i].Color_Value);
                            vals = vals + parseInt(data.d[i].Color_Value);
                        }
                        else {
                            console.log('Unused Value');
                        }

                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    console.log(errorThrown);
                },
                complete: function (data) {
                    guage(total, vals);
                }
            });
        }

    </script>
    <script type="text/javascript">
        function parlimen_chart(cat, bn, pm) {
            Highcharts.chart('stackedp', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: ''
                },
                xAxis: {
                    categories: cat
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify',
                        enabled: false
                    }
                },
                legend: {
                    reversed: true
                },
                plotOptions: {
                    series: {
                        stacking: 'normal'
                    }
                },
                series: [{
                    maxPointWidth: 20,
                    name: 'PEMBANGKANG',
                    data: pm
                }, {
                    maxPointWidth: 20,
                    name: 'BN',
                    data: bn
                }, ]
            });
        }
    </script>
    <script type="text/javascript">
        function situasi_parlimen() {
            try {
                var pms1 = 0, pms2 = 0, pmst = 0, cat = [], bn = [], pm = [];
                var data = {};
                var sid = '<%= Session["state"] %>';
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"sid":"' + sid + '","aid":"' + 1 + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("utama.aspx/situasi")%>',
                    dataType: "json",
                    success: function (data) {
                        cat.push(data.d[0].State);
                        for (var i = 0; i < data.d.length; i++) {
                            if (data.d[i].Color_Code == 1) { // black
                                pms1 = pms1 + parseInt(data.d[i].Color_Value);
                            }
                            else if (data.d[i].Color_Code == 2) { // grey
                                pms2 = pms2 + parseInt(data.d[i].Color_Value);
                            }
                            else if (data.d[i].Color_Code == 3) { // white
                                bn.push(data.d[i].Color_Value);
                            }
                            else {
                                console.log('Unused Value');
                            }
                        }
                        pmst = pms1 + pms2;
                        pm.push(pmst);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                    },
                    complete: function (data) {
                        parlimen_chart(cat, bn, pm);
                    }
                });
            }
            catch (err) {
                console.log(err.message);
            }
        }
    </script>
    <script type="text/javascript">
        function dun_chart(cat1, bn1, pm1) {
            Highcharts.chart('stackedd', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: ''
                },
                xAxis: {
                    categories: cat1
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '',
                        align: 'high'
                    },
                    labels: {
                        overflow: 'justify',
                        enabled: false
                    }
                },
                legend: {
                    reversed: true
                },
                plotOptions: {
                    series: {
                        stacking: 'normal'
                    }
                },
                series: [{
                    maxPointWidth: 20,
                    name: 'PEMBANGKANG',
                    data: pm1
                }, {
                    maxPointWidth: 20,
                    name: 'BN',
                    data: bn1
                }, ]
            });
        }
    </script>
    <script type="text/javascript">
        function situasi_dun() {
            try {
                var pms8 = 0, pms9 = 0, pmst1 = 0, cat1 = [], bn1 = [], pm1 = [];
                var data = {};
                var sid = '<%= Session["state"] %>';
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    data: '{"sid":"' + sid + '","aid":"' + 2 + '"}',
                    url: '<%=Microsoft.AspNet.FriendlyUrls.FriendlyUrl.Resolve("utama.aspx/situasi")%>',
                    dataType: "json",
                    success: function (data) {
                        cat1.push(data.d[0].State);
                        for (var i = 0; i < data.d.length; i++) {
                            if (data.d[i].Color_Code == 1) { // black
                                pms8 = pms8 + parseInt(data.d[i].Color_Value);
                            }
                            else if (data.d[i].Color_Code == 2) { // grey
                                pms9 = pms9 + parseInt(data.d[i].Color_Value);
                            }
                            else if (data.d[i].Color_Code == 3) { // white
                                bn1.push(data.d[i].Color_Value);
                            }
                            else {
                                console.log('Unused Value');
                            }
                        }
                        pmst1 = pms8 + pms9;
                        pm1.push(pmst1);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(errorThrown);
                    },
                    complete: function (data) {
                        dun_chart(cat1, bn1, pm1);
                    }
                });
            }
            catch (err) {
                console.log(err.message);
            }
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
                <h3 class="text-success portlet-status  status-white" id="white">-</h3>
                <h3 class="text-warning portlet-status  status-gray" id="grey">-</h3>
                <h3 class="text-info portlet-status status-black" id="black">-</h3>
            </div>
        </div>
        <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
            <div class="widget-simple-chart text-right card-box">
                <h4 class="text-dark  header-title m-t-0 ta-center">Status</h4>
                <p class="text-muted m-b-25 font-13 ta-center">
                    Dun
                </p>
                <h3 class="text-success portlet-status status-white" id="whited">-</h3>
                <h3 class="text-warning portlet-status status-gray" id="greyd">-</h3>
                <h3 class="text-info portlet-status status-black" id="blackd">-</h3>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-2 col-lg-2">
            <div class="card-box">
                <h4 class="text-dark header-title m-t-0 m-b-30">Dun</h4>
                <div class="widget-chart text-center">
                    <div id="gauge"></div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Jumlah Insiden</h4>
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 rest-height-250 mCustomScrollbar m-b-15"  id="ins1" runat="server" data-mcs-theme="dark-3">
                        <div class="table-responsive">
                            <asp:GridView ID="grdinsident1" CssClass="table" runat="server" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id">
                                <Columns>
                                    <asp:TemplateField HeaderText="Area">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkgrdinsid1" runat="server" Text='<%# Bind("Area") %>' Font-Underline="False" OnClick="lnkgrdinsid1_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Num" HeaderText="#"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 rest-height-250 mCustomScrollbar m-b-15" id="ins2" runat="server" data-mcs-theme="dark-3">
                        <div class="table-responsive">
                            <asp:GridView ID="grdinsident2" CssClass="table" runat="server" BorderColor="White" BorderStyle="None" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id">
                                <Columns>
                                    <asp:TemplateField HeaderText="Area">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkgrdinsid2" runat="server" Text='<%# Bind("Area") %>' Font-Underline="False" OnClick="lnkgrdinsid2_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField DataField="Num" HeaderText="#"></asp:BoundField>
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 rest-height-250 mCustomScrollbar m-b-15" id="issu1" runat="server" data-mcs-theme="dark-3">
                        <div class="table-responsive">
                            <asp:GridView ID="grdisu1" CssClass="table" runat="server" BorderColor="White" BorderStyle="None" GridLines="None"  DataKeyNames="id1" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Area">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkisu1" runat="server" Text='<%# Bind("Name1") %>' Font-Underline="False" OnClick="lnkisu1_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ciname1" HeaderText="Issue"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 rest-height-250 mCustomScrollbar m-b-15" id="issu2" runat="server" data-mcs-theme="dark-3">
                        <div class="table-responsive">
                            <asp:GridView ID="grdisu2" CssClass="table" runat="server" BorderColor="White" BorderStyle="None" GridLines="None"  DataKeyNames="id1" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="Area">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkisu2" runat="server" Text='<%# Bind("Name1") %>' Font-Underline="False" OnClick="lnkisu2_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ciname1" HeaderText="Issue"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
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
                <div id="stackedp" style="height:230px;"></div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            <div class="card-box">
                <h4 class="text-dark  header-title m-t-0">Situasi Semasa - DUN</h4>
                <div id="stackedd" style="height:230px;"></div>
            </div>
        </div>
    </div>
    <!-- end row -->
</asp:Content>
