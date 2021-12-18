﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;
namespace Online_Store
{
    public partial class Products : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    if (Request.QueryString["BuyNow"] == "YES")
                    {

                    }
                    BindProductRepeater();
                   // BindCartNumber();

                }
            }
            else
            {
                if (Request.QueryString["BuyNow"] == "YES")
                {
                    Response.Redirect("SignIn.aspx");
                }
                else
                {
                    Response.Redirect("~/Index.aspx");
                }
            }

        }
        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("en-IN");
            ci.NumberFormat.CurrencySymbol = "₹";
            Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();
        }

        private void BindProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                        if (dt.Rows.Count <= 0)
                        {
                            Label1.Text = "Извините! В настоящее время в этой категории нет товаров.";
                        }
                        else
                        {
                            Label1.Text = "Отображение всех продуктов";
                        }
                    }
                }
            }
        }

        protected void btnCart2_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("~/Cart.aspx");
        }

        //public void BindCartNumber()
        //{
        //    if (Session["USERID"] != null)
        //    {
        //        string UserIDD = Session["USERID"].ToString();
        //        DataTable dt = new DataTable();
        //        using (SqlConnection con = new SqlConnection(CS))
        //        {
        //            SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
        //            {
        //                CommandType = CommandType.StoredProcedure
        //            };
        //            cmd.Parameters.AddWithValue("@UserID", UserIDD);
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                sda.Fill(dt);
        //                if (dt.Rows.Count > 0)
        //                {
        //                    string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
        //                    CartBadge.InnerText = CartQuantity;
        //                }
        //                else
        //                {
        //                    // _ = CartBadge.InnerText == 0.ToString();
        //                    CartBadge.InnerText = "0";
        //                }
        //            }
        //        }
        //    }
        //}


        protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
        {
            if (txtFilterGrid1Record.Text != string.Empty)
            {
                SqlConnection con = new SqlConnection(CS);
                con.Open();
                string qr = "select A.*,B.*,A.PPrice,B.Name as ImageName from tblProducts A   cross apply( select top 1 * from tblProductImages B where B.PID= A.PID order by B.PID desc )B where  A.PName like '" + txtFilterGrid1Record.Text + "%' order by A.PID desc";
                SqlDataAdapter da = new SqlDataAdapter(qr, con);
                string text = ((TextBox)sender).Text;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rptrProducts.DataSource = ds.Tables[0];
                    rptrProducts.DataBind();
                }
                else
                {

                }
            }
            else
            {
                BindProductRepeater();
            }

        }
    }
}