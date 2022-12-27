using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace firstpro
{
    public partial class Fan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //(string)Session["UserName"]  <<-- this is how to get the username
            if (!((bool)Session["IsLoggedIn"]))
                Response.Redirect("/login.aspx");
        }
    }
}