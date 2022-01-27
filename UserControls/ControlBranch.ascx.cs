using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EvidenceExam.UserControls
{
    public partial class ControlBranch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            ObjectDataSource1.InsertParameters["BranchName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
            ObjectDataSource1.Insert();
        }
    }
}