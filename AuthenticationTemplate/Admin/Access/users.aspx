<%@ Page Language="C#" MasterPageFile="~/site.master" %>

<%@ Register Src="~/_controls/_navUsers.ascx" TagName="_navUsers" TagPrefix="uc1" %>
<%@ Register Src="../../_controls/_navAdmin.ascx" TagName="_navAdmin" TagPrefix="uc2" %>
<%@ Register TagPrefix="dc" TagName="alphalinks" Src="~/_controls/alphalinks.ascx" %>

<script runat="server">
	private void Page_PreRender()
	{
		if (Alphalinks.Letter == "All")
		{
			Users.DataSource = Membership.GetAllUsers();			
		}
		else
		{
			Users.DataSource = Membership.FindUsersByName(Alphalinks.Letter + "%");
		}
		Users.DataBind();
	}

	private void Users_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
	{
		if ((e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.EmptyDataRow))
		{
			System.Data.DataRowView view = (System.Data.DataRowView)e.Row.DataItem;
			string thisUser = e.Row.Cells[0].Text;
			object value = ProfileBase.Create(thisUser).GetPropertyValue("Jurisdiction");
			e.Row.Cells[1].Text = "TEST"; //value.ToString() ;			
		}
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
					Users by Name
				</th>
			</tr>
			<tr>
				<td  valign="top" class="details">
					<center>
					<uc1:_navUsers ID="_navUsers1" runat="server" />
					User Name filter:&nbsp;&nbsp;&nbsp;
					<dc:alphalinks runat="server" ID="Alphalinks" />
					</center>
					<br />
					<br />
					<asp:GridView ID="Users" runat="server" AutoGenerateColumns="false" CssClass="dtable" 
						AlternatingRowStyle-CssClass="odd" GridLines="none" AllowSorting="True" >
						<Columns>
							<asp:TemplateField>
								<HeaderTemplate>
									User Name
								</HeaderTemplate>
								<ItemTemplate>
									<a href="edit_user.aspx?username=<%# Eval("UserName") %>"><%# Eval("UserName") %></a>
								</ItemTemplate>
							</asp:TemplateField>

							<asp:TemplateField HeaderText="Jurisdiction" >
								<ItemTemplate>
									<asp:Label ID="Juris_Label" runat="server" />
								</ItemTemplate>
							</asp:TemplateField>
							
							<asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"/>
							<asp:BoundField DataField="comment" HeaderText="Comments" />
							<asp:BoundField DataField="creationdate" HeaderText="Creation Date" SortExpression="creationdate" />
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
