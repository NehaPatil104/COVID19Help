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
    public partial class displayVaccineCenteradmin : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM vaccination", con);
            sqlDa.Fill(dtbl);
            if(dtbl.Rows.Count > 0)
            {
                GridViewVaccine.DataSource = dtbl;
                GridViewVaccine.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridViewVaccine.DataSource = dtbl;
                GridViewVaccine.DataBind();
                GridViewVaccine.Rows[0].Cells.Clear();
                GridViewVaccine.Rows[0].Cells.Add(new TableCell());
                GridViewVaccine.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridViewVaccine.Rows[0].Cells[0].Text = "No data found!";
                GridViewVaccine.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            con.Close();
        }

        protected void GridViewVaccine_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();
                    string sql = "insert into vaccination (facilityCategory,block,facilityName,address,pincode) values(@facilityCategory,@block,@facilityName,@address,@pincode)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@facilityCategory", (GridViewVaccine.FooterRow.FindControl("txtFacilityCategoryFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@block", (GridViewVaccine.FooterRow.FindControl("txtBlockFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@facilityName", (GridViewVaccine.FooterRow.FindControl("txtFacilityNameFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridViewVaccine.FooterRow.FindControl("txtAddressFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", (GridViewVaccine.FooterRow.FindControl("txtPincodeFooter") as TextBox).Text.Trim());
                   
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

        protected void GridViewVaccine_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewVaccine.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void GridViewVaccine_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewVaccine.EditIndex = -1;
            PopulateGridView();
        }

        protected void GridViewVaccine_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string sql = "UPDATE vaccination SET facilityCategory=@facilityCategory,block=@block,facilityName=@facilityName,address=@address,pincode=@pincode WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@facilityCategory", (GridViewVaccine.Rows[e.RowIndex].FindControl("txtFacilityCategory") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@block", (GridViewVaccine.Rows[e.RowIndex].FindControl("txtBlock") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@facilityName", (GridViewVaccine.Rows[e.RowIndex].FindControl("txtFacilityName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridViewVaccine.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@pincode", (GridViewVaccine.Rows[e.RowIndex].FindControl("txtPincode") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewVaccine.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    GridViewVaccine.EditIndex = -1;
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

        protected void GridViewVaccine_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string sql = "DELETE FROM vaccination WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewVaccine.DataKeys[e.RowIndex].Value.ToString()));
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