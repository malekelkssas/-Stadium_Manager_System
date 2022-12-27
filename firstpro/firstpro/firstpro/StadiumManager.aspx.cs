using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace firstpro
{
    public partial class StadiumManager : System.Web.UI.Page
    {

        protected override void OnInit(EventArgs e)
        {
            creteRequestsTable();
            requests.Attributes.Add("Hidden", "true");
            base.OnInit(e);

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            //(string)Session["UserName"]  <<-- this is how to get the username
            string username = (string)Session["UserName"];
            connection.Open();
            DataTable Tmp = new DataTable();
            DataRow stadium = null;
            new SqlDataAdapter("SELECT SM.username,S.name,S.location,S.status,S.capacity FROM StadiumManager SM INNER JOIN Stadium S ON SM.stadium_id = S.id",
                connection).Fill(Tmp);
            foreach (DataRow row in Tmp.Rows)
            {
                if (row[0].Equals(username))
                {
                    stadium = row;
                    break;
                }
            }
            connection.Close();
            string status = stadium[3].Equals(true) ? "available" : "unavailable";
            stadiumName.InnerText = "Name : " + stadium[1];
            stadiumLocation.InnerText = "Location : " + stadium[2];
            stadiumStatus.InnerText = "Status : " + status;
            stadiumCapacity.InnerText = "Capacity : " + stadium[4];
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
            thead.Controls.Add(createTableHeaderCell("Host Club"));
            thead.Controls.Add(createTableHeaderCell("Club Representitve"));
            thead.Controls.Add(createTableHeaderCell("Guest Club"));
            thead.Controls.Add(createTableHeaderCell("Start Time"));
            thead.Controls.Add(createTableHeaderCell("End Time"));
            thead.Controls.Add(createTableHeaderCell("Status"));
            return thead;
        }



        private TableRow createTableRow(DataRow row, int index)
        {
            string username = (string)Session["UserName"];
            TableRow trow = new TableRow();
            for (int i = 0; i < 6; i++)
            {
                TableCell c = new TableCell();
                if (i == 5 && row[i].Equals("unhandled"))
                {
                    Button accept = new Button(), reject = new Button();
                    accept.Text = "Accept"; reject.Text = "Reject";
                    accept.Click += (s, args) => acceptReq_Click(s, args, username, row[0].ToString(), row[2].ToString(), row[3], index, i - 1);
                    reject.Click += (s, args) => rejectReq_Click(s, args, username, row[0].ToString(), row[2].ToString(), row[3], index, i - 1);
                    accept.Attributes.Add("class", "accept");
                    reject.Attributes.Add("class", "reject");
                    c.Controls.Add(accept);
                    c.Controls.Add(reject);
                }
                else
                {
                    c.Controls.Add(new LiteralControl(row[i].ToString()));
                }
                c.Attributes.Add("class", "tcell");
                trow.Cells.Add(c);
            }
            return trow;
        }

        protected void creteRequestsTable()
        {
            requests.Controls.Add(createTableHeaderRow());
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            //(string)Session["UserName"]  <<-- this is how to get the username
            string username = (string)Session["UserName"];
            DataTable allRequests = new DataTable();
            SqlCommand getRequests = new SqlCommand("SELECT * FROM dbo.allPendingRequestsModified(@username)", connection);
            getRequests.Parameters.AddWithValue("@username", username);
            new SqlDataAdapter(getRequests).Fill(allRequests);
            int rowNum = 1;
            foreach (DataRow row in allRequests.Rows)
            {
                requests.Controls.Add(createTableRow(row, rowNum++));
            }

        }

        protected void viewRequests_Click(object sender, EventArgs e)
        {
            requests.Attributes.Remove("Hidden");
        }

        protected void hideRequests_Click(object sender, EventArgs e)
        {
            requests.Attributes.Add("Hidden", "true");
        }

        protected void acceptReq_Click(object sender, EventArgs e, string username, string host, string guest, object startTime, int row, int col)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            SqlCommand accept = new SqlCommand("acceptRequest", connection);
            accept.Parameters.AddWithValue("@stadiumManUsername", username);
            accept.Parameters.AddWithValue("@hostClubName", host);
            accept.Parameters.AddWithValue("@guestClubName", guest);
            accept.Parameters.AddWithValue("@startTime", (DateTime)startTime);
            accept.CommandType = CommandType.StoredProcedure;
            accept.ExecuteNonQuery();
            connection.Close();
            requests.Rows[row].Cells[col].Controls.RemoveAt(0);
            requests.Rows[row].Cells[col].Controls.RemoveAt(0);
            requests.Rows[row].Cells[col].Text = "accepted";
            requests.Attributes.Remove("Hidden");

        }
        protected void rejectReq_Click(object sender, EventArgs e, string username, string host, string guest, object startTime, int row, int col)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            SqlCommand reject = new SqlCommand("rejectRequest", connection);
            reject.Parameters.AddWithValue("@stadiumManUsername", username);
            reject.Parameters.AddWithValue("@hostClubName", host);
            reject.Parameters.AddWithValue("@guestClubName", guest);
            reject.Parameters.AddWithValue("@startTime", (DateTime)startTime);
            reject.CommandType = CommandType.StoredProcedure;
            reject.ExecuteNonQuery();
            connection.Close();
            requests.Rows[row].Cells[col].Controls.RemoveAt(0);
            requests.Rows[row].Cells[col].Controls.RemoveAt(0);
            requests.Rows[row].Cells[col].Text = "rejected";
            requests.Attributes.Remove("Hidden");
        }
    }
}