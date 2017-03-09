<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AuthenticationTemplate.Account.Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>

    <div class="row">
       <section id="socialLoginForm">
            <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" OnLoggedIn="LoginUser_OnLoggedIninUser_OnLoggedIn">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="Literal1" />
                        </p>
                    </asp:PlaceHolder>
                    <span class="failureNotification">
                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                    </span>
                    <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                        ValidationGroup="LoginUserValidationGroup" />
                    <div class="form-horizontal">
                        <h4>Account Information</h4>
                        <hr />
                        <div class="form-group">
                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="UserName" CssClass="col-md-1 control-label">Email</asp:Label>

                            <div class="col-md-3">
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                    ToolTip="Email is required."
                                    ValidationGroup="LoginUserValidationGroup" CssClass="text-danger" ErrorMessage="The email field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="col-md-1 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="LoginUserValidationGroup" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <div class="checkbox">
                                    <asp:CheckBox runat="server" ID="RememberMe" />
                                    <asp:Label ID="RemembermeLabel" runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <asp:Button ID="LoginButton" CommandName="Login" runat="server" Text="Log in" CssClass="btn btn-default" ValidationGroup="LoginUserValidationGroup" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <asp:HyperLink ID="ChangePasswordHyperLink" runat="server" NavigateUrl="Forgot.aspx" EnableViewState="false">Forgot Password?</asp:HyperLink>
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="col-md-offset-1 col-md-10">
                                <asp:HyperLink ID="Register" runat="server" NavigateUrl="Register.aspx" EnableViewState="false">Register New User?</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>
        </section>
    </div>
</asp:Content>
