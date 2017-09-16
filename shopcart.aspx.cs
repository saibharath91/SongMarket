using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;


public partial class shopcart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Request.QueryString["id"] != "")
        {
            string strSongID = ""; //declare a local variable strSongID
            strSongID = (string)Request.QueryString["id"];
            if (Request.QueryString["action"] == "'add'")
            {
                AddItem(strSongID);
            }
            else if ((string)Request.QueryString["action"] == "'del'")
            {
                //Todo
                DeleteItem(strSongID);
            }
            else //must be "show" items in the shopcart
            {
                //Todo
                ShowItems();
            }
        }

        if (Session["shopCartID"] != null)
        {
            //Calculate shopcart total value
            CalcTotal();
        }
    } //end of page load method

    void AddItem(string strSongID)
    {
        //declare and initialize connection object to connect to the database
        SqlConnection conn = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd; //declare a command object that will be used to send commands to database.
        SqlParameter shopCartIDParam; //declare a parameter object that will be passed to a stored procedure 
        SqlParameter userIDParam; //declare another parameter object

        conn.Open(); //open a connection to the database
        cmd = conn.CreateCommand(); //create a command object

        //Check if this is the first time to enter an item into shopcart
        if (Session["shopCartID"] == null)
        {
            //This is the first item to be added into the shopcart;
            //so, create a new shopcart record. We will use pNewShopCart() stored procedure
            //to create a new record in shopcart table.
            //pNewShopcart() takes two parameters: @shopcartID (output) and @userID (input)
            shopCartIDParam = new SqlParameter();
            shopCartIDParam.ParameterName = "@ShopcartID";
            shopCartIDParam.SqlDbType = SqlDbType.Int;
            shopCartIDParam.Direction = ParameterDirection.Output;

            userIDParam = new SqlParameter();
            userIDParam.ParameterName = "@UserID";
            userIDParam.SqlDbType = SqlDbType.NVarChar;
            userIDParam.Direction = ParameterDirection.Input;

            //check if user is login
            //if ((string)Session["userName"] != null && (string)Session["userName"] != "")
            if ((string)Session["userName"] != null)
            {
                //user is login. Get the userID of this user and pass it as an input parameter
                //to the pNewShopcart() stored procedure.
                userIDParam.Value = Session["userID"];
            }
            else //user is not login
            {
                //temporary code for testing only
                //MembershipUser usr = Membership.GetUser("user02");
                //userIDParam.Value = usr.ProviderUserKey;
                userIDParam.Value = ""; //set userIDParam to Null
            }

            cmd.Parameters.Add(shopCartIDParam); //add the first parameter
            cmd.Parameters.Add(userIDParam); //add the second parameter
            cmd.CommandText = "pNewShopCart";  //this is the name of the stored procedure
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery(); //send the command to execute the stored procedure

            //get the newly generated shopcartID from the output parameter and store it in
            //a session variable. This way, we can use it later as a foreign key in ShopcartLine table
            Session["shopCartID"] = (int)shopCartIDParam.Value;

            //Add an item into ShopcartLine table
            cmd.CommandText = "Insert into Shopcartline Values (" + Session["shopCartID"] + ", " + strSongID + ", 1)";
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        else //shopcart was already created. We need to add an item into an existing shopcart
        //Check if incoming SongID is already in the shopcart. If it is, simply increment the quantity by one
        //else, insert a new row.
        {
            cmd.CommandText = "Select * from Shopcartline where ShopcartID = " + Session["ShopCartID"] + " and SongID = " + strSongID;
            cmd.CommandType = CommandType.Text;
            SqlDataReader shopCartLineReader;
            shopCartLineReader = cmd.ExecuteReader();

            if (shopCartLineReader.HasRows)
            {
                shopCartLineReader.Close();
                cmd.CommandText = "Update ShopcartLine set Quantity = Quantity + 1 Where ShopCartID = " + Session["ShopCartID"] + " and SongID = " + strSongID;
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            else
            {
                shopCartLineReader.Close();
                //Add an item into ShopcartLine table
                cmd.CommandText = "Insert into Shopcartline Values (" + Session["ShopCartID"] + ", " + strSongID + ", 1)";
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
            }
            conn.Close();
        }
    } //end of AddItem()

    void DeleteItem(string strSongID)
    {
        //declare and initialize connection object to connect to the database
        SqlConnection conn = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd; //declare a command object that will be used to send commands to database.
        conn.Open(); //open a connection to the database
        cmd = conn.CreateCommand(); //create a command object

        //Delete the item from ShopcartLine table
        cmd.CommandText = "Delete from Shopcartline Where ShopCartID = " + Session["ShopCartID"] + " and SongID = " + strSongID;
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
    } //end of DeleteItem()

    void ShowItems()
    {
        //Todo: no need to do anything here...

    } //end of ShowItems()

    void CalcTotal()
    {
        //Todo
        //declare and initialize connection object to connect to the database
        SqlConnection conn = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd; //declare a command object that will be used to send commands to database.
        conn.Open();
        cmd = conn.CreateCommand();

        cmd.CommandText = "Select Sum(Quantity*Listprice) " +
            "From Shopcartline as SHL inner join Song as S on SHL.SongID = S.SongID " +
            "Where ShopcartID = " + Session["shopCartID"];
        cmd.CommandType = CommandType.Text;

        //declare an SqlDataReader variable
        SqlDataReader dataReader;
        dataReader = cmd.ExecuteReader();

        if (dataReader.HasRows)
        {
            dataReader.Read();
            lblAmount.Text = string.Format("{0:c}", dataReader.GetValue(0));
            HyperLink1.Visible = true;
        }
        else
        {
            lblAmount.Text = "";
            HyperLink1.Visible = false;
        }
        conn.Close();
    }

    protected void HyperLink1_Load(object sender, EventArgs e)
    {
        if (lblAmount.Text=="")
            HyperLink1.Visible = false;
        else
            HyperLink1.Visible = true;
    }
}