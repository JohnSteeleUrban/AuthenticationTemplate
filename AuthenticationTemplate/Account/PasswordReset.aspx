<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PasswordReset.aspx.cs" Inherits="AuthenticationTemplate.Account.PasswordReset" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>


    <h1>Change Password</h1>

    <asp:LoginView ID="LoginView1" runat="server"
        Visible="true">
        <LoggedInTemplate>
            <asp:LoginName ID="LoginName1" runat="server" FormatString="You are logged in as {0}." />
            <br />
        </LoggedInTemplate>
        <AnonymousTemplate>
            You are not logged in
        </AnonymousTemplate>
    </asp:LoginView>
    <br />

    <asp:ChangePassword ID="ChangePassword1" runat="server"
        RenderOuterTable="false"
        CancelDestinationPageUrl="~/Default.aspx"
        DisplayUserName="true"
        OnChangingPassword="_ChangingPassword"
        ContinueDestinationPageUrl="~/Default.aspx">
        <ChangePasswordTemplate>
            <div class="form-horizontal">
                <asp:ValidationSummary runat="server" CssClass="text-danger" />
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">Email</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="UserName" CssClass="form-control" TextMode="Email" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                            CssClass="text-danger" ErrorMessage="The email field is required." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="CurrentPassword" CssClass="col-md-2 control-label">Password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="CurrentPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                            CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                </div>

                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="NewPassword" CssClass="col-md-2 control-label">New  Password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="NewPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                            CssClass="text-danger" ErrorMessage="The password field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
                    <div class="col-md-10">
                        <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                        <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-10">
                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" Text="Change Password" CssClass="btn btn-default"
                        ValidationGroup="ChangeUserPasswordValidationGroup" />
                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />

                </div>
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
    <br />
    <asp:Label ID="Message1" runat="server" ForeColor="Red" />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server"
        NavigateUrl="~/Default.aspx">
      Home
    </asp:HyperLink>
</asp:Content>
