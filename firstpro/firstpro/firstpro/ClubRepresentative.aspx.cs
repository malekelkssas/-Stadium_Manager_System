using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace firstpro
{

    public partial class ClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = (string)Session["UserName"];
            welcomeLabel.Text = "Welcome, " + username + ". Here are all the clubs you currently manage. You can click \"Select\" to view all of the selected club's upcoming matches.";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string date = TextBox1.Text;

            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();


            SqlCommand stadiumsAvailableStartingFrom = new SqlCommand("stadiumsAvailableStartingFrom", connection);
            stadiumsAvailableStartingFrom.CommandType = CommandType.StoredProcedure;
            stadiumsAvailableStartingFrom.Parameters.AddWithValue("@date", date);

            if (date == null || date == "")
            {
                Label1.Text = "Your input cannot be empty. Please enter a date (YYYY-MM-DD) or (YYYY)";
                GridView3.DataSourceID = null;
                GridView3.DataBind();
            }
            else
            {
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter(stadiumsAvailableStartingFrom);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    GridView3.DataSource = dt;
                    GridView3.DataBind();
                    Label1.Text = "";
                }
                catch (Exception ex)
                {
                    Label1.Text = "The data you entered is invalid. Please enter a valid date (YYYY-MM-DD) or (YYYY)";
                    GridView3.DataSourceID = null;
                    GridView3.DataBind();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.DataSourceID = null;
            GridView2.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            GridView3.DataSourceID = null;
            GridView3.DataBind();
        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();

            SqlCommand addHostRequest = new SqlCommand("addHostRequest", connection);
            addHostRequest.CommandType = CommandType.StoredProcedure;

            string hostClubName = GridView4.SelectedRow.Cells[4].Text;
            string stadiumName = GridView4.SelectedRow.Cells[6].Text;
            DateTime matchStartTime = DateTime.Parse(GridView4.SelectedRow.Cells[2].Text);

            addHostRequest.Parameters.AddWithValue("@clubName", hostClubName);
            addHostRequest.Parameters.AddWithValue("@stadiumName", stadiumName);
            addHostRequest.Parameters.AddWithValue("@startTime", matchStartTime);

            try
            {
                addHostRequest.ExecuteNonQuery();
                Label2.Text = "Request sent succesfully";
            } catch (Exception ex)
            {
                Label2.Text = "An exception occured. Your request was not sent succesfully";
            }
        }
    }
}