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
    public partial class StadiumManagerReg : System.Web.UI.Page
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
            string staduimName = staduimnameTB.Text;

            SqlCommand addStadiumManagerproc = new SqlCommand("addStadiumManager", connection);
            addStadiumManagerproc.CommandType = System.Data.CommandType.StoredProcedure;

            addStadiumManagerproc.Parameters.Add(new SqlParameter("@name", name));
            addStadiumManagerproc.Parameters.Add(new SqlParameter("@stadiumName", staduimName));
            addStadiumManagerproc.Parameters.Add(new SqlParameter("@username", username));
            addStadiumManagerproc.Parameters.Add(new SqlParameter("@password", password));
            int exist = 0;
            DataTable Tmp = new DataTable();
            connection.Open();
            new SqlDataAdapter("select * from allStadiums", connection).Fill(Tmp);
            foreach (DataRow row in Tmp.Rows)
            {
                if (row[0].Equals(staduimName))
                {
                    exist = 1;
                    break;
                }
            }
            connection.Close();

            if (exist == 0)
            {
                comment.Text = "There is no staduim called " + staduimName;
            }
            else
            {
                exist = 0;
                Tmp = new DataTable();
                connection.Open();
                new SqlDataAdapter("select * from allStadiumManagers", connection).Fill(Tmp);
                foreach (DataRow row in Tmp.Rows)
                {
                    if (row[3].Equals(staduimName))
                    {

                        exist = 1;
                        break;
                    }
                }
                connection.Close();

                if (exist == 1)
                {
                    comment.Text = "There is a staduim manager for this staduim";
                }
                else
                {
                    connection.Open();
                    try
                    {
                        
                        addStadiumManagerproc.ExecuteNonQuery();
                        Response.Redirect("/login.aspx");

                    }
                    catch (SqlException ex)
                    {
                        connection.Close();
                        comment.Text = "‘User name already exist";
                    }
                    finally
                    {
                        connection.Close();
                    }
                }

            }
        }
    }
}