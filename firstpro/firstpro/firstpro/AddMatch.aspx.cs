using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace firstpro
{
    public partial class AddMatch : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            //(string)Session["UserName"]  <<-- this is how to get the username
            if (Session["IsLoggedIn"] == null || !((string)Session["IsLoggedIn"]).Equals("SportsAssociationManager"))
                Response.Redirect("/login.aspx");
            else
                comment.Text = " ";
        }
        protected void Add(object sender, EventArgs e)
        {

            string connstr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            //creating a new connection
            SqlConnection conn = new SqlConnection(connstr);

            try
            {
                string hostname = HostClubName.Text;
                string guestname = GuestClubName.Text;
                DateTime starttime = DateTime.Parse(StartTime.Text);
                DateTime endtime = DateTime.Parse(EndTime.Text);
                SqlCommand addNewMatch = new SqlCommand("addNewMatch", conn);
                addNewMatch.CommandType = CommandType.StoredProcedure;
                addNewMatch.Parameters.Add(new SqlParameter("@hostClubName", hostname));
                addNewMatch.Parameters.Add(new SqlParameter("@guestClubName", guestname));
                addNewMatch.Parameters.Add(new SqlParameter("@startTime", starttime));
                addNewMatch.Parameters.Add(new SqlParameter("@endTime", endtime));
                if (hostname.Length != 0 && guestname.Length != 0)
                {
                    conn.Open();
                    addNewMatch.ExecuteNonQuery();
                    Response.Redirect("/AddMatch.aspx");
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
            //(string)Session["UserName"]  <<-- this is how to get the username
        }
    }
}