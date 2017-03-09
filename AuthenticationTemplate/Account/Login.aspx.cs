using System;
using System.Web.Security;
using System.Web.UI;

namespace AuthenticationTemplate.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var txtEmail = LoginUser.FindControl("UserName");
            txtEmail.Focus();
        }

        protected void LogIn(object sender, EventArgs e)
        {

            if (IsValid)
            {
                if (Membership.ValidateUser(LoginUser.UserName, LoginUser.Password))
                {
                    var currentUser = Membership.GetUser(LoginUser.UserName);
                    //if (currentUser != null)
                    //{
                    //    var userId = currentUser.ProviderUserKey;

                    //    var sql = "SELECT Jurisdiction FROM extendeduserdata WHERE (UserID=@UserID)";

                    //    using (
                    //        var con =
                    //            new SqlConnection(
                    //                ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
                    //    {
                    //        try
                    //        {
                    //            con.Open();
                    //            var command = new SqlCommand(sql, con);
                    //            command.Parameters.AddWithValue("@UserID", userId);
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
                }
            }
        }

        protected void LoginUser_OnLoggedIninUser_OnLoggedIn(object sender, EventArgs e)
        {
            if (IsValid)
            {
                if (Membership.ValidateUser(LoginUser.UserName, LoginUser.Password))
                {
                    var currentUser = Membership.GetUser(LoginUser.UserName);
                    //    if (currentUser != null)
                    //    {
                    //        var userId = currentUser.ProviderUserKey;

                    //        var sql = "SELECT Jurisdiction FROM extendeduserdata WHERE (UserID=@UserID)";

                    //        using (
                    //            var con =
                    //                new SqlConnection(
                    //                    ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
                    //        {
                    //            try
                    //            {
                    //                con.Open();
                    //                var command = new SqlCommand(sql, con);
                    //                command.Parameters.AddWithValue("@UserID", userId);
                    //                var jurisdiction = command.ExecuteScalar();
                    //                Session["Jurisdiction"] = jurisdiction;
                    //            }
                    //            catch (Exception exception)
                    //            {
                    //                Console.WriteLine(exception.ToString());
                    //                throw new ArgumentNullException();
                    //            }
                    //        }
                    //    }
                    //}
                    Response.Redirect("~/ProjectStatus/DataExplorer.aspx");
                }
            }
        }
    }
}