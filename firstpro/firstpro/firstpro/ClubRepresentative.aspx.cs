using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace firstpro
{

    public partial class ClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (string)Session["UserName"];
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            SqlCommand allClubsOfRepresentative = new SqlCommand("clubsOfRepresentative", connection);
            allClubsOfRepresentative.CommandType = System.Data.CommandType.StoredProcedure;
            allClubsOfRepresentative.Parameters.AddWithValue("username", "rep1username");

            SqlCommand cmd = new SqlCommand("select * from Club", connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);   
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GridView1.SelectedRow.Cells[1].Text;
            string name = GridView1.SelectedRow.Cells[2].Text;
            string location = GridView1.SelectedRow.Cells[3].Text;
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();

            Response.Write(name);
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();

            SqlCommand allUpcomingMatches = new SqlCommand("allUpcomingClubMatches", connection);
            allUpcomingMatches.CommandType = CommandType.StoredProcedure;
            allUpcomingMatches.Parameters.AddWithValue("@clubName", name);
            SqlDataAdapter da = new SqlDataAdapter(allUpcomingMatches);
            DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();

            
        }
    }


}