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
    
    public partial class ClubRepresentative : System.Web.UI.Page
    {
        string username;
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            username = (string)Session["UserName"];

            SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.clubsOfRepresentative(username)", conn); 
            cmd.Parameters.AddWithValue("@username", "username");
            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                String name = rdr.GetString(rdr.GetOrdinal("name"));
                String location = rdr.GetString(rdr.GetOrdinal("location"));

                Label clubEntry = new Label();
                clubEntry.Text = "Name: " + name + " " + "Location: " + location;
                Panel1.Controls.Add(clubEntry);
            }

            conn.Close();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}