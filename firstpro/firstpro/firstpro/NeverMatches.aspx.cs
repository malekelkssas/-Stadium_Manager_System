﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated. 
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Xml.Linq;
using System.Reflection.Emit;

namespace firstpro
{


    public partial class NeverMatches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["IsLoggedIn"] == null || !((string)Session["IsLoggedIn"]).Equals("SportsAssociationManager"))
                Response.Redirect("/login.aspx");
            else
            {
                comment.Text = " ";
                String connstr = WebConfigurationManager.ConnectionStrings["MyDB"].ToString();
                //creating a new connection
                SqlConnection conn = new SqlConnection(connstr);
                //  SqlCommand clubsNeverMatched = new SqlCommand("clubsNeverMatched", conn);
                //  clubsNeverMatched.CommandType = CommandType.TableDirect;
                conn.Open();

                DataTable Tmp = new DataTable();

                new SqlDataAdapter("select * from clubsNeverMatched", conn).Fill(Tmp);
                Label2.Text = "";
                Label4.Text = "";
                foreach (DataRow row in Tmp.Rows)
                {
                    Label2.Text = Label2.Text + (row[0] + " ");
                    Label4.Text = Label4.Text + (row[1] + " ");

                }
                //    conn.Open();    
                //   SqlDataReader rdr= clubsNeverMatched.ExecuteReader(CommandBehavior.CloseConnection);

                /*   while (rdr.Read())
                   {
                             Label name1 = new Label();
                             string club1 = rdr.GetString(rdr.GetOrdinal("name1"));
                             name1.Text = "hello";
                             string club2 = rdr.GetString(rdr.GetOrdinal("name2"));
                             Label name2 = new Label();
                             name2.Text = club2;
                             form1.Controls.Add(name1);
                             form1.Controls.Add(name2);
                  */
                //(string)Session["UserName"]  <<-- this is how to get the username
            }
        }
    }
}
