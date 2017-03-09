using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web.Security;

namespace RTAWeb.SendMail
{
    public static class SendEmail
    {
        private static string _sender = "RTA@pagnet.org";
        private static string _host = "pagnet.org";
        private static int _port = 27;

        public static void Send(string subject, string message, string reciever)
        {
            try
            {
                MailMessage mailMessage = new MailMessage
                {
                    IsBodyHtml = true,
                    From = new MailAddress(_sender)
                };
                mailMessage.To.Add(reciever);
                mailMessage.Bcc.Add("jUrban@pagregion.com");
                mailMessage.Subject = subject;
                mailMessage.Body = message;

                using (SmtpClient client = new SmtpClient(_host, _port))
                {
                    client.Send(mailMessage);
                }
            }
            catch (Exception exception)
            {
                Console.Write(exception.Message);
            }

        }
        //public static void SendTipUpdate()
        //{
        //    TipTableAdapter tipdata = new TipTableAdapter();
        //    DataTable adapter = tipdata.GetTipData();

        //    if (adapter.Rows.Count > 0)
        //    {
        //        string body = "The following tip id's do not have assigned RTAId's: <br />";
        //        body += ConvertDataTableToHTML(adapter);
        //        string subject = "Weekly Tip Update";
        //        Send(subject, body, "cgil@pagregion.com");
        //    }
        //}

        public static string ConvertDataTableToHTML(DataTable dt)
        {
            string html = "<table>";
            html += "<tr>";
            for (int i = 0; i < dt.Columns.Count; i++)
                html += "<td>" + dt.Columns[i].ColumnName + "</td>";
            html += "</tr>";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                html += "<tr>";
                for (int j = 0; j < dt.Columns.Count; j++)
                    html += "<td>" + dt.Rows[i][j].ToString() + "</td>";
                html += "</tr>";
            }
            html += "</table>";
            return html;
        }
    }
}
