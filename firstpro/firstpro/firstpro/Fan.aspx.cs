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
    public partial class Fan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session == null || Session["UserName"] == null)
                Response.Redirect("/login.aspx");
            foreach (TableRow r in matches.Rows)
            {
                matches.Rows.Remove(r);
            }
            createMathchesTable();
            matches.Attributes.Add("Hidden", "true");
            //(string)Session["UserName"]  <<-- this is how to get the username
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
            thead.Controls.Add(createTableHeaderCell("Guest Club"));
            thead.Controls.Add(createTableHeaderCell("Stadium"));
            thead.Controls.Add(createTableHeaderCell("Location"));
            thead.Controls.Add(createTableHeaderCell("Action"));
            return thead;
        }



        private TableRow createTableRow(DataRow row, int index)
        {
            string username = (string)Session["UserName"];
            TableRow trow = new TableRow();
            for (int i = 0; i < 5; i++)
            {
                TableCell c = new TableCell();
                if (i == 4)
                {
                    Button purchase = new Button();
                    purchase.Text = "Purchase";
                    purchase.Click += (s, args) => purchase_Click(s, args, username, row[0].ToString(), row[1].ToString(), row[4], trow);
                    purchase.Attributes.Add("class", "accept");
                    c.Controls.Add(purchase);
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

        protected void createMathchesTable()
        {
            matches.Controls.Add(createTableHeaderRow());
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            //(string)Session["UserName"]  <<-- this is how to get the username
            string username = (string)Session["UserName"];
            DataTable allRequests = new DataTable();
            SqlCommand getRequests = new SqlCommand("SELECT * FROM dbo.availableMatchesToAttend(@date)", connection);
            getRequests.Parameters.AddWithValue("@date", Text1.Value.Replace('T', ' '));
            new SqlDataAdapter(getRequests).Fill(allRequests);
            int rowNum = 1;
            foreach (DataRow row in allRequests.Rows)
            {
                matches.Controls.Add(createTableRow(row, rowNum++));
            }
        }

        protected void purchase_Click(object sender, EventArgs e, string username, string host, string guest, object startTime, TableRow row)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            connection.Open();
            SqlCommand purchase = new SqlCommand("purchaseTicket", connection);
            purchase.Parameters.AddWithValue("@fan_username", username);
            purchase.Parameters.AddWithValue("@hosting_club", host);
            purchase.Parameters.AddWithValue("@competing_club", guest);
            purchase.Parameters.AddWithValue("@date", (DateTime)startTime);
            purchase.CommandType = CommandType.StoredProcedure;
            purchase.ExecuteNonQuery();
            connection.Close();
            matches.Rows.Remove(row);
        }

        protected void viewMatches_Click(object sender, EventArgs e)
        {
            if (Text1.Value.Equals(""))
            {
                errorMessage.Attributes.Remove("Hidden");
            }
            else
            {
                errorMessage.Attributes.Add("Hidden","true");
                matches.Attributes.Remove("Hidden");
               
            }
        }
    }
}