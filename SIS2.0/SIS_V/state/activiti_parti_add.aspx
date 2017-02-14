<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_parti_add.aspx.cs" Inherits="SIS_V.state.activiti_parti_add"  MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div class="row">
            <div class="col-lg-12">
                <div class="card-box">
                    <h4 class="m-t-0 header-title"><b>Tambah Maklumat Parti Bertanding</b></h4>
                    <p class="text-muted font-13 m-b-30">
                        Description (if needed).
                    </p>
                    <form action="#" data-parsley-validate novalidate>
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Negeri</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Parlimen</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">DUN</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="form-group">
                                    <label for="userName">Daerah Mengundi</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Pilihanraya</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Parti</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tarikh</label>
                                    <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="date">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Masa</label>
                                    <input type="text" name="nick" parsley-trigger="change" required class="form-control" id="time">
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label for="userName">Jenis Maklumat</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Sumber Maklumat</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="form-group">
                                    <label for="userName">Tahap Kesahihan Maklumat</label>
                                    <select class="form-control">
                                        <option>Sila Pilih</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <textarea class="form-control" style="width: 100%; min-height: 300px"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-left m-b-0 m-t-15">
                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                Simpan
                            </button>
                            <button type="reset" class="btn btn-default waves-effect waves-light m-l-5">
                                Batal
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</asp:Content>

