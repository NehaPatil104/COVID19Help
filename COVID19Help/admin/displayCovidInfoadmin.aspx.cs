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
    public partial class displayCovidInfoadmin : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["covidData"].ConnectionString);
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM covidinfo", con);
            sqlDa.Fill(dtbl);
            if(dtbl.Rows.Count > 0)
            {
                GridViewCovid.DataSource = dtbl;
                GridViewCovid.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridViewCovid.DataSource = dtbl;
                GridViewCovid.DataBind();
                GridViewCovid.Rows[0].Cells.Clear();
                GridViewCovid.Rows[0].Cells.Add(new TableCell());
                GridViewCovid.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridViewCovid.Rows[0].Cells[0].Text = "No data found!";
                GridViewCovid.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            con.Close();
        }

        protected void GridViewCovid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCovid.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void GridViewCovid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCovid.EditIndex = -1;
            PopulateGridView();
        }

        protected void GridViewCovid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["covidData"].ConnectionString);
                con.Open();
                string sql = "UPDATE covidinfo SET totalSwab=@totalSwab,totalPositive=@totalPositive,totalActive=@totalActive,totalDeath=@totalDeath,totalDischarge=@totalDischarge,reportAwaited=@reportAwaited WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@totalSwab", (GridViewCovid.Rows[e.RowIndex].FindControl("txttotalSwab") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@totalPositive", (GridViewCovid.Rows[e.RowIndex].FindControl("txttotalPositive") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@totalActive", (GridViewCovid.Rows[e.RowIndex].FindControl("txttotalActive") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@totalDeath", (GridViewCovid.Rows[e.RowIndex].FindControl("txttotalDeath") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@totalDischarge", (GridViewCovid.Rows[e.RowIndex].FindControl("txttotalDischarge") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@reportAwaited", (GridViewCovid.Rows[e.RowIndex].FindControl("txtreportAwaited") as TextBox).Text.Trim());  
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewCovid.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    GridViewCovid.EditIndex = -1;
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