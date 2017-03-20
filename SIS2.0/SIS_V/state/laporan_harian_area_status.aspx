<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_area_status.aspx.cs" Inherits="SIS_V.state.laporan_harian_areastatus" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">
        jQuery(document).ready(function ($) {
            lamporan.init();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Paparan Status Kawasan</b></h4>
                <div class="grid-structure m-t-30">
                    <div class="grid-container">
<%--                        <h5 class="m-t-0 header-title" style="font-size:13px"><b>Filter Laporan Harian Analisis Status Kawasan </b></h5>--%>
                        <div class="row">
                            <div class="alert alert-danger alert-dismissable" id="log_valid" runat="server">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <p>Please Select from the list to filter the result!</p>
                            </div>
                            <div class="alert alert-danger alert-dismissable" id="invalid" runat="server">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <asp:Label ID="lblinvalid" runat="server"></asp:Label>
                            </div>
                            <div class="alert alert-success alert-dismissable" id="valid" runat="server">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <asp:Label ID="lblsuccess" runat="server"></asp:Label>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Parlimen - DUN</label>
                                        <asp:DropDownList ID="dp_kawasan" CssClass="form-control area-list" runat="server"
                                        ClientIDMode="Static" DataTextField="area_name" DataValueField="area_id">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Status</label>
                                    <asp:DropDownList ID="dp_status" CssClass="form-control" runat="server"
                                        ClientIDMode="Static" DataTextField="Text" DataValueField="Value">
                                    </asp:DropDownList>
                                </div>
                            </div>
                          </div>
                            <div class="row">                                                               
                                <div class="col-lg-3">
                                     <div class="form-group text-left m-b-0 m-t-15">
                                            <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary waves-light" OnClick="btn_submit_Click" Text="Carian"/>
                                            <asp:Button ID="btn_cancel" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;"/>
                                     </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">   
                            <asp:GridView ID="GridDataTable7" CssClass="table table-striped table-bordered dt-responsive nowrap" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDataTable7_PreRender" DataKeyNames="record_id" OnRowDeleting="GridDataTable7_RowDeleting">
                                <Columns>
                                    <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:BoundField HeaderText="Status" DataField="color" ItemStyle-Width="10%"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Justifikasi / Halangan">
                                            <ItemTemplate>
                                            <div class="rest-max-height-65" style="overflow:auto">
                                                    <%#Eval("comment") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    <%--<asp:BoundField HeaderText="Justifikasi/Kaveat" DataField="comment"></asp:BoundField>--%>
                                    <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                    <%--<asp:BoundField HeaderText="Data Wujud (Ya/Tidak)" DataField="date" ItemStyle-Width="10%"></asp:BoundField>--%>
                                    <asp:TemplateField HeaderText="Maklumat" ItemStyle-Width="5%" ItemStyle-CssClass="ta-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" CssClass="fa fa-edit" Font-Underline="False" OnClick="lnkEdit_Click"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Buang" ItemStyle-Width="5%" ItemStyle-CssClass="ta-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkDelete" runat="server" CssClass="fa fa-trash no-loader" Font-Underline="False" OnClientClick="if (!confirm('Adakah anda mahu rekod ini dipadamkan?')) return false;"  CommandName="Delete"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <table runat="server" id="log_empty" class="table table-striped table-bordered dt-responsive nowrap">
                                <thead>
                                    <tr>
                                        <th>Kod Kawasan</th>
                                        <th>Nama Kawasan</th>
                                        <th>Status</th>
                                        <th>Justifikasi / Halangan</th>
                                        <th>Tarikh</th> 
                                        <th>Maklumat</th> 
                                        <th>Buang</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="7" class="ta-center" style="padding:15px;"> No Data Available</td>
                                    </tr> 
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</asp:Content>