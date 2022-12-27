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
    public partial class FanReg : System.Web.UI.Page
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
            connection.Open();
            try
            {
                int nationalID = Int16.Parse(nationalIDNTB.Text);
                try
                {
                    int phonenumber = Int16.Parse(phoneNumberTB.Text);
                    DateTime birthdate = DateTime.Parse(birthDateTB.Text);
                    if (birthdate.Date>=DateTime.Now.Date)
                    {
                        comment.Text = "Please enter valid date";
                    }
                    else
                    {

                        string address = addressTB.Text;
                        SqlCommand addFanproc = new SqlCommand("addFan", connection);
                        addFanproc.CommandType = System.Data.CommandType.StoredProcedure;

                        addFanproc.Parameters.Add(new SqlParameter("@name", name));
                        addFanproc.Parameters.Add(new SqlParameter("@username", username));
                        addFanproc.Parameters.Add(new SqlParameter("@password", password));
                        addFanproc.Parameters.Add(new SqlParameter("@national_id", nationalID));
                        addFanproc.Parameters.Add(new SqlParameter("@birth_date", birthdate.ToString("MM/dd/yyyy")));
                        addFanproc.Parameters.Add(new SqlParameter("@address", address));
                        addFanproc.Parameters.Add(new SqlParameter("@phone_number", phonenumber));
                        int exist = 1;
                        DataTable Tmp = new DataTable();
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
                            exist = 1;
                            Tmp = new DataTable();
                            new SqlDataAdapter("select national_id from fan", connection).Fill(Tmp);
                            foreach (DataRow row in Tmp.Rows)
                            {
                                if (Convert.ToInt16(row[0]) == nationalID)
                                {
                                    exist = 0;
                                    break;
                                }
                            }

                            if (exist == 1)
                            {
                                addFanproc.ExecuteNonQuery();
                                Response.Redirect("/login.aspx");
                            }
                            else
                            {
                                comment.Text = "there is a User with this ID";
                            }
                        }
                        else
                            comment.Text = "User name already exist";

                    }
                }
                catch
                {
                    comment.Text = "Phone Number shouldn't have any character";
                }
            }
            catch
            {
                comment.Text = "National ID shouldn't have any character";
            }
            connection.Close();
        }
    }
}