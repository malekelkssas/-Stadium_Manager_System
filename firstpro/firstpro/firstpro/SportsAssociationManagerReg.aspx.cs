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
    public partial class SportsAssociationManagerReg : System.Web.UI.Page
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
            SqlCommand addAssociationManagerproc = new SqlCommand("addAssociationManager", connection);
            addAssociationManagerproc.CommandType = System.Data.CommandType.StoredProcedure;
            addAssociationManagerproc.Parameters.Add(new SqlParameter("@name", name));
            addAssociationManagerproc.Parameters.Add(new SqlParameter("@username", username));
            addAssociationManagerproc.Parameters.Add(new SqlParameter("@password", password));
            connection.Open();
            try
            {
                addAssociationManagerproc.ExecuteNonQuery();
                Response.Redirect("/login.aspx");
               
            }
            catch (SqlException ex)
            {
                comment.Text = "‘User name already exist";
            }
            finally
            {
                connection.Close();
            }


        }
    }
}