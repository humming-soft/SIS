<%@ Page Title="" Language="C#" MasterPageFile="~/state/state_master.Master" AutoEventWireup="true" CodeBehind="candidate_winnable_view.aspx.cs" Inherits="SIS_V.state.candidate_winnable_view" EnableEventValidation="false"%>
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
            $(document).on("change", ".dateagency", function () {
                $v = $(this).val();
                $(this).parent().find("#hfsourceDate").val($v);
            });
        });
        function showBrowseDialogAdd() {
            $('#FileUpload1').click();
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var filename = $("#FileUpload1").val();
                var size = input.files[0].size;
                if (size > 3000000) {
                    $("#FileUpload1").val('');
                    $('#fileName').text('');
                    alert("The file size can not exceed 3MB.");
                } else {
                    //alert(size);
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
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:ScriptManager ID="MainScriptManager" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">
                    <div class="card-box">
                        <h4 class="m-t-0 header-title"><b>PAPARAN PROFIL CALON BOLEH MENANG</b></h4>
                        <p class="text-muted font-13 m-b-30"></p>
                        <div class="row">
                            <div class="alert alert-danger alert-dismissable" visible="false" id="topStatus" runat="server">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <asp:Label ID="topLabel" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-lg-12">
                                <div class="panel panel-color panel-custom-info">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="fa fa-search-plus"></i> CARIAN CALON</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-custom-info">
                                        <div class="row">
        <%--                                    <div class="col-lg-3">
                                                <div class="form-group">
                                                    <label for="userName">JENIS CARIAN</label>
                                                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="custom-select authSelect" ClientIDMode="Static">
                                                        <asp:ListItem Text="----Select-----" Value=""></asp:ListItem>
                                                        <asp:ListItem Text="Nama Calon" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Nombor IC" Value="2"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>--%>
                                            <div class="col-lg-6">
                                                <div class="input-group m-t-25">
                                                    <asp:DropDownList ID="candidates" runat="server" CssClass="input form-control custom-select" DataTextField="Candidate_name" DataValueField="Candidate_ic" ClientIDMode="Static"></asp:DropDownList>
                                                    <span class="input-group-btn">
                                                        <asp:LinkButton ID="btnSelect" runat="server" CssClass="btn btn btn-primary no-loader" OnClick="btnSelect_Click"><i class="fa fa-search"></i> PILIH CALON</asp:LinkButton>n>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="candidateInfoPanel" runat="server">
                             <div class="col-lg-3">
                                 <div class="panel panel-color panel-custom-info">
                                    <div class="panel-heading panel-heading-custom">
                                        <h3 class="panel-title"><i class="md md-contacts"></i> BUTIRAN CALON</h3>
                                    </div>
                                    <div class="panel-body panel-custom-bg-custom-info">
                                        <asp:HiddenField ID="HfCandidateId" runat="server" />
                                        
                                        <asp:DataList ID="CandidateDataList" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" OnItemDataBound="CandidateDataList_ItemDataBound">
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
                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                                <ContentTemplate>                                                                
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
<%--                                                                    <div class="row">
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                            <button type="button" class="btn btn-success w100"><i class="md md-brightness-auto"></i> AKTIVITI</button>
                                                                        </div>
                                                                    </div>  --%>
                                                                    <%--<hr />  --%>
                                                                            <strong>Komen </strong>
                                                                                <div class="form-group">
                                                                                    <asp:TextBox ID="txtComment" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="130px"></asp:TextBox>
                                                                                </div>
                                                                            <hr/>
                                                                        </div>
                                                                        <div class="row">
                                                                             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                               <div class="alert alert-danger alert-dismissable" visible="false" id="commentStatus" runat="server">
                                                                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                                                    <asp:Label ID="commentLabel" runat="server" Text=""></asp:Label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                                <asp:Button ID="btnCommentSave" CssClass="btn btn-success w100" ClientIDMode="AutoID" runat="server" OnClick="btnCommentSave_Click" Text="KEMASKINI" />
                                                                            </div>
                                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                                <asp:Button ID="btnCommentClear" CssClass="btn btn-danger w100" ClientIDMode="AutoID" runat="server" Text="HAPUS" OnClick="btnCommentClear_Click" />
                                                                            </div>
                                                                        </div>
                                                                   </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </div>
                                                            </div>
                                                    </div>
                                                </div>
                                           </ItemTemplate>
                                        </asp:DataList>
<%--                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="m-b-sm">
                                                    <img alt="image" class="img-rounded" src="../assets/images/users/avatar-0.jpg" style="width: 120px">
                                                </div>  
                                            </div>
                                            <div class="col-lg-8">
                                                <ul class="list-group clear-list">
                                                    <li class="list-group-item fist-item">
                                                        <span>  NAMA CALON :</span>
                                                        <strong> Syafiq Kurahman bin Hj. Shamsudin </strong>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <span> KAD PENGENALAN : </span>
                                                        <strong> 450527-99-5617 </strong>
                                                    </li>
                                                </ul>
                                            </div>                                                        
                                            <div class="col-lg-12">
                                                <div class="row">
                                                    <div class="client-detail">
                                                        <div class="full-height-scroll">
                                                            <ul class="list-group clear-list">
                                                                <li class="list-group-item fist-item">
                                                                    <span>  PARTI PENGENALAN :</span>
                                                                    <strong> Barisan Nasional </strong>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span> KOD PARTI : </span>
                                                                    <strong> UMNO </strong>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span> PARTI POLITIK : </span>
                                                                    <strong> Pertubuhan Kebangsaan Melayu Bersatu </strong>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span> JAWATAN POLITIK : </span>
                                                                        <strong> KETUA PEMUDA BAHAGIAN DAN MT PEMUDA PUSAT </strong>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span> PEKERJAAN : </span>
                                                                    <strong> AHLI PERNIAGAAN </strong>
                                                                </li>
                                                                <li class="list-group-item">
                                                                    <span> PENDIDIKAN : </span>
                                                                    <strong> IJAZAH </strong>
                                                                </li>
                                                            </ul>
                                                            <div class="row">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                    <button type="button" class="btn btn-success w100"><i class="md md-brightness-auto"></i> AKTIVITI</button>
                                                                </div>
                                                            </div>  
                                                            <hr />                                                
                                                            <strong>Komen </strong>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="130px"></asp:TextBox>
                                                                </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                <asp:Button ID="Button3" CssClass="btn btn-success w100" runat="server" Text="KEMASKINI" />
                                                            </div>
                                                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                <asp:Button ID="Button4" CssClass="btn btn-danger w100" runat="server" Text="HAPUS" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                 </div>
                                            </div>
                                        </div>--%>
                                    </div>
                                </div>
                             </div>
                             <div class="col-lg-9">
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
                                               <div class="panel panel-color panel-custom-info">
                                                        <div class="panel-heading panel-heading-custom">
                                                            <h3 class="panel-title"><i class="fa fa-plus-square"></i> TAMBAH KAWASAN CALON BOLEH MENANG</h3>
                                                        </div>
                                                        <div class="panel-body panel-custom-bg-custom-info">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:GridView ID="GridViewUpdate" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridViewUpdate_PreRender" AutoGenerateColumns="False" OnRowDataBound="GridViewUpdate_RowDataBound">
                                                                       <Columns>
                                                                           <asp:TemplateField HeaderText="NO">
                                                                               <ItemTemplate>
                                                                                    <asp:Label ID="rowNumber" runat="server" Text=""></asp:Label>
                                                                                </ItemTemplate>
                                                                           </asp:TemplateField>                                                                         
                                                                           <asp:TemplateField HeaderText="PILIHANRAYA">
                                                                               <ItemTemplate>
                                                                                   <asp:HiddenField ID="hfPid" runat="server" Value='<%# Eval("candidate_area_id") %>'/>
                                                                                   <asp:Label ID="LblElection" runat="server" Text='<%# Eval("election_name") %>'></asp:Label>
                                                                                   <asp:DropDownList ID="ddElection" CssClass="form-control" runat="server" DataTextField="election_name" DataValueField="election_id"></asp:DropDownList>
                                                                               </ItemTemplate>
                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="PENYANDANG">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="LblPosition" runat="server" Text='<%# Eval("is_incumbent").ToString() == "1"? "Penyandang" : "Bukan Penyandang"%>'></asp:Label>
                                                                                   <asp:DropDownList ID="ddPosition" CssClass="form-control" runat="server">
                                                                                       <asp:ListItem Text="----SILA PILIH----" Value="" />
                                                                                       <asp:ListItem Text="Penyandang" Value="1"/>
                                                                                       <asp:ListItem Text="Bukan Penyandang" Value="0"/>
                                                                                   </asp:DropDownList>
                                                                               </ItemTemplate>
                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField HeaderText="KAWASAN">
                                                                               <ItemTemplate>
                                                                                   <asp:Label ID="LblArea" runat="server" Text='<%# Eval("area_type").ToString() == "1" ? "Parlimen" : "DUN" %>'></asp:Label>
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
                                                                                            <asp:Label ID="LblAreaCode" runat="server" Text='<%# Eval("area_name") %>'></asp:Label>
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
                                                                                           <asp:Label ID="LblOptions" runat="server" Text='<%# Eval("choice_no").ToString()=="0" ? "Pilihan Pertama" :(Eval("choice_no").ToString()=="1" ? "Pilihan Kedua" :(Eval("choice_no").ToString()=="2" ? "Pilihan Ketiga" :(Eval("choice_no").ToString()=="3" ? "Pilihan Keempat" :(Eval("choice_no").ToString()=="4" ? "Pilihan Kelima" : "----SILA PILIH----")))) %>'></asp:Label>
                                                                                           <asp:DropDownList ID="ddOptions" CssClass="form-control" runat="server" AutoPostBack="true" ClientIDMode="AutoID" OnSelectedIndexChanged="ddOptions_SelectedIndexChanged" EnableViewState="true">
                                                                                                <asp:ListItem Text="----SILA PILIH----" Value="" />
                                                                                                <asp:ListItem Text="Pilihan Pertama" Value="0"/>
                                                                                                <asp:ListItem Text="Pilihan Kedua" Value="1"/>
                                                                                                <asp:ListItem Text="Pilihan Ketiga" Value="2"/>
                                                                                                <asp:ListItem Text="Pilihan Keempat" Value="3"/>
                                                                                                <asp:ListItem Text="Pilihan Kelima" Value="4"/>
                                                                                           </asp:DropDownList>
            <%--                                                                            </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:AsyncPostBackTrigger ControlID="ddAreaCode" EventName="SelectedIndexChanged" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>--%>
                                                                               </ItemTemplate>
                                                                           </asp:TemplateField>
                                                                           <asp:TemplateField ItemStyle-Width="15%">
                                                                               <ItemTemplate>
                                                                                   <asp:LinkButton ID="lbEdit" runat="server" CssClass="btn btn-icon waves-effect btn-default m-b-5 no-loader" CommandArgument="edit" ClientIDMode="AutoID" OnClick="lbEdit_Click"><i id="iconEdit" runat="server" class="fa fa-edit"></i></asp:LinkButton>
                                                                                   <asp:LinkButton ID="lbDelete" runat="server" CssClass="btn btn-icon waves-effect btn-default m-b-5 no-loader" OnClientClick="return confirm('Adakah anda mahu memadamkan kawasan?')" CommandArgument="delete" ClientIDMode="AutoID" OnClick="lbDelete_Click"><i class="fa fa-trash"></i></asp:LinkButton>
                                                                                   <asp:LinkButton ID="lbAgency" runat="server" CssClass="btn btn-icon waves-effect btn-default m-b-5 no-loader" CommandArgument="agencyView" ClientIDMode="AutoID" OnClick="lbAgency_Click"><i class="fa fa-chevron-down"></i></asp:LinkButton>
<%--                                                                                   <a id="lnkResource" class="btn btn-warning w100 rsrce no-loader lnkResource<%#Eval("RowNumber")%>" data-toggle="modal" data-index='<%#Eval("RowNumber")%>' data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</a>--%>
                                                                                   <asp:HiddenField ID="hdnSourceDate" Value="" runat="server" />
                                                                                   <asp:HiddenField ID="hdnSourceId" Value="" runat="server" />
                                                                                    <asp:HiddenField ID="hdnJustfication" Value="" runat="server" />
                                                                                   <%--<asp:LinkButton ID="lnkResource" runat="server" class="btn btn-warning w100 rsrce"><i class="fa fa-globe"></i> PILIH SUMBER</asp:LinkButton>--%>
                                                                                   <%--data-toggle="modal" data-target="#resource-modal"--%>
                                                                               </ItemTemplate>
                                                                           </asp:TemplateField>
                                                                       </Columns>
                                                                    </asp:GridView>
<%--                                                                    <table id="candidate_list" class="table table-bordered dt-responsive nowrap m-t-10">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>PILIHANRAYA</th>
                                                                                <th>KAWASAN</th>
                                                                                <th>PILIHAN</th>
                                                                                <th>PENYANDANG</th>
                                                                                <th>STATUS CALON</th>
                                                                                <th style="width:8%"></th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>
                                                                                    <div class="form-group m-b-0">
                                                                                        PILIHANRAYA UMUM KE-13
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        P.20-PENGKALAN CHEPA
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        PILIHAN PERTAMA
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        BUKAN PENYANDANG
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        BERTANDING
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <button class="btn btn-icon waves-effect btn-default m-b-5"> <i class="fa fa-trash"></i> </button>
                                                                                    <button class="btn btn-icon waves-effect btn-default m-b-5"> <i class="fa fa-edit"></i> </button>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>
                                                                                    <div class="form-group m-b-0">
                                                                                        PILIHANRAYA UMUM KE-13
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        P.20-PENGKALAN CHEPA
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        PILIHAN PERTAMA
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        BUKAN PENYANDANG
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        BERTANDING
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <button class="btn btn-icon waves-effect btn-default m-b-5"> <i class="fa fa-trash"></i> </button>
                                                                                    <button class="btn btn-icon waves-effect btn-default m-b-5"> <i class="fa fa-edit"></i> </button>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>
                                                                                    <div class="form-group m-b-0">
                                                                                        PILIHANRAYA UMUM KE-13
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        P.20-PENGKALAN CHEPA
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        PILIHAN PERTAMA
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        BUKAN PENYANDANG
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        BERTANDING
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <button class="btn btn-icon waves-effect btn-default m-b-5"> <i class="fa fa-trash"></i> </button>
                                                                                    <button class="btn btn-icon waves-effect btn-default m-b-5"> <i class="fa fa-edit"></i> </button>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>4</td>
                                                                                <td>
                                                                                    <div class="form-group m-b-0">
                                                                                        <asp:DropDownList ID="DropDownList21" CssClass="form-control" runat="server"></asp:DropDownList>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        <asp:DropDownList ID="DropDownList23" CssClass="form-control" runat="server"></asp:DropDownList>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        <asp:DropDownList ID="DropDownList24" CssClass="form-control" runat="server"></asp:DropDownList>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        <asp:DropDownList ID="DropDownList25" CssClass="form-control" runat="server"></asp:DropDownList>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="form-group  m-b-0">
                                                                                        <asp:DropDownList ID="DropDownList26" CssClass="form-control" runat="server"></asp:DropDownList>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <button type="button" class="btn btn-warning w100" data-toggle="modal" data-target="#resource-modal"><i class="fa fa-globe"></i> PILIH SUMBER</button>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>--%>
                                                                </div>  
                                                                </div>
                                                            <div class="row">
                                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                                    <div class="alert alert-danger alert-dismissable" id="invalidAdd" runat="server">
                                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                                         Sila lengkapkan borang untuk menambah.
                                                                    </div>
                                                                    <div class="alert alert-danger alert-dismissable" id="invalidOption" runat="server">
                                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                                            Pilihan ini telah memilih calon lain.
                                                                    </div>
                                                                    <div class="alert alert-danger alert-dismissable" id="updateStatus" runat="server">
                                                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                                        <asp:Label ID="updateLabel" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
<%--                                                            <div class="row m-t-30">
                                                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">                                                                
                                                                    <button type="button" class="btn btn-primary w100"><i class="fa fa-plus"></i> KEMASKINI KAWASAN</button>--%>
<%--                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                                     <asp:LinkButton ID="rowAdd" runat="server" CssClass="btn btn-success w100 no-loader" OnClick="rowAdd_Click"><i class="fa fa-plus"></i> TAMBAH KAWASAN</asp:LinkButton>
                                                                </div>
                                                                <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                                    <button type="button" class="btn btn-danger w100"><i class="fa fa-trash"></i> HAPUS</button>
                                                                </div>
                                                            </div>--%>
                                                        </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                             <div class="panel panel-color panel-custom-info">
                                                <div class="panel-heading panel-heading-custom">
                                                    <h3 class="panel-title"><i class="md md-brightness-auto"></i> PAPARAN SUMBER MAKLUMAT DARI AGENSI</h3>
                                                </div>
                                                <div class="panel-body panel-custom-bg-custom-info">
                                                     <div class="row">
                                                         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                             <asp:HiddenField ID="htCandidateAreaId" runat="server"/>
                                                             <asp:GridView ID="GridViewAgency" runat="server" CssClass="table table-striped table-bordered dt-responsive nowrap" ClientIDMode="Static" OnPreRender="GridViewAgency_PreRender" AutoGenerateColumns="False" EmptyDataText="No Data Found!" OnRowDataBound="GridViewAgency_RowDataBound">
                                                                 <Columns>
                                                                    <asp:TemplateField HeaderText="NO">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="rowNumber" runat="server" Text=""></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>  
                                                                    <asp:TemplateField HeaderText="TARIKH SUMBER">
                                                                        <ItemTemplate>
                                                                           <div class="form-group m-b-0">
                                                                                <asp:HiddenField ID="hfAgencyid" runat="server" Value='<%# Eval("candidate_area_source_id") %>'/>
                                                                                <asp:HiddenField ID="hfAreaid" runat="server" Value='<%# Eval("candidate_area_id") %>'/>
                                                                               <asp:HiddenField ID="hfsourceDate" runat="server" ClientIDMode="Static"/>
                                                                                <asp:Label ID="lbSourceDate" runat="server" Text='<%# Eval("source_date") %>'></asp:Label>
                                                                                <asp:TextBox ID="sourceDate" runat="server" CssClass="input form-control dateagency" ReadOnly="true" ClientIDMode="Static" ></asp:TextBox>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                     </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="AGENSI">
                                                                        <ItemTemplate>
                                                                           <div class="form-group m-b-0">
                                                                              <asp:Label ID="lbAgency" runat="server" Text='<%# Eval("agency_name") %>'></asp:Label>
                                                                              <asp:DropDownList ID="ddAgency" CssClass="form-control" runat="server" DataTextField="agency_name" DataValueField="agency_id"></asp:DropDownList>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                     </asp:TemplateField>
                                                                     <asp:TemplateField HeaderText="JUSTIFIKASI">
                                                                        <ItemTemplate>
                                                                           <div class="form-group m-b-0">
                                                                              <asp:Label ID="lbjust" runat="server" Text='<%# Eval("justification") %>'></asp:Label>
                                                                              <asp:TextBox ID="txtjustification" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="35px" ClientIDMode="Static"></asp:TextBox>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                     </asp:TemplateField>
                                                                     <asp:TemplateField ItemStyle-Width="10%">
                                                                          <ItemTemplate>
                                                                             <asp:LinkButton ID="lbEdit" runat="server" CssClass="btn btn-icon waves-effect btn-default m-b-5 no-loader" CommandArgument="edit" ClientIDMode="AutoID" OnClick="lbEdit_Click1"><i id="iconEdit" runat="server" class="fa fa-edit"></i></asp:LinkButton>
                                                                             <asp:LinkButton ID="lbDelete" runat="server" CssClass="btn btn-icon waves-effect btn-default m-b-5 no-loader"  OnClientClick="return confirm('Adakah anda mahu memadamkan Agensi?')" CommandArgument="delete" ClientIDMode="AutoID" OnClick="lbDelete_Click1"><i class="fa fa-trash"></i></asp:LinkButton>
                                                                          </ItemTemplate>
                                                                     </asp:TemplateField>
                                                                  </Columns>                                                             
                                                             </asp:GridView>
                                                              <table class="table table-bordered dt-responsive nowrap m-t-10" id="noAgency" runat="server">
                                                                  <tbody>
                                                                    <tr>
                                                                        <td class="ta-center">KLIK <a class="btn btn-icon waves-effect btn-default m-b-5 no-loader"><i class="fa fa-chevron-down"></i></a> DI ATAS UNTUK MELIHAT SUMBER MAKLUMAT AGENSI</td>
                                                                    </tr>
                                                                  </tbody>
                                                              </table>
<%--                                                            <table class="table table-bordered dt-responsive nowrap m-t-10 temp">
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
                                                                        <td>ABC</td>
                                                                        <td>SSP- asvsdhjbdfvks</td>
                                                                        <td>asdasdasdasdasdasdasdasdsad</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>2</td>
                                                                        <td>ABC</td>
                                                                        <td>SSP - asvsdhjbdfvks</td>
                                                                        <td>sadsadasdasdasdas</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>3</td>
                                                                        <td>
                                                                            <div class="form-group m-b-0">
                                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="input form-control"></asp:TextBox>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="form-group  m-b-0">
                                                                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="form-group m-b-0">
                                                                                <asp:TextBox ID="TextBox8" runat="server" CssClass="input form-control" TextMode="MultiLine"></asp:TextBox>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>--%>
                                                         </div>
                                                     </div>
                                                    <div class="row">
                                                        <div class="alert alert-danger alert-dismissable" visible="false" id="agencyStatus" runat="server">
                                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                            <asp:Label ID="agencyLabel" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="agencyGroupBtn" runat="server">
<%--                                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                            <button type="button" class="btn btn-success w100"><i class="fa fa-plus"></i> TAMBAH SUMBER</button>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                            <button type="button" class="btn btn-danger w100"><i class="fa fa-trash"></i> HAPUS SUMBER</button>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                   </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="row">
                                    <div class="col-lg-6 p-l-0">
                                         <div class="panel panel-color panel-custom-info">
                                            <div class="panel-heading panel-custom-bg-custom-info">
                                                <h3 class="panel-title"><i class="fa fa-file-archive-o"></i> PAPARAN FAIL ARKIB</h3>
                                            </div>
                                            <div class="panel-body panel-custom-bg-custom-info" style="height:298px">
                                                <div class="row">
                                                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                         <asp:GridView ID="GridViewFile" runat="server" class="table table-bordered dt-responsive nowrap m-t-10 temp" ClientIDMode="Static" OnPreRender="GridViewFile_PreRender" AutoGenerateColumns="False" EmptyDataText="No Data Found!">
                                                             <Columns>
                                                                <asp:TemplateField HeaderText="NO">
                                                                    <ItemTemplate>
                                                                        <asp:HiddenField ID="HfArchiveId" runat="server" Value='<%# Eval("win_candidate_archive_id") %>' />
                                                                        <asp:Label ID="rowNumber" runat="server" Text="1"></asp:Label>
                                                                    </ItemTemplate>
                                                                 </asp:TemplateField>  
                                                                 <asp:TemplateField HeaderText="NAMA FAIL">
                                                                     <ItemTemplate>
                                                                         <asp:Label ID="lbFileName" runat="server" Text='<%# Eval("original_filename") %>'></asp:Label>
                                                                     </ItemTemplate>
                                                                 </asp:TemplateField>
                                                                 <asp:TemplateField HeaderText="INFORMASI">
                                                                     <ItemTemplate>
                                                                         <asp:Label ID="lbInformation" runat="server" Text='<%# Eval("win_candidate_archive_info") %>'></asp:Label>
                                                                     </ItemTemplate>
                                                                 </asp:TemplateField>
                                                                 <asp:TemplateField HeaderText="MUAT TURUN" ItemStyle-Width="5%">
                                                                     <ItemTemplate>
                                                                         <asp:LinkButton ID="lbDownload" runat="server" CssClass="no-loader" OnClick="lbDownload_Click"><i class="fa fa-download"></i></asp:LinkButton>
                                                                     </ItemTemplate>
                                                                 </asp:TemplateField>
                                                             </Columns>
                                                         </asp:GridView>
<%--                                                        <table class="table table-bordered dt-responsive nowrap m-t-10 temp">
                                                            <thead>
                                                                <tr>
                                                                    <th>#</th>
                                                                    <th style="width:20%">NAMA FAIL</th>
                                                                    <th>INFORMASI</th>
                                                                    <th style="width:5%">MUAT TURUN</th>                    
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>Document -1.rar</td>
                                                                    <td>Complete Documents regarding the Activities</td>
                                                                    <td><a href="#"><i class="fa fa-download"></i></a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>--%>
                                                     </div>
                                                </div>
                                                <div class="row">
                                                 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                     <asp:LinkButton ID="lbnFileDelete" runat="server" CssClass="btn btn-danger pull-right" OnClick="lbnFileDelete_Click"><i class="fa fa-trash"></i> HAPUS ARKIB</asp:LinkButton>
                                                 </div>
                                               </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 p-r-0">
                                       <div class="panel panel-color panel-custom-info">
                                            <div class="panel-heading panel-heading-custom">
                                                <h3 class="panel-title"><i class="fa fa-file-archive-o"></i> TAMBAH MAKLUMAT ARKIB</h3>
                                            </div>
                                            <div class="panel-body panel-custom-bg-custom-info">
                                                <div class="row">
                                                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                         <asp:HiddenField ID="HfArchiveId" runat="server" />
                                                         <label for="userName">PILIH FAIL YANG ANDA KEHENDAKI DI BAWAH</label><br />
<%--                                                          <div class="fileupload fileupload-new" data-provides="fileupload">
                                                            <span class="btn btn-primary btn-file" style="width:100%"><span class="fileupload-new"><i class="fa fa-file-text"></i> Select file</span>
                                                            <span class="fileupload-exists"><i class="fa fa-reply"></i> Change</span><asp:FileUpload ID="FileUpload1" runat="server" /></span>
                                                            <span class="fileupload-preview"></span>
                                                            <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
                                                          </div>--%>
                                                        <asp:FileUpload ID="FileUpload1" runat="server" Style="display: none" ClientIDMode="Static" onchange="readURL(this);" />
                                                        <button type="button" class="btn btn-success waves-light" style="width: 50%" runat="server" onclick="return showBrowseDialogAdd();"><i class="fa fa-file-zip-o"></i> Pilih fail (.rar,.zip)</button>
                                                        <span id="fileName" runat="server" ClientIDMode="Static"></span>
                                                     </div>
                                                </div>
                                                <div class="row m-t-15">
                                                     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <div class="form-group">
                                                            <label for="userName">INFORMASI TAMBAHAN</label>
                                                            <asp:TextBox ID="infoFile" runat="server" CssClass="input form-control" TextMode="MultiLine" Height="115px"></asp:TextBox>
                                                        </div>                                            
                                                     </div>
                                                </div>
                                                <div class="row">

                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                        <asp:LinkButton ID="lbnSaveArchive" runat="server" CssClass="btn btn-primary pull-right" OnClick="lbnSaveArchive_Click"><i class="fa fa-save"></i> KEMASKINI ARKIB</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-color panel-success">
                                <div class="panel-heading panel-heading-custom">
                                    <h3 class="panel-title">PILIH AGENSI UNTUK KAWASAN CALON BOLEH MENANG</h3>
                                </div>
                                <div class="panel-body panel-custom-bg">
                                    <table class="table table-bordered dt-responsive nowrap m-t-10 temp">
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
                                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="input form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group  m-b-0">
                                                        <asp:DropDownList ID="DropDownList19" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox5" runat="server" CssClass="input form-control" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox6" runat="server" CssClass="input form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group  m-b-0">
                                                        <asp:DropDownList ID="DropDownList20" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group m-b-0">
                                                        <asp:TextBox ID="TextBox7" runat="server" CssClass="input form-control" TextMode="MultiLine"></asp:TextBox>
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
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="btn-group pull-right">
                                <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Text="HAPUS DARI SENARAI" />
                                <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="TAMBAH KE SENARAI" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Text="OK" />
                    <asp:Button ID="btnClear" CssClass="btn btn-info waves-light" runat="server" Text="BATAL" />
                </div>
            </div>
        </div>
    </div>
    <!-- /.modal -->    
</asp:Content>
