<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="detail_info.aspx.cs" Inherits="SIS_V.state.detail_info" MasterPageFile="~/state/state_master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function detail_validate()
        {
            Detail_Info.init();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Melihat Maklumat Terperinci</b></h4>
                <div class="grid-structure m-t-30">
                    <div class="row">
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">Parlimen-DUN</label>
                                <asp:DropDownList ID="dp_kawasan" CssClass="form-control area-list" runat="server"
                                    ClientIDMode="Static" DataTextField="areacode" DataValueField="area_id">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group text-left m-b-0 m-t-15">
                                <asp:Button ID="btn_submit" runat="server" CssClass="btn btn-primary waves-light" Text="Carian" OnClick="btn_submit_Click" OnClientClick="detail_validate()" />
                                <asp:Button ID="btn_cancel" runat="server" CssClass="btn btn-default waves-light m-l-5" Text="Batal" CausesValidation="false" OnClientClick="this.form.reset();return false;" />
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:GridView ID="GridView_All" runat="server" CssClass="table table-striped table-bordered nowrap" AutoGenerateColumns="False" OnPreRender="GridView_All_PreRender">
                                <Columns>
                                    <asp:BoundField DataField="details" HeaderText="Details" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
