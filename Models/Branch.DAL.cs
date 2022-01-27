using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.ComponentModel;
namespace EvidenceExam.Models
{
    public class Branch
    {
        public int BranchID { get; set; }
        public string BranchName { get; set; }
    }
    [DataObject(true)]
    public class Branch_DAL
    {
        public static string conString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        public static SqlConnection con;
        public static SqlCommand cmd;

        [DataObjectMethod(DataObjectMethodType.Select)]
        public static List<Branch> GetBranches()
        {
            List<Branch> branches = new List<Branch>();
            using (con = new SqlConnection(conString))
            {
                cmd = new SqlCommand("SELECT * FROM Branch", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Branch branch = new Branch();
                    branch.BranchID = Convert.ToInt32(reader["BranchID"]);
                    branch.BranchName = reader["BranchName"].ToString();

                    branches.Add(branch);
                }
            }
            return branches;
        }
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static int InsertMethod (string branchName)
        {
            using (con = new SqlConnection(conString))
            {
                cmd = new SqlCommand("INSERT INTO Branch (BranchName) VALUES (@branchName)", con);
                SqlParameter paramBranchName = new SqlParameter("branchName", branchName);
                cmd.Parameters.Add(paramBranchName);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public static int UpdateMethod(int branchID, string branchName)
        {
            using (con = new SqlConnection(conString))
            {
                cmd = new SqlCommand("UPDATE Branch SET BranchName = @branchName WHERE BranchID = @branchID", con);
                SqlParameter paramBranchName = new SqlParameter("branchName", branchName);
                cmd.Parameters.Add(paramBranchName);
                SqlParameter paramBranchId = new SqlParameter("branchID", branchID);
                cmd.Parameters.Add(paramBranchId);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public static int DeleteMethod(int branchID)
        {
            using (con = new SqlConnection(conString))
            {
                cmd = new SqlCommand("DELETE FROM Branch WHERE BranchID = @branchID", con);
                SqlParameter paramBranchId = new SqlParameter("branchID", branchID);
                cmd.Parameters.Add(paramBranchId);
                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }


    }
}