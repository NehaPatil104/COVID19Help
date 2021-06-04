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
    public partial class displayBedAvailadmin : System.Web.UI.Page
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
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CovidHelp"].ConnectionString);
            con.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM bedAvailability", con);
            sqlDa.Fill(dtbl);
            if(dtbl.Rows.Count > 0)
            {
                GridViewadmin.DataSource = dtbl;
                GridViewadmin.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                GridViewadmin.DataSource = dtbl;
                GridViewadmin.DataBind();
                GridViewadmin.Rows[0].Cells.Clear();
                GridViewadmin.Rows[0].Cells.Add(new TableCell());
                GridViewadmin.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                GridViewadmin.Rows[0].Cells[0].Text = "No data found!";
                GridViewadmin.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
            con.Close();
        }

        protected void GridViewadmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("AddNew"))
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CovidHelp"].ConnectionString);
                    con.Open();
                    string sql = "insert into bedAvailability (hospital_name,address, tehsil,contact_person,phone,ICU_bed_total,ICU_bed_occupied,ICU_bed_avail,oxygen_bed_total,oxygen_bed_occupied,oxygen_bed_avail,isolation_bed_total,isolation_bed_occupied,isolation_bed_avail) values(@hospital_name,@address,@tehsil,@contact_person,@phone,@ICU_bed_total,@ICU_bed_occupied,@ICU_bed_avail,@oxygen_bed_total,@oxygen_bed_occupied,@oxygen_bed_avail,@isolation_bed_total,@isolation_bed_occupied,@isolation_bed_avail)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@hospital_name", (GridViewadmin.FooterRow.FindControl("txtHospitalFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridViewadmin.FooterRow.FindControl("txtAddressFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@tehsil", (GridViewadmin.FooterRow.FindControl("txtTehsilFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_person", (GridViewadmin.FooterRow.FindControl("txtContactPersonFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@phone", (GridViewadmin.FooterRow.FindControl("txtPhoneFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ICU_bed_total", (GridViewadmin.FooterRow.FindControl("txtICUBedTotalFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ICU_bed_occupied", (GridViewadmin.FooterRow.FindControl("txtICUBedOccupiedFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ICU_bed_avail", (GridViewadmin.FooterRow.FindControl("txtICUBedAvailFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@oxygen_bed_total", (GridViewadmin.FooterRow.FindControl("txtOxygenBedTotalFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@oxygen_bed_occupied", (GridViewadmin.FooterRow.FindControl("txtOxygenBedOccupiedFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@oxygen_bed_avail", (GridViewadmin.FooterRow.FindControl("txtOxygenBedAvailFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@isolation_bed_total", (GridViewadmin.FooterRow.FindControl("txtIsolationBedTotalFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@isolation_bed_occupied", (GridViewadmin.FooterRow.FindControl("txtIsolattionBedOccupiedFooter") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@isolation_bed_avail", (GridViewadmin.FooterRow.FindControl("txtIsolationBedAvailFooter") as TextBox).Text.Trim());

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

        protected void GridViewadmin_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewadmin.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void GridViewadmin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewadmin.EditIndex = -1;
            PopulateGridView();
        }

        protected void GridViewadmin_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CovidHelp"].ConnectionString);
                con.Open();
                string sql = "UPDATE bedAvailability SET hospital_name=@hospital_name,address=@address,tehsil=@tehsil,contact_person=@contact_person,phone=@phone,ICU_bed_total=@ICU_bed_total,ICU_bed_occupied=@ICU_bed_occupied,ICU_bed_avail=@ICU_bed_avail,oxygen_bed_total=@oxygen_bed_total,oxygen_bed_occupied=@oxygen_bed_occupied," +
                "oxygen_bed_avail=@oxygen_bed_avail,isolation_bed_total=@isolation_bed_total,isolation_bed_occupied=@isolation_bed_occupied,isolation_bed_avail=@isolation_bed_avail WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@hospital_name", (GridViewadmin.Rows[e.RowIndex].FindControl("txtHospital") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@address", (GridViewadmin.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@tehsil", (GridViewadmin.Rows[e.RowIndex].FindControl("txtTehsil") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@contact_person", (GridViewadmin.Rows[e.RowIndex].FindControl("txtContactPerson") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@phone", (GridViewadmin.Rows[e.RowIndex].FindControl("txtPhone") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ICU_bed_total", (GridViewadmin.Rows[e.RowIndex].FindControl("txtICUBedTotal") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ICU_bed_occupied", (GridViewadmin.Rows[e.RowIndex].FindControl("txtICUBedOccupied") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@ICU_bed_avail", (GridViewadmin.Rows[e.RowIndex].FindControl("txtICUBedAvail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@oxygen_bed_total", (GridViewadmin.Rows[e.RowIndex].FindControl("txtOxygenBedTotal") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@oxygen_bed_occupied", (GridViewadmin.Rows[e.RowIndex].FindControl("txtOxygenBedOccupied") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@oxygen_bed_avail", (GridViewadmin.Rows[e.RowIndex].FindControl("txtOxygenBedAvail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@isolation_bed_total", (GridViewadmin.Rows[e.RowIndex].FindControl("txtIsolationBedTotal") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@isolation_bed_occupied", (GridViewadmin.Rows[e.RowIndex].FindControl("txtIsolationBedOccupied") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@isolation_bed_avail", (GridViewadmin.Rows[e.RowIndex].FindControl("txtIsolationBedAvail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewadmin.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    GridViewadmin.EditIndex = -1;
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

        protected void GridViewadmin_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CovidHelp"].ConnectionString);
                con.Open();
                string sql = "DELETE FROM bedAvailability WHERE Id=@id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(GridViewadmin.DataKeys[e.RowIndex].Value.ToString()));
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