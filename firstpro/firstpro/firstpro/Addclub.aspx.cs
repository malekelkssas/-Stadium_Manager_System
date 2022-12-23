using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace firstpro
{
    public partial class Addclub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comment.Text = " ";
        }

        protected void AddClub(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand addClubproc = new SqlCommand("addClub", connection);
            addClubproc.CommandType = System.Data.CommandType.StoredProcedure;

            String clubname = clubName.Text;
            string clublocation = clubLocation.Text;
            if (clubname.Length == 0 || clublocation.Length == 0)
            {
                comment.Text = "Please enter Club name and location";
            }
            else
            {

                addClubproc.Parameters.Add(new SqlParameter("@clubName", clubname));
                addClubproc.Parameters.Add(new SqlParameter("@clubLocation", clublocation));


                connection.Open();
                try
                {
                    addClubproc.ExecuteNonQuery();
                    comment.Text = clubname + " added succefully";
                }
                catch (SqlException ex)
                {
                    comment.Text = "Can not insert doublicate Club names";
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("/SystemAdmin.aspx");
        }
    }
}