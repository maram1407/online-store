using System;
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
    public partial class MyOrders : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            divQtyError.Visible = false;
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    BindProductCart();

                    //  BindCartNumber();

                }
                else
                {
                    Response.Redirect("Signin.aspx");
                }
            }

        }


        private void BindProductCart()
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindUserOrders", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@UserID", UserIDD);
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    sda.Fill(dt);
                    RptrCartProducts.DataSource = dt;
                    RptrCartProducts.DataBind();
                    if (dt.Rows.Count > 0)
                    {
                        // string Total = dt.Compute("Sum(SubSAmount)", "").ToString();
                        string CartTotal = dt.Compute("Sum(SubPAmount)", "").ToString();
                        string CartQuantity = dt.Compute("Sum(Quantity)", "").ToString();
                        h4NoItems.InnerText = "Мои Заказы ( " + CartQuantity + " Item(s) )";
                        // int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                        int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));

                        //  spanCartTotal.InnerText = string.Format("{0:#,###.##}", double.Parse(CartTotal)) + "Руб. " + ".00";

                    }
                    else
                    {
                        h4NoItems.InnerText = "Заказов нет.";
                        // divAmountSect.Visible = false;

                    }
                }

            }
        }

        protected void RptrCartProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Int32 UserID = Convert.ToInt32(Session["USERID"].ToString());
            //This will add +1 to current quantity using PID
            if (e.CommandName == "DoPlus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_getUserOrderItems", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        //if (dt.Rows.Count > 0)
                        //{
                        //    Int32 updateQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                        //    SqlCommand myCmd = new SqlCommand("SP_UpdateCart", con)
                        //    {
                        //        CommandType = CommandType.StoredProcedure
                        //    };
                        //    myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                        //    myCmd.Parameters.AddWithValue("@CartPID", PID);
                        //    myCmd.Parameters.AddWithValue("@UserID", UserID);
                        //    con.Open();
                        //    Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                        //    con.Close();
                        //    BindProductCart();
                        //    //  BindCartNumber();
                        //}
                    }

                }
            }
           
        }
    }
}