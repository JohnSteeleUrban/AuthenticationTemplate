using System;
using System.Web.Security;
using System.Web.UI;
using RTAWeb.SendMail;

namespace AuthenticationTemplate.Account
{
    public partial class ForgotPassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Forgot(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var email = Membership.GetUserNameByEmail(Email.Text);
                MembershipUser user = Membership.GetUser(email);
                var password = user.ResetPassword();

                if (email == null)
                {
                    FailureText.Text = "The user either does not exist or is not confirmed.";
                    ErrorMessage.Visible = true;
                    return;
                }
                var message = "Your new Password is:\n" + password + "\n" + "\n";
                SendEmail.Send("New Password", message, email);
                loginForm.Visible = false;
                DisplayEmail.Visible = true;
            }
        }
    }
}