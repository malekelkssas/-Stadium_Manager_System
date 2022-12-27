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
    public partial class ClubRepresentativeReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comment.Text = " ";
        }

        protected void Register(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            string name = nameTB.Text;
            string username = usernameTB.Text;
            string password = passwordTB.Text;
            string clubName = clubnameTB.Text;

            SqlCommand addRepresentativeproc = new SqlCommand("addRepresentative", connection);
            addRepresentativeproc.CommandType = System.Data.CommandType.StoredProcedure;

            addRepresentativeproc.Parameters.Add(new SqlParameter("@name", name));
            addRepresentativeproc.Parameters.Add(new SqlParameter("@clubName", clubName));
            addRepresentativeproc.Parameters.Add(new SqlParameter("@username", username));
            addRepresentativeproc.Parameters.Add(new SqlParameter("@password", password));
            int exist = 0;
            DataTable Tmp = new DataTable();
            connection.Open();
            new SqlDataAdapter("select * from allClubs", connection).Fill(Tmp);
            foreach (DataRow row in Tmp.Rows)
            {
                    if (row[0].Equals(clubName))
                    {
                        exist = 1;
                        break;
                    }
            }
            if (exist == 0)
            {
                comment.Text = "There is no club called "+ clubName;
            }
            else
            {
                exist = 0;
                Tmp = new DataTable();
                new SqlDataAdapter("select * from allClubRepresentatives", connection).Fill(Tmp);
                foreach (DataRow row in Tmp.Rows)
                {
                    if (row[3].Equals(clubName))
                    {
                        
                        exist = 1;
                        break;
                    }
                }
                if (exist == 1)
                {
                    comment.Text = "There is a club Representitive for this club";
                }
                else
                {
                    exist = 1;
                    Tmp = new DataTable();
                    new SqlDataAdapter("select * from SystemUser", connection).Fill(Tmp);
                    foreach (DataRow row in Tmp.Rows)
                    {
                        if (row[0].Equals(username))
                        {
                            exist = 0;
                            break;
                        }
                    }
                    if (exist == 1)
                    {
                        addRepresentativeproc.ExecuteNonQuery();
                        Response.Redirect("/login.aspx");

                    }
                    else
                    {
                        comment.Text = "‘User name already exist";
                    }
                     
                    
                }
            }
            connection.Close();
        }
    }
}