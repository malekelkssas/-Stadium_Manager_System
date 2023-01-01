using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace firstpro
{

    public partial class DeleteMatch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //(string)Session["UserName"]  <<-- this is how to get the username
            if (Session["IsLoggedIn"] == null || !((string)Session["IsLoggedIn"]).Equals("SportsAssociationManager"))
                Response.Redirect("/login.aspx");
            else
                comment.Text = " ";
        }
        protected void Delete(object sender, EventArgs e)
        {
            String connstr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            //creating a new connection
            SqlConnection conn = new SqlConnection(connstr);
            try
            {
                string hostname = HostClubName.Text;
                string guestname = GuestClubName.Text;
                DateTime starttime = DateTime.Parse(StartTime.Text);
                DateTime endtime = DateTime.Parse(EndTime.Text);
                SqlCommand deleteMatch = new SqlCommand("deleteMatch2", conn);
                deleteMatch.CommandType = CommandType.StoredProcedure;
                deleteMatch.Parameters.Add(new SqlParameter("@hostClubName", hostname));
                deleteMatch.Parameters.Add(new SqlParameter("@guestClubName", guestname));
                deleteMatch.Parameters.Add(new SqlParameter("@start_Time", starttime));
                deleteMatch.Parameters.Add(new SqlParameter("@end_Time", endtime));
                conn.Open();
                if (hostname.Length != 0 && guestname.Length != 0)
                {
                    conn.Open();
                    deleteMatch.ExecuteNonQuery();
                    Response.Redirect("/DeleteMatch.aspx");

                }
                else
                {
                    comment.Text = "Don't Leave the host & guest name empty";
                }
            }
            catch (Exception)
            {
                comment.Text = "PLEASE MAKE SURE YOU FILL IN IN The CORRECT FORMAT IN DATETIME (MONTH-DAY-YEAR HOUR-MINUTES-SECONDS)";
            }
            finally
            {
                conn.Close();
            }

        }

    }
}