<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Directory.aspx.cs" Inherits="AuthenticationTemplate.Admin.Access.Directory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h1>Administrator's Hub</h1>
    <br />
    <br />

    <hr class="box-shadow--4dp" />
    <div class="row">
        <div class="col-md-4">
            <h2>Users</h2>
            <p>
                Please Click below to Manage User Roles.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="users.aspx">Manage Users &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Log In Status Tracking</h2>
            <p>
                Please Click below to check user Status Update standing and send email notifications.
            </p>
            <p>
                <a class="btn btn-default" href="Tracking.aspx">Update Tracking &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Status History</h2>
            <p>
                Please Click below to check the update history of the Status Grid.
            </p>
            <p>
                <a class="btn btn-default" href="History.aspx">History &raquo;</a>
            </p>
        </div>
    </div>
    <hr class="box-shadow--4dp" />
    <div class="row">
        <div class="col-md-4">
            <h2>Tip Data</h2>
            <p>
                Check Tip Data for new and unassigned RTAId's needed
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="TipData.aspx">Check Data&raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Published Status Data</h2>
            <p>
                Review and print reports from the previously submitted Project Status.  
                Reset to present changes option is available here.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="ResetStatusUtility.aspx">Published Status&raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Upload Budget Adjustment</h2>
            <p>
                Upload the new Excel sheet that is auto-downloaded an adjustment is needed.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="BudgetAdjustmentUpload.aspx">Published Status&raquo;</a>
            </p>
        </div>
    </div>
</asp:Content>
