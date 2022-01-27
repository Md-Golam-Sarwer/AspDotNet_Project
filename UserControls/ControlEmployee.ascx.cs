using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace EvidenceExam.UserControls
{
    public partial class ControlEmployee : System.Web.UI.UserControl
    {
        string dbCon = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string imgPath = Path.GetFileName(fuEmployeeImage.PostedFile.FileName);
            fuEmployeeImage.SaveAs(Server.MapPath("~/Images/" + imgPath));
            using (con = new SqlConnection (dbCon))
            {
                if(CheckBoxAgree.Checked)
                {
                    cmd = new SqlCommand("INSERT INTO Employee VALUES ('" + txtEmployeeName.Text + "','" + txtEmail.Text + "','" + rblGender.SelectedValue + "','" + txtDOB.Text + "','" + txtCellphone.Text + "','" + "~/Images/" + imgPath + "','" + CalendarLastUpdate.SelectedDate + "','" + ddlBranch.SelectedValue + "')", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    UpdatedRecordShow();
                    
                }
                else
                {
                    lblMessege.Text = "Please click Check into the checkebox!!! ";
                }

            }
            GridViewEmployee.DataBind();
            
        }
        public void UpdatedRecordShow()
        {
            if (Page.IsPostBack)
            {
                GridViewEmployee.DataBind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearData();
        }
        void clearData()
        {
            txtEmployeeName.Text = "";
            txtEmail.Text = "";
            txtCellphone.Text = "";
            txtConfirmEmail.Text = "";
            txtDOB.Text = "";

        }

        protected void GridViewEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblEmployeeId.Visible = false;
            lblEmployeeId.Text = GridViewEmployee.SelectedRow.Cells[1].Text;
            txtEmployeeName.Text = GridViewEmployee.SelectedRow.Cells[2].Text;
            txtEmail.Text = GridViewEmployee.SelectedRow.Cells[3].Text;
            rblGender.SelectedValue = GridViewEmployee.SelectedRow.Cells[4].Text;
            txtCellphone.Text = GridViewEmployee.SelectedRow.Cells[6].Text;       
            ddlBranch.SelectedValue = GridViewEmployee.SelectedRow.Cells[9].Text;
            txtDOB.Text= GridViewEmployee.SelectedRow.Cells[5].Text;
            txtEmployeeId.Text = GridViewEmployee.SelectedRow.Cells[1].Text;
            txtConfirmEmail.Text= GridViewEmployee.SelectedRow.Cells[3].Text;
            

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblMessege.Visible = true;
            using (con = new SqlConnection(dbCon))
            {
                cmd = new SqlCommand("UPDATE Employee SET EmployeeName ='" + txtEmployeeName.Text + "', Gender='" + rblGender.SelectedValue + "', DOB='" + txtDOB.Text + "',Email='" + txtEmail.Text + "',CellPhoneNo='" + txtCellphone.Text + "',BranchID='" + ddlBranch.SelectedValue + "',LastUpdate='" + CalendarLastUpdate.SelectedDate + "' WHERE EmployeeID='" + txtEmployeeId.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                UpdatedRecordShow();
            }
            GridViewEmployee.DataBind();
            lblMessege.Text = "Successfully  Updated!!!!";
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(dbCon))
            {
                cmd = new SqlCommand("DELETE FROM Employee WHERE EmployeeID='" + txtEmployeeId.Text + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                UpdatedRecordShow();
            }
            GridViewEmployee.DataBind();
            lblMessege.Text = "Successfully Record Deleted!!!";
   
        }
    }
}