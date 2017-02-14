<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="winnable_candidate.aspx.cs" Inherits="SIS_V.state.winnable_candidate"  MasterPageFile="~/admin/Admin_Master.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.grid').masonry({
                // options
                itemSelector: '.grid-item',
                columnWidth: 250,
                gutter: 25
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid">

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-info txt-black">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.41 - KEPALA BATAS</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.1 - PENAGA</p>
                            <p>N.2 - BERTAM</p>
                            <p>N.3 - PINANG TUNGGAL</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-primary txt-white">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.42 - TASEK GELUGOR</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - PERMATANG BERANGAN</p>
                            <p>N.5 - SUNGAI DUA</p>
                            <p>N.6 - TELOK AYER TAWAR</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-danger txt-white">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-success">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-warning">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-pink">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-inverse txt-white">
                        <div class="ibox-top">
                            <h4 class="font-bold txt-white">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold txt-white">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-purple txt-white">
                        <div class="ibox-top">
                            <h4 class="font-bold txt-white">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom ">
                            <h4 class="font-bold txt-white">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-success">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-primary txt-white">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-info txt-black">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="grid-item">
            <div class="ibox">
                <a href="candidate_detail.aspx" class="txt-inherit">
                    <div class="ibox-content bg-danger txt-white">
                        <div class="ibox-top">
                            <h4 class="font-bold">PARLIMEN
                            </h4>
                            <p>P.43 - BAGAN</p>
                        </div>
                        <div class="ibox-bottom">
                            <h4 class="font-bold">DUN
                            </h4>
                            <p>N.4 - SUNGAI PUYU</p>
                            <p>N.5 - BAGAN JERMAL</p>
                            <p>N.6 - BAGAN DALAM</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

</asp:Content>
