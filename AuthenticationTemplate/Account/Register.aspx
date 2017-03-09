<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="AuthenticationTemplate.Account.Register" %>

<%@ Import Namespace="System.ServiceModel.Security" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h2><%: Title %></h2>
    <div id="register" class="row" runat="server">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:CreateUserWizard ID="RegisterUser" runat="server" EnableViewState="false" OnCreatedUser="RegisterUser_OnCreatedUser" OnCreatingUser="RegisterUser_OnCreatingUser">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="RegisterUserWizardStep" runat="server">
                    <ContentTemplate>
                        <h4>Create a New Account
                        </h4>
                        <span class="failureNotification">
                            <asp:Literal ID="ErrorMessage" runat="server"></asp:Literal>
                        </span>
                        <asp:ValidationSummary ID="RegisterUserValidationSummary" runat="server" CssClass="text-danger"
                            ValidationGroup="RegisterUserValidationGroup" />
                        <hr />
                        <div class="form-horizontal">
                            <div style="visibility: hidden">
                                <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                            </div>

  <%--                          <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Jurisdiction" CssClass="col-md-4 control-label">Jurisdiction</asp:Label>
                                <div class="col-md-7">
                                    <asp:DropDownList ID="Jurisdiction" runat="server"
                                        DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name" CssClass="form-control"
                                        Width="324px" AppendDataBoundItems="True">
                                        <asp:ListItem Text="Select" Value="0" />
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:RTATipData %>"
                                        SelectCommand="SELECT [Name] FROM [Jurisdiction]"></asp:SqlDataSource>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Jurisdiction"
                                        CssClass="text-danger" ErrorMessage="Jurisdiction is required."
                                        ValidationGroup="RegisterUserValidationGroup" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>--%>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-4 control-label">Email</asp:Label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="Email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                        CssClass="text-danger" ErrorMessage="The email field is required."
                                        ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="col-md-4 control-label">Password</asp:Label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                        CssClass="text-danger" ErrorMessage="The password field is required."
                                        ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-4 control-label">Confirm Password:</asp:Label>
                                <div class="col-md-7">
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required."
                                        ID="ConfirmPasswordRequired" runat="server"
                                        ToolTip="Confirm Password is required." ValidationGroup="RegisterUserValidationGroup"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                        ValidationGroup="RegisterUserValidationGroup">The passwords don't match.</asp:CompareValidator>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-offset-4 col-md-6">
                                    <asp:Button ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Register"
                                        ValidationGroup="RegisterUserValidationGroup" CssClass="btn btn-default" />
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
     <div id="emailNote" Visible="False" class="row" runat="server">
         <h3>Thank you!</h3>
         <h4>An email notification will be sent to you once your user is assigned access by the program manager.</h4>

     </div>

    <script language="javascript">
        //document.getElementById('Email').value = document.getElementById('UserName').value;
    </script>
</asp:Content>
