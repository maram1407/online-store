using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Online_Store
{
    public partial class MyData : System.Web.UI.Page
    {
        string Password = "";
        string Username = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] != null)
            {
                
                if (!IsPostBack)
                {
                    
                    BindGridview();
                }
                
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }

        }
        private void BindGridview()
        {

            string UserIDD = Session["USERID"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("select Username ,Password from tblUsers where Uid=@UserID ", con);
            cmd.Parameters.AddWithValue("@UserID", UserIDD);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(ds, "dt");
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Password = ds.Tables[0].Rows[0]["Password"].ToString();

                txtPrice.Text = Password;

                Username = ds.Tables[0].Rows[0]["Username"].ToString();
                txtSize.Text = Username;
            }
            else
            {

            }
            con.Close();
        }

        protected void btnUpdateSubCategory_Click(object sender, EventArgs e)

        {
            //if (txtSize.Text != string.Empty && txtPrice.Text != string.Empty )
            //{
                string UserIDD = Session["USERID"].ToString();
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                SqlCommand cmd = new SqlCommand("update tblUsers set Username=@username,Password=@password where Uid=@UserID", con);
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                cmd.Parameters.AddWithValue("@username", txtSize.Text);
                cmd.Parameters.AddWithValue("@password", txtPrice.Text);

                cmd.ExecuteNonQuery();
            
        }

        protected void MyOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyOrders.aspx");
        }
    }
}