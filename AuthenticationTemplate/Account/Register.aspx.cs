using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AuthenticationTemplate.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {

        }

        protected void RegisterUser_OnCreatedUser(object sender, EventArgs e)
        {
            var newUser = Membership.GetUser(RegisterUser.Email);
            if (newUser== null) throw new ArgumentNullException(nameof(newUser));
            //AddUserToStatusChangeCheck(newUser);//this will add a new user to the table RTAUserStatusChange for later tracking updates
            var newUserId = newUser.ProviderUserKey;
            //var jurisdictionList =(DropDownList) RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("Jurisdiction");
            //var jurisdictionValue = jurisdictionList.SelectedValue.Trim();
            
            //var sql =
            //    "INSERT INTO ExtendedUserData(UserID, UserName, Jurisdiction) Values (@UserID, @Username, @Jurisdiction)";


            //using (
            //               var con =
            //                   new SqlConnection(
            //                       ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString))
            //{
            //    try
            //    {
            //        con.Open();
            //        var command = new SqlCommand(sql, con);
            //        command.Parameters.AddWithValue("@UserID", newUserId);
            //        command.Parameters.AddWithValue("@Username", newUserId);
            //        command.Parameters.AddWithValue("@Jurisdiction", jurisdictionValue);
            //        var jurisdiction = command.ExecuteScalar();
            //        Session["Jurisdiction"] = jurisdiction;
            //    }
            //    catch (Exception exception)
            //    {
            //        Console.WriteLine(exception.ToString());
            //        throw new ArgumentNullException();
            //    }
            //}
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, true);
            register.Visible = false;
            emailNote.Visible = true;
            var message = "New User: " + RegisterUser.UserName + " has just registered." + "<br/>" +
                          "Please assign them to a role. " + "<br/>" + "Thank you.";
            //SendEmail.Send("New RTA User Alert!", message, "cgil@pagregion.com");
        }

     

        private void AddUserToStatusChangeCheck(MembershipUser user)
        {
            var sql = "INSERT INTO RTAUserStatusChange ([User]) VALUES(@User)";

            using (
                           var con =
                               new SqlConnection(
                                   ConfigurationManager.ConnectionStrings["RTATipData"].ConnectionString))
            {
                try
                {
                    con.Open();
                    var command = new SqlCommand(sql, con);
                    command.Parameters.AddWithValue("@User", user.ToString().ToLower());
                    var res = command.ExecuteScalar();                   
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception.ToString());
                    throw new ArgumentNullException();
                }
            }
        }

        protected void RegisterUser_OnCreatingUser(object sender, LoginCancelEventArgs e)
        {
            RegisterUser.UserName = RegisterUser.Email;
        }
    }
}