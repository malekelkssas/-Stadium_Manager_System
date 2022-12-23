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
    public partial class deleteClub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void deleteClubB_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand deleteClubproc = new SqlCommand("deleteClub", connection);
            deleteClubproc.CommandType = System.Data.CommandType.StoredProcedure;

            String clubname = ClubName.Text;

            deleteClubproc.Parameters.Add(new SqlParameter("@clubName", clubname));
            int exists = 0;
            DataTable Tmp = new DataTable();
            connection.Open();
            new SqlDataAdapter("select * from allCLubs", connection).Fill(Tmp);
            connection.Close();
            foreach (DataRow row in Tmp.Rows)
            {
                if (row[0].Equals(clubname))
                {
                    exists = 1;
                    break;
                }
            }
            if(exists==0)
                Response.Write(clubname + " club deosn't exist");
            else if (exists == 1)
            {
                connection.Open();
                deleteClubproc.ExecuteNonQuery();
                Response.Write(clubname + " deleted succefully");
                connection.Close();
            }

        }
    }
}