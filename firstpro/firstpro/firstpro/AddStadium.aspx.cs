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
    public partial class AddStadium : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addStaduimB_Click(object sender, EventArgs e)
        {
            string connString = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
            SqlConnection connection = new SqlConnection(connString);
            SqlCommand addStaduimproc = new SqlCommand("addStadium", connection);
            addStaduimproc.CommandType = System.Data.CommandType.StoredProcedure;

            string staduimName = StadiumNameTB.Text;
            string staduimLocation = StadiumLocationTB.Text;
            int staduimCapacity=-1;
            if (staduimName.Length == 0 || staduimLocation.Length == 0)
            {
                Response.Write("Please enter Staduim Name and Location");
            }
            else
            {
                try
                {
                    staduimCapacity = Int16.Parse(StadiumCapacityTB.Text);
                    if (staduimCapacity <= 0) throw new Exception();
                }
                catch (Exception ex)
                {
                    staduimCapacity = -1;
                    Response.Write("staduim Capacity must be a positive number");
                }

                if (staduimCapacity != -1)
                {
                    addStaduimproc.Parameters.Add(new SqlParameter("@stadiumName", staduimName));
                    addStaduimproc.Parameters.Add(new SqlParameter("@stadiumLocation", staduimLocation));
                    addStaduimproc.Parameters.Add(new SqlParameter("@stadiumCapacity", staduimCapacity));

                    connection.Open();
                    try
                    {
                        addStaduimproc.ExecuteNonQuery();
                        Response.Write(staduimName + " added succefully");
                    }
                    catch (SqlException ex)
                    {

                        Response.Write("Can not insert doublicate staduim names");
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("/SystemAdmin.aspx");
        }
    }
}