﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activiti_bakal_ci_add.aspx.cs" Inherits="SIS_V.admin.activiti_bakal_ci_add" MasterPageFile="~/admin/Admin_Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="card-box">
                <h4 class="m-t-0 header-title"><b>Basic Form</b></h4>
                <p class="text-muted font-13 m-b-30">
                    Your awesome text goes here.
                </p>
                <form action="#" data-parsley-validate novalidate>
                    <div class="row">
                        <div class="col-lg-1">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="form-group">
                                <label for="userName">User Name*</label>
                                <select class="form-control">
                                    <option>select</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userName">User Name*</label>
                        <input type="text" name="nick" parsley-trigger="change" required placeholder="Enter user name" class="form-control" id="userName">
                    </div>
                    <div class="form-group">
                        <label for="emailAddress">Email address*</label>
                        <input type="email" name="email" parsley-trigger="change" required placeholder="Enter email" class="form-control" id="emailAddress">
                    </div>
                    <div class="form-group">
                        <label for="pass1">Password*</label>
                        <input id="pass1" type="password" placeholder="Password" required class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="passWord2">Confirm Password *</label>
                        <input data-parsley-equalto="#pass1" type="password" required placeholder="Password" class="form-control" id="passWord2">
                    </div>
                    <div class="form-group">
                        <div class="checkbox">
                            <input id="remember-1" type="checkbox">
                            <label for="remember-1">Remember me </label>
                        </div>
                    </div>

                    <div class="form-group text-right m-b-0">
                        <button class="btn btn-primary waves-effect waves-light" type="submit">
                            Submit
                        </button>
                        <button type="reset" class="btn btn-default waves-effect waves-light m-l-5">
                            Cancel
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
