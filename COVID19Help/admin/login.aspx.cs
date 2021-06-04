using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace COVID19Help.admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {          
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
                con.Open();
                string sql = "select COUNT(1) from admintbl where username=@username and password=@password";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@username", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox2.Text.Trim());
                int cnt = Convert.ToInt32(cmd.ExecuteScalar());
                if(cnt == 1)
                {
                    Session["username"] = TextBox1.Text.Trim();
                    Response.Redirect("dashboard.aspx");
                    
                }
                else
                {
                    Label3.Visible = true;
                }

                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}