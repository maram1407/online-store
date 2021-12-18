using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
namespace Online_Store
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string randomCode;
        public static string to;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPass_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblUsers where Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", txtEmailID.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    String myGUID = Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);

                    SqlCommand cmd1 = new SqlCommand("Insert into ForgotPass(Id,Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "',GETDATE())", con);
                    cmd1.ExecuteNonQuery();


                    //Send Reset link via Email
                   

                    String ToEmailAddress = dt.Rows[0][3].ToString();
                    String Username = dt.Rows[0][1].ToString();
                    String EmailBody = "Hi ," + Username + ",<br/><br/>Click the link below to reset your password<br/> <br/> http://localhost:44359/RecoverPassword.aspx?id=" + myGUID;


                    //string from, pass, messageBody;
                    //Random rand = new Random();
                    //randomCode = (rand.Next(999999)).ToString();
                    //MailMessage message = new MailMessage();
                    //to = (txtEmailID.Text).ToString();
                    //from = "maramn779@gmail.com";
                    //pass = "123";
                    //messageBody = "your reset code is " + randomCode; 
                    //message.To.Add(to);
                    //message.From = new MailAddress(from);
                    //message.Body = messageBody;

                    //SmtpClient smtp = new SmtpClient("smtp.gmail.com");
                    //smtp.EnableSsl = true;
                    //smtp.Port = 587;
                    //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //smtp.Credentials = new NetworkCredential(from, pass);
                    //smtp.Send(message);




                    MailMessage PassRecMail = new MailMessage("maramn779@gmail.com", ToEmailAddress);

                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml = true;
                    PassRecMail.Subject = "Reset Password";

                    using (SmtpClient client = new SmtpClient())
                    {
                        client.EnableSsl = true;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential("maramn779@gmail.com", "123");
                        client.Host = "smtp.gmail.com";
                        client.Port = 587;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;

                        client.Send(PassRecMail);
                    }

                    //SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                    //SMTP.Credentials = new NetworkCredential()
                    //{
                    //    UserName = "YourEmail@gmail.com",
                    //    Password = "yourpassword"
                    //};
                    ////--------------
                    //SMTP.EnableSsl = true;
                    //SMTP.Send(PassRecMail);

                    lblResetPassMsg.Text = "Reset Link send ! Check YOur email for reset password";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Green;
                    txtEmailID.Text = string.Empty;
                }
                else
                {
                    lblResetPassMsg.Text = "OOps! This Email Does not Exist...Try agian ";
                    lblResetPassMsg.ForeColor = System.Drawing.Color.Red;
                    txtEmailID.Text = string.Empty;
                    txtEmailID.Focus();

                }




            }
        }
    }
}