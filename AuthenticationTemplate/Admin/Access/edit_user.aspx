<%@ Page Language="C#" MasterPageFile="~/Site.Master" %>

<%@ Register Src="../../_controls/_navUsers.ascx" TagName="_navUsers" TagPrefix="uc1" %>
<%@ Register Src="../../_controls/_navAdmin.ascx" TagName="_navAdmin" TagPrefix="uc2" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="RTAWeb.SendMail" %>
<script runat="server">
    string username;

    MembershipUser user;


    private void Page_Load()
    {
        username = Request.QueryString["username"];
        if (username == null || username == "")
        {
            Response.Redirect("users.aspx");
        }
        user = Membership.GetUser(username);
        UserUpdateMessage.Text = "";
        //JurisdictionDropdown.DefaultItem.Text = GetJurisdiction();
        //Juris_TextBox.Text = "Jurisdiction:    " + HttpContext.Current.Profile.GetPropertyValue("Jurisdiction");
        if (!IsPostBack)
        {
            //ProfileBase userProfile = ProfileBase.Create(username, true);

            //Jurisdiction_DDL.SelectedValue = (string)userProfile.GetPropertyValue("Email");
        }
    }

    private string GetJurisdiction()
    {
        var id = user.ProviderUserKey;
        string jurisdiction;

        var sql =
               "SELECT [dbo].[ExtendedUserData].[Jurisdiction] " +
               "FROM [dbo].[ExtendedUserData] " +
               "WHERE  [dbo].[ExtendedUserData].[UserID] = @UserID";

        using (
                       var con =
                           new SqlConnection(
                               ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
        {
            try
            {
                con.Open();
                var command = new SqlCommand(sql, con);
                command.Parameters.AddWithValue("@UserID", id);
                jurisdiction = (string)command.ExecuteScalar();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.ToString());
                throw new ArgumentNullException();
            }
        }
        return jurisdiction;
    }

    protected void UserInfo_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        //Need to handle the update manually because MembershipUser does not have a
        //parameterless constructor  

        user.Email = (string)e.NewValues[0];
        user.Comment = (string)e.NewValues[1];
        user.IsApproved = (bool)e.NewValues[2];

        try
        {
            // Update user info:
            Membership.UpdateUser(user);

            // Update user roles:
            UpdateUserRoles();

            UserUpdateMessage.Text = "Update Successful.";

            e.Cancel = true;
            UserInfo.ChangeMode(DetailsViewMode.ReadOnly);
        }
        catch (Exception ex)
        {
            UserUpdateMessage.Text = "Update Failed: " + ex.Message;

            e.Cancel = true;
            UserInfo.ChangeMode(DetailsViewMode.ReadOnly);
        }
    }

    private void Page_PreRender()
    {
        // Load the User Roles into checkboxes.
        UserRoles.DataSource = Roles.GetAllRoles();
        UserRoles.DataBind();

        // Disable checkboxes if appropriate:
        if (UserInfo.CurrentMode != DetailsViewMode.Edit)
        {
            foreach (ListItem checkbox in UserRoles.Items)
            {
                checkbox.Enabled = false;
            }
        }

        // Bind these checkboxes to the User's own set of roles.
        string[] userRoles = Roles.GetRolesForUser(username);
        foreach (string role in userRoles)
        {
            ListItem checkbox = UserRoles.Items.FindByValue(role);
            checkbox.Selected = true;
        }
    }

    private void UpdateUserRoles()
    {
        foreach (ListItem rolebox in UserRoles.Items)
        {
            if (rolebox.Selected)
            {
                if (!Roles.IsUserInRole(username, rolebox.Text))
                {
                    Roles.AddUserToRole(username, rolebox.Text);
                }
            }
            else
            {
                if (Roles.IsUserInRole(username, rolebox.Text))
                {
                    Roles.RemoveUserFromRole(username, rolebox.Text);
                }
            }
        }
    }

    private void UpdateJuris(object sender, EventArgs e)
    {
        username = Request.QueryString["username"];
    }

    private void DeleteUser(object sender, EventArgs e)
    {
        //Membership.DeleteUser(username, false); // DC: My apps will NEVER delete the related data.
        Membership.DeleteUser(username, true); // DC: except during testing, of course!
        DeleteUserFromStatusChange(username.ToString().ToLower());
        Response.Redirect("users.aspx");
    }

    private void UnlockUser(object sender, EventArgs e)
    {
        // Dan Clem, added 5/30/2007 post-live upgrade.

        // Unlock the user.
        user.UnlockUser();

        // DataBind the GridView to reflect same.
        UserInfo.DataBind();
    }

    private void DeleteUserFromStatusChange(string user)
    {
        var sql = "DELETE FROM [RTAUserStatusChange] WHERE [User] = @User";

        using (
                       var con =
                           new SqlConnection(
                               ConfigurationManager.ConnectionStrings["RTATipData"].ConnectionString))
        {
            try
            {
                con.Open();
                var command = new SqlCommand(sql, con);
                command.Parameters.AddWithValue("@User", user);
                var res = command.ExecuteScalar();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception.ToString());
                throw new ArgumentNullException();
            }
        }
    }

    //private void JurisdictionChange(object sender, RadComboBoxSelectedIndexChangedEventArgs radComboBoxSelectedIndexChangedEventArgs)
    //{
    //    var jurisdictionValue = JurisdictionDropdown.SelectedItem.Text;
    //    var id = user.ProviderUserKey;

    //    var sql =
    //           "UPDATE [dbo].[ExtendedUserData] SET  [dbo].[ExtendedUserData].[Jurisdiction] = @Jurisdiction " +
    //           "WHERE  [dbo].[ExtendedUserData].[UserID] = @UserID";

    //    using (
    //                   var con =
    //                       new SqlConnection(
    //                           ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
    //    {
    //        try
    //        {
    //            con.Open();
    //            var command = new SqlCommand(sql, con);
    //            command.Parameters.AddWithValue("@Jurisdiction", jurisdictionValue);
    //            command.Parameters.AddWithValue("@UserID", id);
    //            var jurisdiction = command.ExecuteScalar();
    //            Session["Jurisdiction"] = jurisdiction;
    //        }
    //        catch (Exception exception)
    //        {
    //            Console.WriteLine(exception.ToString());
    //            throw new ArgumentNullException();
    //        }
    //    }
    //}

    private void EmailRoleAssigned_OnClick(object sender, EventArgs e)
    {
        var message = "Hello " + username + ".  The account manager has assigned you a role and you now have access " +
                      "to the RTA web portal." + "<br/>" +
                      "<a href='https://gismaps.pagnet.org/RTAWeb/'>Click Here</a> to access." + "<br/>" +
                      "Thank you.";

        //SendEmail.Send("RTA Role assigned.", message, username);
        EmailRoleAssigned.Visible = false;
        sentEmail.Visible = true;

    }

</script>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <center>
		<uc2:_navAdmin ID="_navAdmin1" runat="server" />
		<table class="dtable">
			<tr>
				<th>
					User Information
				</th>
			</tr>
			<tr>
				<td class="details" valign="top">
					<uc1:_navUsers ID="_navUsers1" runat="server" />
					<br />
					<div style="text-align:left;width:75px">
					<h3>Roles:</h3>
					<asp:CheckBoxList ID="UserRoles" runat="server" />
                     <asp:Button ID="EmailRoleAssigned" runat="server" OnClick="EmailRoleAssigned_OnClick" Text="Email User Role assigned"
                                    CssClass="btn btn-default" /> 
                    <div id="sentEmail" runat="server" Visible="False" ><p style="color: darkred">Email Sent.</p></div>
					</div>
					<h3>Main Info:</h3>
                    
              
                    <br/>
					
				<%--	<asp:SqlDataSource ID="Jurisdiction_DataSource" runat="server" 
						ConnectionString="<%$ ConnectionStrings:RTATipData %>" 
						SelectCommand="SELECT [Name] FROM [Jurisdiction]">
					</asp:SqlDataSource>--%>

					<asp:DetailsView ID="UserInfo"
						runat="server"
						AutoGenerateRows="False" 
						DataSourceID="MemberData" 
						OnItemUpdating="UserInfo_ItemUpdating"
						>
						<Fields>
							<asp:BoundField DataField="UserName" HeaderText="User Name" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="Comment" HeaderText="Comment" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:CheckBoxField DataField="IsApproved" HeaderText="Active User" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:CheckBoxField DataField="IsLockedOut" HeaderText="Is Locked Out" ReadOnly="true" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:CheckBoxField DataField="IsOnline" HeaderText="Is Online" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="CreationDate" HeaderText="CreationDate" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="LastLoginDate" HeaderText="LastLoginDate" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="LastLockoutDate" HeaderText="LastLockoutDate" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:BoundField DataField="LastPasswordChangedDate" HeaderText="LastPasswordChangedDate" ReadOnly="True" HeaderStyle-CssClass="detailheader" ItemStyle-CssClass="detailitem" />
							<asp:CommandField ButtonType="button" ShowEditButton="true" EditText="Edit User Info" />

						</Fields>
					</asp:DetailsView>
					
					<div class="alert" style="padding: 5px;">
						<asp:Literal ID="UserUpdateMessage" runat="server">&nbsp;</asp:Literal>
					</div>
					
					<div style="text-align: center; width: 100%; margin: 20px 0px;">
						<asp:Button ID="Button1" runat="server" Text="Unlock User" OnClick="UnlockUser" OnClientClick="return confirm('Click OK to unlock this user.')" />
						&nbsp;&nbsp;&nbsp;
						<asp:Button ID="Button2" runat="server" Text="Delete User" OnClick="DeleteUser" OnClientClick="return confirm('Are Your Sure?')" />
						<%--<asp:Button ID="Button3" runat="server" Text="Update Jurisdiction" OnClick="UpdateJuris" OnClientClick="return confirm('Are Your Sure?')" />--%>
					
					</div>
					
					<asp:ObjectDataSource ID="MemberData" runat="server" 
						DataObjectTypeName="System.Web.Security.MembershipUser"
						SelectMethod="GetUser" 
						UpdateMethod="UpdateUser" 
						TypeName="System.Web.Security.Membership">
						<SelectParameters>
							<asp:QueryStringParameter Name="username" QueryStringField="username" />
						</SelectParameters>
					</asp:ObjectDataSource>
				</td>
			</tr>
		</table>
	</center>
</asp:Content>
