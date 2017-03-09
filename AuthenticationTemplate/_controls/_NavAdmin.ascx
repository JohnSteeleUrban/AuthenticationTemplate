<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="_NavAdmin.ascx.cs" Inherits="test45._controls._NavAdmin" %>

<p>
<asp:HyperLink ID="AccessRuleMgmt" runat="server" NavigateUrl="~/admin/access/access_rules.aspx">Access Rule Mgmt</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="AccessRuleSummary" runat="server" NavigateUrl="~/admin/access/access_rule_summary.aspx">Access Rule Summary</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="UserList" runat="server" NavigateUrl="~/admin/access/users.aspx">User List</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="AddUser" runat="server" NavigateUrl="~/admin/access/add_user.aspx">Add User</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="RoleManagement" runat="server" NavigateUrl="~/admin/access/roles.aspx">Role Management</asp:HyperLink>
</p>
