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
    public partial class deleteStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            comment.Text = " ";
        }

        protected void deleteClub(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand deleteStadiumproc = new SqlCommand("deleteStadium", connection);
            deleteStadiumproc.CommandType = System.Data.CommandType.StoredProcedure;

            String staduimname = StaduimNameTB.Text;

            if (staduimname.Length == 0)
                comment.Text = "Please enter Staduim name";
            
            else
            {
                deleteStadiumproc.Parameters.Add(new SqlParameter("@stadiumName", staduimname));
                int exists = 0;
                DataTable Tmp = new DataTable();
                connection.Open();
                new SqlDataAdapter("select * from allStadiums", connection).Fill(Tmp);
                connection.Close();
                foreach (DataRow row in Tmp.Rows)
                {
                    if (row[0].Equals(staduimname))
                    {
                        exists = 1;
                        break;
                    }
                }
                if (exists == 0)
                    comment.Text = staduimname + " staduim deosn't exist";
                else
                {
                    connection.Open();
                    deleteStadiumproc.ExecuteNonQuery();
                    comment.Text = staduimname + " deleted succefully";
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