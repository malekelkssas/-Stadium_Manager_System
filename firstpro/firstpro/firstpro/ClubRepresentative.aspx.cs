using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Xml.Linq;


namespace firstpro
{

    public partial class ClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !((string)Session["IsLoggedIn"]).Equals("ClubRepresentative"))
                Response.Redirect("/login.aspx");
            else
            {
                string username = (string)Session["UserName"];
                welcomeLabel.Text = "Welcome, " + username + ". Here are all the clubs you currently manage. You can click \"Select\" to view all of the selected club's upcoming matches.";

                createrepClubsTable();

                createMatchesMyClubHostTable();
                matchesMyClubHost.Attributes.Add("Hidden", "true");

            }
        }

        private TableHeaderCell createTableHeaderCell(string name)
        {
            TableHeaderCell th = new TableHeaderCell();
            th.Text = name;
            th.Attributes.Add("class", "theadcell");
            return th;
        }

        private TableHeaderRow createTableHeaderRow()
        {
            TableHeaderRow thead = new TableHeaderRow();
            thead.Controls.Add(createTableHeaderCell("Select"));
            thead.Controls.Add(createTableHeaderCell("Club ID"));
            thead.Controls.Add(createTableHeaderCell("Club Name"));
            thead.Controls.Add(createTableHeaderCell("Club Location"));
            return thead;
        }



        private TableRow createTableRow(DataRow row) 
        { 
            string username = (string)Session["UserName"];
            TableRow trow = new TableRow();
            for (int i = 0; i < 4; i++)
            {
                TableCell c = new TableCell();
                if (i == 0)
                {
                    Button select = new Button();
                    select.Text = "Select"; 
                    select.Click += (s, args) => select_Click(s, args, row[1].ToString());
                    select.Attributes.Add("class", "accept");
                   
                    c.Controls.Add(select);
                }
                else
                {
                    c.Controls.Add(new LiteralControl(row[i - 1].ToString()));
                }
                c.Attributes.Add("class", "tcell");
                trow.Cells.Add(c);
            }
            return trow;
        }

        protected void createrepClubsTable()
        {
            repClubs.Controls.Add(createTableHeaderRow());
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            string username = (string)Session["UserName"];
            SqlConnection connection = new SqlConnection(connString);

            DataTable clubs = new DataTable();
            SqlCommand getClubs = new SqlCommand("SELECT * FROM dbo.clubsOfRepresentative(@username)", connection);
            getClubs.Parameters.AddWithValue("@username", username);
            new SqlDataAdapter(getClubs).Fill(clubs);
            foreach (DataRow row in clubs.Rows)
            {
                repClubs.Controls.Add(createTableRow(row));
            }

        }

        protected void select_Click(object sender, EventArgs e,string name)
        {

            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();

            SqlConnection connection = new SqlConnection(connString);
            connection.Open();

            SqlCommand allUpcomingMatches = new SqlCommand("SELECT * FROM dbo.upcomingMatchesOfClub(@clubName)", connection);
            allUpcomingMatches.Parameters.AddWithValue("@clubName", name);
            SqlDataAdapter da = new SqlDataAdapter(allUpcomingMatches);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView2.DataSource = dt;
            GridView2.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            GridView2.DataSourceID = null;
            GridView2.DataBind();
        }

        

        private TableHeaderRow createTableHeaderRow2()
        {
            TableHeaderRow thead = new TableHeaderRow();
            thead.Controls.Add(createTableHeaderCell("SendRequest"));
            thead.Controls.Add(createTableHeaderCell("Stadium Name"));
            thead.Controls.Add(createTableHeaderCell("Stadium Location"));
            thead.Controls.Add(createTableHeaderCell("Stadium Capacity"));
            return thead;
        }



        private TableRow createTableRow2(DataRow row)
        {
            string date = Text1.Value.Replace('T', ' ');
            string username = (string)Session["UserName"];
            TableRow trow = new TableRow();
            for (int i = 0; i < 4; i++)
            {
                TableCell c = new TableCell();
                if (i == 0)
                {
                    Button send = new Button();
                    send.Text = "Send Request";
                    send.Click += (s, args) => select_Click2(s, args, username, row[0].ToString(),date); 
                    send.Attributes.Add("class", "accept");
                    c.Controls.Add(send);
                }
                else
                {
                    c.Controls.Add(new LiteralControl(row[i - 1].ToString()));
                }
                c.Attributes.Add("class", "tcell");
                trow.Cells.Add(c);
            }
            return trow;
        }

        protected void createMatchesMyClubHostTable()
        {
            string date = Text1.Value.Replace('T',' ');
            if (date == null || date == "")
            {
                Label1.Text = "Your input cannot be empty. Please enter a date (YYYY-MM-DD) or (YYYY)";
            }
            matchesMyClubHost.Controls.Add(createTableHeaderRow2());
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            string username = (string)Session["UserName"];
            SqlConnection connection = new SqlConnection(connString);

            DataTable matches = new DataTable();
            SqlCommand getMatches = new SqlCommand("SELECT * FROM dbo.stadiumsAvailableStartingFrom(@date)", connection);
            getMatches.Parameters.AddWithValue("@date", date);
            new SqlDataAdapter(getMatches).Fill(matches);
            foreach (DataRow row in matches.Rows)
            {
                matchesMyClubHost.Controls.Add(createTableRow2(row));
            }

        }

        protected void select_Click2(object sender, EventArgs e,string repUsername,string stadiumName,string matchStartTime)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();

            SqlCommand addHostRequest = new SqlCommand("sendHostReq", connection);
            addHostRequest.CommandType = CommandType.StoredProcedure;

            addHostRequest.Parameters.AddWithValue("@clubName", repUsername);
            addHostRequest.Parameters.AddWithValue("@stadiumName", stadiumName);
            addHostRequest.Parameters.AddWithValue("@startTime", matchStartTime);

            try
            {
                addHostRequest.ExecuteNonQuery();
                Label2.Text = "Request sent succesfully";
            }
            catch (Exception ex)
            {
                Label2.Text = "An exception occured. Your request was not sent succesfully";
            }
            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            matchesMyClubHost.Attributes.Remove("Hidden");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            matchesMyClubHost.Attributes.Add("Hidden", "true");
        }
    }
}