using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace firstpro
{
    public partial class BlockFan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comment.Text = " ";
        }

        protected void blockFanB_Click(object sender, EventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("");
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand blockFanproc = new SqlCommand("blockFan", connection);
            blockFanproc.CommandType = System.Data.CommandType.StoredProcedure;
            string fanIDs = FanID.Text;
            if (fanIDs.Length == 0)
                comment.Text = "Please enter Fan National ID";
            else
            {
                int fanID=-1;
                try
                {
                     fanID = Int16.Parse(fanIDs);
                    if (fanID <= 0) throw new Exception();
                }
                catch (Exception ex)
                {
                    fanID = -1;
                    comment.Text =  "Fan ID must be a positive number";
                }
                if (fanID != -1)
                {

                    blockFanproc.Parameters.Add(new SqlParameter("@nationalID", fanID));
                    int exists = 0;
                    DataTable Tmp = new DataTable();
                    connection.Open();
                    new SqlDataAdapter("select * from allFans", connection).Fill(Tmp);
                    connection.Close();
                    int status = -1;
                    foreach (DataRow row in Tmp.Rows)
                    {
                        if (Convert.ToInt32(row[3]) == fanID)
                        {
                            exists = 1;
                            status = Convert.ToInt32(row[5]);
                            break;
                        }
                    }
                    if (exists == 0)
                        comment.Text = "There is no fan with id " + fanID;
                    else
                    {
                        if (status == 0)
                            comment.Text = "Fan with ID " + fanID + " is already Blocked";
                        else
                        {
                            connection.Open();
                            blockFanproc.ExecuteNonQuery();
                            comment.Text = "Fan with ID " + fanID + " Blocked succefully";
                            connection.Close();
                        }
                    }
                }
            }
        }

        protected void homeB_Click(object sender, EventArgs e)
        {
            Response.Redirect("/SystemAdmin.aspx");
        }
    }
}