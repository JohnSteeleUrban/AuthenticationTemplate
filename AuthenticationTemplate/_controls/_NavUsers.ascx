<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="_NavUsers.ascx.cs" Inherits="test45._controls._NavUsers" %>


<p>
<asp:HyperLink ID="UsersByNameLink" runat="server" NavigateUrl="~/admin/access/users.aspx">Users By Name</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="UsersByRoleLink" runat="server" NavigateUrl="~/admin/access/users_by_role.aspx">Users By Role</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="ActiveUsersLink" runat="server" NavigateUrl="~/admin/access/active_users.aspx">Active Users</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="OnlineUsersLink" runat="server" NavigateUrl="~/admin/access/online_users.aspx">Online Users</asp:HyperLink>&nbsp;&nbsp;|&nbsp;
<asp:HyperLink ID="LockedUsersLink" runat="server" NavigateUrl="~/admin/access/locked_users.aspx">Locked Out Users</asp:HyperLink>
</p>
