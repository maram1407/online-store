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
    public partial class Cart : System.Web.UI.Page
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
                   
                    BindCartNumber();
                   
                }
                else
                {
                    Response.Redirect("Signin.aspx");
                }
            }

        }

        //public void BindPriceData()
        //{
        //    if (Request.Cookies["CartPID"] != null)
        //    {
        //        string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
        //        string[] CookieDataArray = CookieData.Split(',');
        //        if (CookieDataArray.Length > 0)
        //        {
        //            DataTable dtBrands = new DataTable();
        //            Int64 CartTotal = 0;
        //            // Int64 Total = 0;
        //            for (int i = 0; i < CookieDataArray.Length; i++)
        //            {
        //                string PID = CookieDataArray[i].ToString().Split('-')[0];
        //                string ColorID = CookieDataArray[i].ToString().Split('-')[1];

        //                if (hdPidColorID.Value != null && hdPidColorID.Value != "")
        //                {
        //                    hdPidColorID.Value += "," + PID + "-" + ColorID;
        //                }
        //                else
        //                {
        //                    hdPidColorID.Value = PID + "-" + ColorID;
        //                }


        //                using (SqlConnection con = new SqlConnection(CS))
        //                {
        //                    using (SqlCommand cmd = new SqlCommand("select A.*,dbo.getColorName(" + ColorID + ") as ColorNamee,"
        //                        + ColorID + " as ColorIDD,ColorData.Name,ColorData.Extention from tblProducts A cross apply( select top 1 B.Name,Extention from tblProductImages B where B.PID=A.PID ) ColorData where A.PID="
        //                        + PID + "", con))
        //                    {
        //                        cmd.CommandType = CommandType.Text;
        //                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //                        {
        //                            sda.Fill(dtBrands);
        //                        }

        //                    }
        //                }
        //                CartTotal += Convert.ToInt64(dtBrands.Rows[i]["PPrice"]);
        //                // Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
        //            }
        //            divAmountSect.Visible = true;

        //            spanCartTotal.InnerText = CartTotal.ToString();
        //            // spanTotal.InnerText = "Rs. " + Total.ToString();
        //            // spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

        //            hdCartAmount.Value = CartTotal.ToString();
        //            //  hdCartDiscount.Value = (CartTotal - Total).ToString();
        //            // hdTotalPayed.Value = Total.ToString();
        //        }
        //        else
        //        {
        //            //TODO Show Empty Cart
        //            Response.Redirect("~/Products.aspx");
        //        }
        //    }
        //    else
        //    {
        //        //TODO Show Empty Cart
        //        Response.Redirect("~/Products.aspx");
        //    }
        //}

        public void BindCartNumber()
        {
            if (Session["USERID"] != null)
            {
                string UserIDD = Session["USERID"].ToString();
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_BindCartNumberz", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@UserID", UserIDD);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                            CartBadge.InnerText = CartQuantity;

                        }
                        else
                        {
                            //_ = CartBadge.InnerText == 0.ToString();
                            CartBadge.InnerText = "0";

                        }
                    }
                }
            }
        }

        ////private void BindProductCart()
        ////{
        ////    //    string UserIDD = Session["USERID"].ToString();
        ////    // DataTable dt = new DataTable();
        ////    //    using (SqlConnection con = new SqlConnection(CS))
        ////    //    {
        ////    //        SqlCommand cmd = new SqlCommand("SP_BindUserCart", con)
        ////    //        {
        ////    //            CommandType = CommandType.StoredProcedure
        ////    //        };
        ////    //        cmd.Parameters.AddWithValue("@UserID", UserIDD);

        ////    if (Request.Cookies["CartPID"] != null)
        ////    {
        ////        DataTable dt = new DataTable();
        ////        string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
        ////        string[] CookieDataArray = CookieData.Split(',');
        ////        if (CookieDataArray.Length > 0)
        ////        {
        ////            h4NoItems.InnerText = "Моя корзина ( " + CookieDataArray + " Item(s) )";
        ////            for (int i = 0; i < CookieDataArray.Length; i++)
        ////            {
        ////                string PID = CookieDataArray[i].ToString().Split('-')[0];
        ////                string ColorID = CookieDataArray[i].ToString().Split('-')[1];
        ////                using (SqlConnection con = new SqlConnection(CS))
        ////                {
        ////                    using (SqlCommand cmd = new SqlCommand("select A.* ,dbo.getColorName(" + ColorID + ") as ColorNamee ," + ColorID + "  as ColorIDD,ColorData.Name,ColorData,Extention from tblProducts A cross applay (select top 1,B.Name,Extention from tblProductImages B where B.PID=A.PID)ColorData where A.PID='" + PID + "'", con))
        ////                    {
        ////                        cmd.CommandType = CommandType.Text;

        ////                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        ////                        {
        ////                            //DataTable dt = new DataTable();
        ////                            sda.Fill(dt);
        ////                        }
        ////                    }
        ////                }
        ////            }
        ////        }
        ////        RptrCartProducts.DataSource = dt;
        ////        RptrCartProducts.DataBind();


        ////    }
        ////    else
        ////    {

        ////    }

        ////}
        private void BindProductCart()
        {
            string UserIDD = Session["USERID"].ToString();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SP_BindUserCart", con)
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
                        string CartQuantity = dt.Compute("Sum(Qty)", "").ToString();
                        h4NoItems.InnerText = "Моя корзина ( " + CartQuantity + " Item(s) )";
                        // int Total1 = Convert.ToInt32(dt.Compute("Sum(SubSAmount)", ""));
                        int CartTotal1 = Convert.ToInt32(dt.Compute("Sum(SubPAmount)", ""));

                        spanCartTotal.InnerText = string.Format("{0:#,###.##}", double.Parse(CartTotal)) + "Руб. " + ".00";

                    }
                    else
                    {
                        h4NoItems.InnerText = "Ваша корзина пуста.";
                        divAmountSect.Visible = false;

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
                    SqlCommand cmd = new SqlCommand("SP_getUserCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 updateQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                            SqlCommand myCmd = new SqlCommand("SP_UpdateCart", con)
                            {
                                CommandType = CommandType.StoredProcedure
                            };
                            myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                            myCmd.Parameters.AddWithValue("@CartPID", PID);
                            myCmd.Parameters.AddWithValue("@UserID", UserID);
                            con.Open();
                            Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                            con.Close();
                            BindProductCart();
                            BindCartNumber();
                        }
                    }

                }
            }
            else if (e.CommandName == "DoMinus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SP_getUserCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 myQty = Convert.ToInt32(dt.Rows[0]["Qty"].ToString());
                            if (myQty <= 1)
                            {
                                divQtyError.Visible = true;
                            }
                            else
                            {
                                SqlCommand myCmd = new SqlCommand("SP_UpdateCart", con)
                                {
                                    CommandType = CommandType.StoredProcedure
                                };
                                myCmd.Parameters.AddWithValue("@Quantity", myQty - 1);
                                myCmd.Parameters.AddWithValue("@CartPID", PID);
                                myCmd.Parameters.AddWithValue("@UserID", UserID);
                                con.Open();
                                Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                BindProductCart();
                                BindCartNumber();

                            }
                        }

                    }
                }
            }
            else if (e.CommandName == "RemoveThisCart")
            {
                int CartPID = Convert.ToInt32(e.CommandArgument.ToString().Trim());
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand myCmd = new SqlCommand("SP_DeleteThisCartItem", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    myCmd.Parameters.AddWithValue("@CartID", CartPID);
                    con.Open();
                    myCmd.ExecuteNonQuery();
                    con.Close();
                    BindProductCart();
                    BindCartNumber();
                }
            }
        }

        protected void btnHal_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        protected void btnCart2_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Karta.aspx");
        }
    }
}