using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace COVID19Help
{
    public partial class displayTestCenteradmin : System.Web.UI.Page
    {

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                PopulateGridView();
            }
        }

        void PopulateGridView()
        {
            DataTable dtbl = new DataTable();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["testCenter"].ConnectionString);
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM testcenter", con);
            sqlDa.Fill(dtbl);
            if(dtbl.Rows.Count > 0)
            {
                GridViewTestCenter.DataSource = dtbl;
                GridViewTestCenter.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridViewTestCenter.DataSource = dtbl;
                GridViewTestCenter.DataBind();
                GridViewTestCenter.Rows[0].Cells.Clear();
                GridViewTestCenter.Rows[0].Cells.Add(new TableCell());
                GridViewTestCenter.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridViewTestCenter.Rows[0].Cells[0].Text = "No data found!";
                GridViewTestCenter.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            con.Close();
        }

        protected void GridViewTestCenter_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["testCenter"].ConnectionString);
                    con.Open();
                    string sql = "insert into testcenter (centerCategory,block,centerName,address,pincode) values(@centerCategory,@block,@centerName,@address,@pincode)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@centerCategory", (GridViewTestCenter.FooterRow.FindControl("txtcenterCategoryFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@block", (GridViewTestCenter.FooterRow.FindControl("txtBlockFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@centerName", (GridViewTestCenter.FooterRow.FindControl("txtcenterNameFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridViewTestCenter.FooterRow.FindControl("txtAddressFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", (GridViewTestCenter.FooterRow.FindControl("txtPincodeFooter") as TextBox).Text.Trim());
                   
                    cmd.ExecuteNonQuery();
                    PopulateGridView();
                    lblSuccessMessage.Text = "New Record Added";
                    lblErrorMessage.Text = "";
                    con.Close();
                }
            }
            catch(Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void GridViewTestCenter_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewTestCenter.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void GridViewTestCenter_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewTestCenter.EditIndex = -1;
            PopulateGridView();
        }

        protected void GridViewTestCenter_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["testCenter"].ConnectionString);
                con.Open();
                string sql = "UPDATE testcenter SET centerCategory=@centerCategory,block=@block,centerName=@centerName,address=@address,pincode=@pincode WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@centerCategory", (GridViewTestCenter.Rows[e.RowIndex].FindControl("txtcenterCategory") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@block", (GridViewTestCenter.Rows[e.RowIndex].FindControl("txtBlock") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@centerName", (GridViewTestCenter.Rows[e.RowIndex].FindControl("txtcenterName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridViewTestCenter.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", (GridViewTestCenter.Rows[e.RowIndex].FindControl("txtPincode") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewTestCenter.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    GridViewTestCenter.EditIndex = -1;
                    PopulateGridView();
                    lblSuccessMessage.Text = "Selected Record Update";
                    lblErrorMessage.Text = "";
                    con.Close();
                
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void GridViewTestCenter_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["testCenter"].ConnectionString);
                con.Open();
                string sql = "DELETE FROM testcenter WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewTestCenter.DataKeys[e.RowIndex].Value.ToString()));
                cmd.ExecuteNonQuery();
                PopulateGridView();
                lblSuccessMessage.Text = "Selected Record Deleted";
                lblErrorMessage.Text = "";
                con.Close();

            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://localhost:44329/index.html");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx");
        }
    }
}