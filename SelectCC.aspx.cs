using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Claims;

public partial class SelectCC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            var identity = new ClaimsIdentity(User.Identity);
            int length = identity.Claims.ElementAt(0).ToString().Length;
            Session["userID"] = identity.Claims.ElementAt(0).ToString().Substring(length - 36);
            Session["userName"] = User.Identity.Name;
        }
        else
        {
            Response.Redirect("~/Account/Login.aspx");
        }

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        Session["CC_No"] = GridView1.SelectedDataKey.Value;
        Response.Redirect("~/checkout.aspx", true);
    }
}