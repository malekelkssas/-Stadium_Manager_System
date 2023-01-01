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
    public partial class SportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //(string)Session["UserName"]  <<-- this is how to get the username
            if (Session["IsLoggedIn"] == null || !((string)Session["IsLoggedIn"]).Equals("SportsAssociationManager"))
                Response.Redirect("/login.aspx");
            else
                comment.Text = "Welcome " + (string)Session["UserName"];
        }
        protected void Add_match(object sender, EventArgs e)
        {

            //(string)Session["UserName"]  <<-- this is how to get the username
            Response.Redirect("/AddMatch.aspx");
        }
        protected void Remove_Match(object sender, EventArgs e)
        {
            //(string)Session["UserName"]  <<-- this is how to get the username
            Response.Redirect("/DeleteMatch.aspx");
        }
        protected void Coming_Matches(object sender, EventArgs e)
        {
            Response.Redirect("/ComingMatches.aspx");
            //(string)Session["UserName"]  <<-- this is how to get the username
        }
        protected void Played_Matches(object sender, EventArgs e)
        {
            Response.Redirect("/PlayedMatches.aspx");
            //(string)Session["UserName"]  <<-- this is how to get the username
        }
        protected void Never_Matched(object sender, EventArgs e)
        {
            Response.Redirect("/NeverMatches.aspx");
            //(string)Session["UserName"]  <<-- this is how to get the username
        }
    }
}