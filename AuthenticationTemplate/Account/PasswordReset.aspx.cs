using System;
using System.Web.UI.WebControls;

namespace AuthenticationTemplate.Account
{
    public partial class PasswordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ChangePassword1.ChangingPassword += new LoginCancelEventHandler(this._ChangingPassword);
        }

       protected void _ChangingPassword(Object sender, LoginCancelEventArgs e)
        {
            if (ChangePassword1.CurrentPassword.ToString() == ChangePassword1.NewPassword.ToString())
            {
                Message1.Visible = true;
                Message1.Text = "Old password and new password must be different.  Please try again.";
                e.Cancel = true;
            }
            else
            {
                //after testing, this was needed to prevent error showing up after a first failed attempt.
                Message1.Visible = false;
            }
        }
    }
}