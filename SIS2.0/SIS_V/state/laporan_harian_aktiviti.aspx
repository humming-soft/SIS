<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="laporan_harian_aktiviti.aspx.cs" Inherits="SIS_V.state.laporan_harian_more" MasterPageFile="~/state/state_master.Master" %>

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
                <h4 class="m-t-0 header-title"><b>Paparan laporan Harian Aktiviti</b></h4>
                <div class="grid-structure m-t-30">
                    <div class="grid-container">
                        <h5 class="m-t-0 header-title" style="font-size:13px"><b>Filter laporan Harian Aktiviti</b></h5>
                        <div class="row">
                                <div class="alert alert-danger alert-dismissable" id="log_valid" runat="server">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <p>Please Select from the list to filter the result!</p>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Kawasan</label>
                                        <asp:DropDownList ID="dp_kawasan" CssClass="form-control area-list" runat="server"
                                        ClientIDMode="Static" DataTextField="area_name" DataValueField="area_id">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label for="userName">Jenis Aktiviti</label>
                                    <asp:DropDownList ID="dp_aktiviti" CssClass="form-control parlimen-list" runat="server"
                                        ClientIDMode="Static" DataTextField="activity_details" DataValueField="activity_id">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Parti</label>
                                    <asp:DropDownList ID="dp_parti" CssClass="form-control" runat="server"
                                        ClientIDMode="Static" DataTextField="party_name_bm" DataValueField="party_id">
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
                            <asp:GridView ID="GridDataTable3" CssClass="table table-striped table-bordered dt-responsive nowrap" CellSpacing="0" Width="100%" runat="server" ClientIDMode="Static" AutoGenerateColumns="false" OnPreRender="GridDtActivity_PreRender">                                   
                                <Columns>
                                    <asp:BoundField HeaderText="Kod Kawasan" DataField="areacode" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:BoundField HeaderText="Nama Kawasan" DataField="areaname" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:BoundField HeaderText="Jenis Aktiviti" DataField="activity_type" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Butiran Aktiviti">
                                        <ItemTemplate>
                                            <div class="rest-max-height-65" style="overflow:auto">
                                                <%#Eval("details") %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Parti" DataField="party_name_bm" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:BoundField HeaderText="Tarikh" DataField="date" ItemStyle-Width="10%"></asp:BoundField>
                                    <asp:BoundField HeaderText="Masa" DataField="time" ItemStyle-Width="10%"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <table runat="server" id="log_empty" class="table table-striped table-bordered dt-responsive nowrap">
                                <thead>
                                    <tr>
                                        <th>Kod Kawasan</th>
                                        <th>Nama Kawasan</th>
                                        <th>Jenis Aktiviti</th>
                                        <th>Butiran Aktiviti</th>
                                        <th>Parti</th>
                                        <th>Tarikh</th>
                                        <th>Masa</th>
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