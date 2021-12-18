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

    public partial class AddProduct : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["MyShoppingDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //when page first time run then this code will execute
                BindType();
                BindCategory();
                BindGridview1();

            }
        }

      

        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblCategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        private void BindType()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblTypes", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlType.DataSource = dt;
                    ddlType.DataTextField = "Name";
                    ddlType.DataValueField = "TypeID";
                    ddlType.DataBind();
                    ddlType.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@PPrice", txtPrice.Text);
               
                cmd.Parameters.AddWithValue("@PTypeID", ddlType.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
              
                cmd.Parameters.AddWithValue("@PDescription", txtDescription.Text);
               
              
                if (con.State == ConnectionState.Closed) { con.Open(); }
                Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());


                //Insert size quantity
                for (int i = 0; i < cblColor.Items.Count; i++)
                {
                    if (cblColor.Items[i].Selected == true)
                    {
                        Int64 ColorID = Convert.ToInt64(cblColor.Items[i].Value);
                        int Quantity = Convert.ToInt32(txtQuantity.Text);

                        // SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQuantity(PID,SizeID,Quantity) values('" + PID + "','" + SizeID + "','" + Quantity + "')", con);
                        SqlCommand cmd2 = new SqlCommand("insert into tblProductColorQuantity(PID,ColorID,Quantity) values(@PID,@ColorID,@Quantity)", con);
                        cmd2.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                        cmd2.Parameters.AddWithValue("@ColorID", Convert.ToInt32(ColorID));
                        cmd2.Parameters.AddWithValue("@Quantity", Convert.ToInt32(Quantity));
                        cmd2.ExecuteNonQuery();
                    }
                }
                //Insert and upload images
                if (fuImg01.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/ProductImage/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg01.PostedFile.FileName);
                    fuImg01.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "01" + Extention);

                    //SqlCommand cmd3 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString ().Trim () + "01" + "','" + Extention  + "')", con);
                    SqlCommand cmd3 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                    cmd3.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                    cmd3.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "01");
                    cmd3.Parameters.AddWithValue("@Extention", Extention);
                    cmd3.ExecuteNonQuery();
                }
                //2nd fileupload
                if (fuImg02.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/ProductImage/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg02.PostedFile.FileName);
                    fuImg02.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "02" + Extention);

                    //SqlCommand cmd4 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "02" + "','" + Extention + "')", con);
                    SqlCommand cmd4 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                    cmd4.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                    cmd4.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "02");
                    cmd4.Parameters.AddWithValue("@Extention", Extention);
                    cmd4.ExecuteNonQuery();
                }

                //3rd file upload 
                if (fuImg03.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/ProductImage/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg03.PostedFile.FileName);
                    fuImg03.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "03" + Extention);

                    //SqlCommand cmd5 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "03" + "','" + Extention + "')", con);
                    SqlCommand cmd5 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                    cmd5.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                    cmd5.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "03");
                    cmd5.Parameters.AddWithValue("@Extention", Extention);
                    cmd5.ExecuteNonQuery();
                }
                //4th file upload control
                if (fuImg04.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/ProductImage/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg04.PostedFile.FileName);
                    fuImg04.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "04" + Extention);

                    //SqlCommand cmd6 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "04" + "','" + Extention + "')", con);
                    SqlCommand cmd6 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                    cmd6.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                    cmd6.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "04");
                    cmd6.Parameters.AddWithValue("@Extention", Extention);
                    cmd6.ExecuteNonQuery();
                }

                //5th file upload
                if (fuImg05.HasFile)
                {
                    string SavePath = Server.MapPath("~/Image/ProductImage/") + PID;
                    if (!Directory.Exists(SavePath))
                    {
                        Directory.CreateDirectory(SavePath);

                    }
                    string Extention = Path.GetExtension(fuImg05.PostedFile.FileName);
                    fuImg05.SaveAs(SavePath + "\\" + txtProductName.Text.ToString().Trim() + "05" + Extention);

                    //SqlCommand cmd7 = new SqlCommand("insert into tblProductImages values('" + PID + "','" + txtProductName.Text.ToString().Trim() + "05" + "','" + Extention + "')", con);
                    SqlCommand cmd7 = new SqlCommand("insert into tblProductImages(PID,Name,Extention) values(@PID,@Name,@Extention)", con);
                    cmd7.Parameters.AddWithValue("@PID", Convert.ToInt32(PID));
                    cmd7.Parameters.AddWithValue("@Name", txtProductName.Text.ToString().Trim() + "05");
                    cmd7.Parameters.AddWithValue("@Extention", Extention);
                    cmd7.ExecuteNonQuery();

                    BindGridview1();
                    Response.Redirect("AddProduct.aspx");
                }

               
            }

        }
        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                if (con.State == ConnectionState.Closed) { con.Open(); }
                string qr = "Select * from tblColors where TypeID=@TypeID AND CategoryID=@CategoryID  ";
                // qr = "Select * from tblSizes where BrandID='" + ddlBrand.SelectedValue + "' and CategoryID='" + ddlCategory.SelectedValue + "' and SubCategoryID='" + ddlSubCategory.SelectedValue + "' and GenderID='" + ddlGender.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(qr, con);
                cmd.Parameters.AddWithValue("@TypeID", ddlType.SelectedValue);
                cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                if (dt.Rows.Count != 0)
                {
                    cblColor.DataSource = dt;
                    cblColor.DataTextField = "ColorName";
                    cblColor.DataValueField = "ColorID";
                    cblColor.DataBind();

                }
            }
        }

        private void BindGridview1()
        {
            SqlConnection con = new SqlConnection(CS);
          //  SqlCommand cmd = new SqlCommand(" select distinct t1.PID,t1.PName,t1.PPrice,t1.PSelPrice,t2.Name as Brand,t3.CatName,t4.SubCatName, t5.GenderName as gender,t6.SizeName,t8.Quantity from tblProducts as t1  inner join tblBrands as t2 on t2.BrandID=t1.PBrandID  inner join tblCategory as t3 on t3.CatID=t1.PCategoryID  inner join tblSubCategory as t4 on t4.SubCatID=t1.PSubCatID   inner join tblGender as t5 on t5.GenderID =t1.PGender   inner join tblSizes as t6 on t6.SubCategoryID=t1.PSubCatID  inner join tblProductSizeQuantity as t8 on t8.PID=t1.PID order by t1.PName", con);
           
            SqlCommand cmd = new SqlCommand(" select distinct t1.PID,t1.PName,t1.PPrice,t2.Name as Type,t3.CatName, t4.ColorName ,t5.Quantity from tblProducts as t1  inner join tblTypes as t2 on t2.TypeID=t1.PTypeID  inner join tblCategory as t3 on t3.CatID=t1.PCategoryID  inner join tblColors as t4 on t4.CategoryID=t1.PCategoryID     inner join tblProductColorQuantity as t5 on t5.PID=t1.PID order by t1.PName", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }


        }
    }
}