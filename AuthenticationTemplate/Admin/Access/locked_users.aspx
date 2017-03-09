<%@ Page Language="C#" MasterPageFile="~/site.master" %>

<%@ Register Src="../../_controls/_navUsers.ascx" TagName="_navUsers" TagPrefix="uc1" %>
<%@ Register Src="../../_controls/_navAdmin.ascx" TagName="_navAdmin" TagPrefix="uc2" %>
<script runat="server">
	private void Page_PreRender()
	{
		MembershipUserCollection allUsers = Membership.GetAllUsers();
		MembershipUserCollection filteredUsers = new MembershipUserCollection();
		bool isLockedOut = true;
		foreach (MembershipUser user in allUsers)
		{
			if (user.IsLockedOut == isLockedOut)
			{
				filteredUsers.Add(user);
			}
		}
		Users.DataSource = filteredUsers;
		Users.DataBind();
	}
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<center>
		<uc2:_navAdmin ID="_navAdmin1" runat="server" />
		<table class="dtable">
			<tr>
				<th>
					Locked Out Users
				</th>
			</tr>
			<tr>
				<td class="details" valign="top">
				<center>
					<uc1:_navUsers ID="_navUsers1" runat="server" />
					</center>
					<br />
					<asp:GridView runat="server" ID="Users" 
						AutoGenerateColumns="false" 
						CssClass="dtable"
						AlternatingRowStyle-CssClass="odd" 
						GridLines="none" 
						AllowSorting="true">
						<Columns>
							<asp:TemplateField>
								<HeaderTemplate>
									User Name</HeaderTemplate>
								<ItemTemplate>
									<a href="edit_user.aspx?username=<%# Eval("UserName") %>">
										<%# Eval("UserName") %></a>
								</ItemTemplate>
							</asp:TemplateField>
							<asp:BoundField DataField="email" HeaderText="Email" />
							<asp:BoundField DataField="comment" HeaderText="Comments" />
							<asp:BoundField DataField="creationdate" HeaderText="Creation Date" />
							<asp:BoundField DataField="lastlogindate" HeaderText="Last Login Date" />
							<asp:BoundField DataField="lastactivitydate" HeaderText="Last Activity Date" />
							<asp:BoundField DataField="isapproved" HeaderText="Is Active" />
							<asp:BoundField DataField="isonline" HeaderText="Is Online" />
							<asp:BoundField DataField="islockedout" HeaderText="Is Locked Out" />
						</Columns>
					</asp:GridView>
				</td>
			</tr>
		</table>
	</center>
</asp:Content>
