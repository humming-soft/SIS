<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="candidate_winnable_add.aspx.cs" Inherits="SIS_V.state.candidate_winnable_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body{
            min-height:900px;
        }
    </style>
    <link href="../assets/js/fileupload/boostrap.fileupload.min.css" rel="stylesheet" />
    <script src="../assets/js/fileupload/boostrap.fileupload.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $("#candidates").customselect();
            //$(".agencylist").customselect();
            $(".dateagency").datepicker({
                autoclose: true,
                todayHighlight: true,
                format: 'dd/mm/yyyy',
                orientation: 'bottom auto',
                keyboardNavigation: false
            });

            $(document).on("click", ".rsrce", function () {

                $("#indexId").val($(this).data("index"));
                $(".resourceTable tbody tr").each(function () {
                    if (!$(this).is(':first-child')) {
                        $(this).remove();
                    } else {
                        $(this).find('#agencyList').val("");
                        $(this).find('#justification').val("");
                    }
                });
                $sourceDate = $(this).parent().find("#hdnSourceDate").val();
                $hdnSourceId = $(this).parent().find("#hdnSourceId").val();
                $justification = $(this).parent().find("#hdnJustfication").val();
                if ($sourceDate != "" && $hdnSourceId != "" && $justification != "") {
                    var $dateArray = $sourceDate.split(',');
                    var $idArray = $hdnSourceId.split(',');
                    var jArray = $justification.split(',');
                    for (var x = 0; x < $dateArray.length; x++) {
                        if (x == 0) {
                            $(".resourceTable tbody tr:first").find('#sourceDate').val((typeof ($dateArray[x]) == "undefined") ? "" : $dateArray[x]);
                            $(".resourceTable tbody tr:first").find('#agencyList').val((typeof ($idArray[x]) == "undefined") ? "" : $idArray[x]);
                            $(".resourceTable tbody tr:first").find('#justification').val((typeof (jArray[x]) == "undefined") ? "" : jArray[x]);
                        } else {
                            $cloned = $(".resourceTable tbody tr:first").clone();
                            $cloned.find("td:first").text(parseInt($(".resourceTable tbody tr").length) + 1);
                            $cloned.find('#agencyList').val((typeof ($idArray[x]) == "undefined") ? "" : $idArray[x]);
                            $cloned.find('#justification').val((typeof (jArray[x]) == "undefined") ? "" : jArray[x]);
                            $cloned.find(".dateagency").datepicker({
                                autoclose: true,
                                todayHighlight: true,
                                format: 'dd/mm/yyyy',
                                orientation: 'bottom auto',
                                keyboardNavigation: false
                            });
                            $cloned.find('#sourceDate').val((typeof ($dateArray[x]) == "undefined") ? "" : $dateArray[x]);
                            $(".resourceTable tr:last").after($cloned);
                        }
                    }
                    $length = $(".resourceTable tbody tr").length;
                    if ($length > 1) {
                        $("#dupRowRemove").show();
                    }
                }

            });

            $("#dupRow").click(function () {
                $cloned = $(".resourceTable tbody tr:first").clone();
                //$selectClone = $cloned.find("#agencyListDup").clone().removeClass("hidden");
                //$selectClone.customselect();
                //$selectClone.appendTo($cloned.find("td:nth-child(3)").html(""));
                $cloned.find("td:first").text(parseInt($(".resourceTable tbody tr").length)+1);
                $cloned.find(".parsley-error").removeClass("parsley-error");
                $cloned.find("#sourceDate").val("");
                $cloned.find("#agencyList").val("");
                $cloned.find("#justification").val("");
                $cloned.find(".dateagency").datepicker({
                    autoclose: true,
                    todayHighlight: true,
                    format: 'dd/mm/yyyy',
                    orientation: 'bottom auto',
                    keyboardNavigation: false
                });
                $(".resourceTable tr:last").after($cloned);
                $length = $(".resourceTable tbody tr").length;
                if ($length > 1) {
                    $("#dupRowRemove").show();
                }

            });

            $("#dupRowRemove").click(function () {
                $(".resourceTable tr:last").remove();
                $length = $(".resourceTable tbody tr").length;
                if ($length < 2) {
                    $(this).hide();
                }
            });

            $("#btnSubmit").click(function () {
                $sourceDate = "";
                $agencyList = "";
                $justification = "";
                $fval = 0;
                $(".resourceTable tbody tr").each(function () {
                    $sd = $(this).find("#sourceDate");
                    $al = $(this).find("#agencyList");
                    $just = $(this).find("#justification");
                    if ($sd.val() == "") {
                        $fval++;
                        $sd.addClass("parsley-error");
                    } else {
                        $sourceDate += $sd.val() + ",";
                        $sd.removeClass("parsley-error");
                    }
                    if ($al.val() == "") {
                        $fval++;
                        $al.addClass("parsley-error");
                    } else {
                        $agencyList += $al.val() + ",";
                        $al.removeClass("parsley-error");
                    }
                    if ($just.val() == "") {
                        $fval++;
                        $just.addClass("parsley-error");
                    } else {
                        $justification += $just.val() + ",";
                        $just.removeClass("parsley-error");
                    }
                });
                if ($fval == 0) {
                    $sourceDate = $sourceDate.substring(0, $sourceDate.length - 1);
                    $agencyList = $agencyList.substring(0, $agencyList.length - 1);
                    $justification = $justification.substring(0, $justification.length - 1);

                    $index = $("#indexId").val();
                    $(".lnkResource" + $index).parent().find("#hdnSourceDate").val($sourceDate);
                    $(".lnkResource" + $index).parent().find("#hdnSourceId").val($agencyList);
                    $(".lnkResource" + $index).parent().find("#hdnJustfication").val($justification);
                    $("#agencyAlert").hide();
                    $("#btnClear").click();
                } else {
                    $("#agencyAlert").show();
                }
            });
        });
        function showBrowseDialogAdd() {
            $('#FileUpload1').click();
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var filename = $("#FileUpload1").val();
                var extension = filename.replace(/^.*\./, '');
                if (extension == filename) {
                    extension = '';
                } else {
                    extension = extension.toLowerCase();
                }
                if (extension == 'rar' || extension == 'zip') {
                    $('#fileName').text(filename);
                }
                else {
                    $("#FileUpload1").val('');
                    $('#fileName').text('');
                    alert("Invalid Extension - Supported Archive types(.rar, .zip) !");
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="MainScriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">
                    <div class="card-box">
                        <h4 class="m-t-0 header-title"><b>TAMBAH PROFIL CALON BOLEH MENANG</b></h4>
                        <p class="text-muted font-13 m-b-30"></p>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <asp:Label ID="lblvalid" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                    <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-color panel-success">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="fa fa-search-plus"></i> Search Candidate</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-success">
<%--                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>--%>
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="input-group m-t-25">
                                                                <asp:DropDownList ID="candidates" runat="server" CssClass="input form-control custom-select" DataTextField="Candidate_name" DataValueField="Candidate_ic" ClientIDMode="Static"></asp:DropDownList>
                                                                <span class="input-group-btn">
                                                                    <asp:LinkButton ID="btnSelect" runat="server" CssClass="btn btn btn-primary no-loader" OnClick="btnSelect_Click"><i class="fa fa-search"></i> PILIH CALON</asp:LinkButton>
                                                                </span>
                                                        </div>
                                                    </div>
                                                </div>
<%--                                            </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" runat="server" id="candidateinfo">
                             <div class="col-lg-3">
                                 <div class="panel panel-color panel-success">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="md md-contacts"></i> Candidate Informaton</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-success">
                                        <asp:DataList ID="CandidateDataList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <div class="m-b-sm">
                                                            <asp:Image ID="Image1" class="img-rounded" runat="server" ImageUrl='<%# Eval("pimage") %>' Width="120px" />                                                          
                                                        </div>  
                                                    </div>
                                                    <div class="col-lg-8">
                                                        <ul class="list-group clear-list">
                                                            <li class="list-group-item fist-item">
                                                                <span>  NAMA CALON :</span>
                                                                <strong> <%# Eval("name")%> </strong>
                                                            </li>
                                                            <li class="list-group-item">
                                                                <span> KAD PENGENALAN : </span>
                                                                <strong> <%# Eval("candidate_ic")%> </strong>
                                                            </li>
                                                        </ul>
                                                    </div>                                                        
                                                    <div class="col-lg-12 m-t-10">
                                                        <div class="row">
                                                            <div class="client-detail">
                                                                <div class="full-height-scroll">
                                                                    <ul class="list-group clear-list">
                                                                        <li class="list-group-item fist-item">
                                                                            <span>  PARTI PENGENALAN :</span>
                                                                            <strong>  <%# Eval("coalition_name")%> </strong>
                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <span> KOD PARTI : </span>
                                                                            <strong> <%# Eval("party_shortcode")%> </strong>
                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <span> PARTI POLITIK : </span>
                                                                            <strong> <%# Eval("party_name_bm")%> </strong>
                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <span> JAWATAN POLITIK : </span>
                                                                            <strong> <%# Eval("political_post")%> </strong>
                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <span> PEKERJAAN : </span>
                                                                            <strong> <%# Eval("occupation")%> </strong>
                                                                        </li>
                                                                        <li class="list-group-item">
                                                                            <span> PENDIDIKAN : </span>
                                                                            <strong> <%# Eval("education")%> </strong>
                                                                        </li>
                                                                    </ul>
                                                                    <strong>Komen </strong>
                                                                        <div class="form-group">
                                                                            <asp:TextBox ID="txtComment" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="130px"></asp:TextBox>
                                                                        </div>
                                                                    <hr/>
                                                                </div>
                                                            </div>
                                                            </div>
                                                    </div>
                                                </div>
                                           </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>
                             </div>
                             <div class="col-lg-9">
                                <div class="row">
                                     <div class="panel panel-color panel-success">
                                        <div class="panel-heading panel-heading-custom">
                                            <h3 class="panel-title"><i class="fa fa-plus-square"></i> TAMBAH KAWASAN CALON BOLEH MENANG (NEGERI : <asp:Label ID="statename" runat="server" Text=""></asp:Label>)</h3>
                                        </div>
                                        <div class="panel-body panel-custom-bg-success">
                                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:updateprogress id="UpdateProgress1" runat="server" associatedupdatepanelid="UpdatePanel1" dynamiclayout="true">
                                                    <progresstemplate>
                                                            <div class="splash">
                                                                <div class="splash-title">
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
                                                    </progresstemplate>
                                                </asp:updateprogress>
                                            <div class="row">                                             
                                               <div class="col-lg-12">
                                                   <input type="hidden" id="indexId" />
                                                   <div class="table-responsive max-height-210 mCustomScrollbar" data-mcs-theme="dark-3">
                                                       <asp:GridView ID="GridViewRowAdd" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridViewRowAdd_PreRender" AutoGenerateColumns="False">
                                                           <Columns>
                                                               <asp:BoundField DataField="RowNumber" HeaderText="#"/>
                                                               <asp:TemplateField HeaderText="PILIHANRAYA">
                                                                   <ItemTemplate>
                                                                       <asp:DropDownList ID="ddElection" CssClass="form-control" runat="server" DataTextField="election_name" DataValueField="election_id"></asp:DropDownList>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="PENYANDANG">
                                                                   <ItemTemplate>
                                                                       <asp:DropDownList ID="ddPosition" CssClass="form-control" runat="server">
                                                                           <asp:ListItem Text="----SILA PILIH----" Value="" />
                                                                           <asp:ListItem Text="Penyandang" Value="1"/>
                                                                           <asp:ListItem Text="Bukan Penyandang" Value="0"/>
                                                                       </asp:DropDownList>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="KAWASAN">
                                                                   <ItemTemplate>
                                                                        <asp:DropDownList AutoPostBack="true" ID="ddArea" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddArea_SelectedIndexChanged">
                                                                            <asp:ListItem Text="----SILA PILIH----" Value="" />
                                                                            <asp:ListItem Text="Parlimen" Value="1"/>
                                                                            <asp:ListItem Text="DUN" Value="2"/>
                                                                        </asp:DropDownList>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="KOD KAWASAN">
                                                                   <ItemTemplate>
                                                                        <asp:UpdatePanel ID="AreaUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                            <ContentTemplate>
                                                                                <asp:DropDownList ID="ddAreaCode" CssClass="form-control" runat="server" DataTextField="area_name" DataValueField="area_id"></asp:DropDownList>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="ddArea" EventName="SelectedIndexChanged" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:TemplateField HeaderText="PILIHAN">
                                                                   <ItemTemplate>
<%--                                                                        <asp:UpdatePanel ID="OptionsUpdatePanel" runat="server" UpdateMode="Conditional">
                                                                            <ContentTemplate>--%>
                                                                               <asp:DropDownList ID="ddOptions" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddOptions_SelectedIndexChanged" EnableViewState="true">
                                                                                    <asp:ListItem Text="----SILA PILIH----" Value="" />
                                                                                    <asp:ListItem Text="Pilihan Pertama" Value="0"/>
                                                                                    <asp:ListItem Text="Pilihan Kedua" Value="1"/>
                                                                                    <asp:ListItem Text="Pilihan ketiga" Value="2"/>
                                                                                    <asp:ListItem Text="Pilihan keempat" Value="3"/>
                                                                                    <asp:ListItem Text="Pilihan kelima" Value="4"/>
                                                                               </asp:DropDownList>
<%--                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:AsyncPostBackTrigger ControlID="ddAreaCode" EventName="SelectedIndexChanged" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>--%>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                               <asp:TemplateField>
                                                                   <ItemTemplate>
                                                                       <a id="lnkResource" class="btn btn-warning w100 rsrce no-loader lnkResource<%#Eval("RowNumber")%>" data-toggle="modal" data-index='<%#Eval("RowNumber")%>' data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</a>
                                                                       <asp:HiddenField ID="hdnSourceDate" Value="" runat="server" />
                                                                       <asp:HiddenField ID="hdnSourceId" Value="" runat="server" />
                                                                        <asp:HiddenField ID="hdnJustfication" Value="" runat="server" />
                                                                       <%--<asp:LinkButton ID="lnkResource" runat="server" class="btn btn-warning w100 rsrce"><i class="fa fa-globe"></i> PILIH SUMBER</asp:LinkButton>--%>
                                                                       <%--data-toggle="modal" data-target="#resource-modal"--%>
                                                                   </ItemTemplate>
                                                               </asp:TemplateField>
                                                           </Columns>
                                                       </asp:GridView>
                                                   </div>
                                                </div>  
                                               </div>
                                            <div class="row m-t-30">
                                                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
                                                    <div class="alert alert-danger alert-dismissable" id="invalidAdd" runat="server">
                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                         Sila lengkapkan borang untuk menambah.
                                                    </div>
                                                    <div class="alert alert-danger alert-dismissable" id="invalidOption" runat="server">
                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                            Pilihan ini telah memilih calon lain.
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                        <asp:LinkButton ID="rowRemove" runat="server" Visible="false" CssClass="btn btn-danger w100 no-loader" OnClick="rowRemove_Click"><i class="fa fa-trash"></i> KELUAR DARI SENARAI</asp:LinkButton>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                        <asp:LinkButton ID="rowAdd" runat="server" CssClass="btn btn-primary w100 no-loader" OnClick="rowAdd_Click"><i class="fa fa-plus"></i> TAMBAH KAWASAN</asp:LinkButton>
                                                    </div> 
                                                </div>
                                            </div>
                                             </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                     <div class="panel panel-color panel-success">
                                        <div class="panel-heading panel-heading-custom">
                                            <h3 class="panel-title"><i class="fa fa-file-archive-o"></i> TAMBAH MAKLUMAT ARCHIVES</h3>
                                        </div>
                                        <div class="panel-body panel-custom-bg-success">
                                            <div class="row">
                                                 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 m-b-15">
                                                     <label for="userName">PILIH FAIL YANG ANDA KENHANDAKI DI BAWAH</label><br />
<%--                                                      <div class="fileupload fileupload-new" data-provides="fileupload">
                                                        <span class="btn btn-primary btn-file" style="width:50%"><span class="fileupload-new"><i class="fa fa-file-text"></i> Select file</span>
                                                        <span class="fileupload-exists"><i class="fa fa-reply"></i> Change</span><asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static"/></span>
                                                        <span class="fileupload-preview"></span>
                                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                                      </div>--%>
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Style="display: none" ClientIDMode="Static" onchange="readURL(this);" />
                                                    <button type="button" class="btn btn-success waves-light" style="width: 50%" runat="server" onclick="return showBrowseDialogAdd();"><i class="fa fa-file-zip-o"></i> Select Archives</button>
                                                     <span id="fileName" runat="server" ClientIDMode="Static"></span>
                                                 </div>
                                            </div>
                                            <div class="row">
                                                 <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                    <div class="form-group">
                                                        <label for="userName">INFORMASI TAMBAHAN</label>
                                                        <asp:TextBox ID="infoFile" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="130px"></asp:TextBox>
                                                    </div>                                            
                                                 </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                           </div>  
                          <div class="row">
                             <div class="col-lg-12">
                                 <div class="panel panel-color panel-success">
                                    <div class="panel-body panel-custom-bg-success">
                                        <div class="btn-group pull-right">
                                            <asp:Button ID="saveAll" runat="server" Text="Simplan" CssClass="btn btn-success" OnClick="saveAll_Click" /> <asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                          </div>
                        </div>
                        <div class="row" runat="server" id="alternate">
                             <div class="col-lg-12">
                                 <div class="panel panel-color panel-success">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="md md-contacts"></i> Candidate Informaton</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-success">
                                        <div class="alert alert-danger alert-dismissable" id="Div1" runat="server">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                No Information found.
                                        </div>
                                    </div>
                                </div>
                            </div>
                      </div>
                    </div>
        </div>
    </div>
    <!-- Modal -->
    <div id="resource-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog" style="width:55%">
            <%--<asp:HiddenField ID="hd_password" ClientIDMode="Static" runat="server" />--%>
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">TAMBAH AGENSI BAGI KAWASAN CALON BOLEH MENANG</h4>
                </div>
                <div class="modal-body">
<%--                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>--%>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-color panel-success">
                                        <div class="panel-heading panel-heading-custom">
                                            <h3 class="panel-title">PILIH AGENSI UNTUK KAWASAN CALON BOLEH MENANG</h3>
                                        </div>
                                        <div class="panel-body panel-custom-bg">
<%--                                            <asp:GridView ID="GridViewAgency" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridViewAgency_PreRender" AutoGenerateColumns="False">
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="#"/>
                                                    <asp:TemplateField HeaderText="TARIKH SUMBER" ItemStyle-Width="20%">
                                                        <ItemTemplate>
                                                           <asp:TextBox ID="sourceDate" runat="server" CssClass="input form-control dateagency" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="AGENSI" ItemStyle-Width="25%">
                                                        <ItemTemplate>
                                                           <asp:DropDownList ID="agencyList" CssClass="agencylist form-control custom-select" DataValueField="agency_id" DataTextField="agency_name" runat="server" ClientIDMode="Static"></asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="JUSTIFIKASI">
                                                        <ItemTemplate>
                                                           <asp:TextBox ID="justification" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="35px"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>--%>
                                            <table class="table table-bordered dt-responsive nowrap m-t-10 temp resourceTable">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th style="width:20%">TARIKH SUMBER</th>
                                                        <th style="width:25%">AGENSI</th>
                                                        <th>JUSTIFIKASI</th>                    
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>
                                                            <div class="form-group m-b-0">
                                                                <asp:TextBox ID="sourceDate" runat="server" CssClass="input form-control dateagency" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group  m-b-0">
                                                                <asp:DropDownList ID="agencyList" CssClass="agencylist form-control custom-select" DataValueField="agency_id" DataTextField="agency_name" runat="server" ClientIDMode="Static"></asp:DropDownList>
<%--                                                                <asp:DropDownList ID="agencyListDup" CssClass="agencylist form-control hidden" DataValueField="agency_id" DataTextField="agency_name" runat="server" ClientIDMode="Static"></asp:DropDownList>--%>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="form-group m-b-0">
                                                                <asp:TextBox ID="justification" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="35px" ClientIDMode="Static"></asp:TextBox>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="alert alert-danger alert-dismissable" id="agencyAlert" style="display:none;">                                   
                                        Sila lengkapkan borang untuk menambah.
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                    <div class="btn-group pull-right">
                                        <button type="button" id="dupRowRemove" class="btn btn-danger" style="display:none;"> HAPUS DARI SENARAI</button>
                                        <button type="button" id="dupRow" class="btn btn-primary"> TAMBAH SENARAI BARU</button>
                                    </div>
                                </div>
                            </div>                        
<%--                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridViewRowAdd" EventName="RowCommand" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnSubmit" class="btn btn-success"> OK</button>
                    <button type="button" id="btnClear" class="btn btn-info waves-light" data-dismiss="modal"> BATAL</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->    
</asp:Content>
