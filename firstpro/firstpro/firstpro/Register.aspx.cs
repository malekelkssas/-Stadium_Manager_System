using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace firstpro
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SportsAssociationManagerReg(object sender, EventArgs e)
        {
            Response.Redirect("/SportsAssociationManagerReg.aspx");
        }

        protected void ClubRepresentativeReg(object sender, EventArgs e)
        {
            Response.Redirect("/ClubRepresentativeReg.aspx");
        }

        protected void StadiumManagerReg(object sender, EventArgs e)
        {
            Response.Redirect("/StadiumManagerReg.aspx");
        }

        protected void FanReg(object sender, EventArgs e)
        {
            Response.Redirect("/FanReg.aspx");
        }
    }
}