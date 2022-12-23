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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comment.Text = " ";
        }
        protected void login(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            string username = UsernameTB.Text;
            string password = PasswordTB.Text;
            if (username.Length == 0 || password.Length == 0)
                comment.Text = "Please enter user name and password";
            else
            {

                int exist = -1;
                DataTable Tmp = new DataTable();
                connection.Open();
                new SqlDataAdapter("select * from SystemUser", connection).Fill(Tmp);
                foreach (DataRow row in Tmp.Rows)
                {
                    if (row[0].Equals(username))
                    {
                        exist = 0;
                        if (row[1].Equals(password))
                        {
                            exist = 1;
                            break;
                        }
                    }
                }
                connection.Close();
                if (exist == -1)
                {
                    comment.Text = "there is no username called " + username;

                }
                if (exist == 0)
                {
                    comment.Text = "Wrong password";

                }
                if (exist == 1)
                {
                    Session["IsLoggedIn"] = true;
                    Session["UserName"] = username;
                    exist = 0;
                    connection.Open();
                    Tmp = new DataTable();
                    new SqlDataAdapter("select * from SystemAdmin", connection).Fill(Tmp);
                    foreach (DataRow row in Tmp.Rows)
                    {
                        if (row[2].Equals(username))
                        {
                            exist = 1;
                            break;
                        }
                    }
                    if (exist == 0)
                    {
                        Tmp = new DataTable();
                        new SqlDataAdapter("select * from allAssocManagers", connection).Fill(Tmp);
                        foreach (DataRow row in Tmp.Rows)
                        {
                            if (row[0].Equals(username))
                            {
                                exist = 2;
                                break;
                            }
                        }
                        if (exist == 0)
                        {
                            Tmp = new DataTable();
                            new SqlDataAdapter("select * from allClubRepresentatives", connection).Fill(Tmp);
                            foreach (DataRow row in Tmp.Rows)
                            {
                                if (row[0].Equals(username))
                                {
                                    exist = 3;
                                    break;
                                }
                            }
                        }
                        if (exist == 0)
                        {
                            Tmp = new DataTable();
                            new SqlDataAdapter("select * from allStadiumManagers", connection).Fill(Tmp);
                            foreach (DataRow row in Tmp.Rows)
                            {
                                if (row[0].Equals(username))
                                {
                                    exist = 4;
                                    break;
                                }
                            }
                        }
                        if (exist == 0)
                        {
                            Tmp = new DataTable();
                            new SqlDataAdapter("select * from allFans", connection).Fill(Tmp);
                            foreach (DataRow row in Tmp.Rows)
                            {
                                if (row[0].Equals(username))
                                {
                                    exist = 5;
                                    break;
                                }
                            }
                        }
                    }
                    connection.Close();
                    if (exist == 1)
                        Response.Redirect("/SystemAdmin.aspx");
                    else if (exist == 2)
                        Response.Redirect("/SportsAssociationManager.aspx");
                    else if (exist == 3)
                        Response.Redirect("/ClubRepresentative.aspx");
                    else if (exist == 4)
                        Response.Redirect("/StadiumManager.aspx");
                    else if (exist == 5)
                        Response.Redirect("/Fan.aspx");
                }
            }
        }
    }
}