using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Security.Claims;
public partial class AddSong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Upload_Click(object sender, EventArgs e)
    {
        string fileName;
        string saveLocation;

        //declare and initialize connection object to connect to the database
        SqlConnection conn = new SqlConnection(
            WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        SqlCommand cmd; //declare a command object that will be used to send commands to database.

        conn.Open(); //open a connection to the database
        cmd = conn.CreateCommand(); //create a command object
        if ((File1.PostedFile != null) && (File1.PostedFile.ContentLength > 0))
        {
            fileName = System.IO.Path.GetFileName(File1.PostedFile.FileName);
            saveLocation = Server.MapPath("~/SongFolder") + "\\" + fileName;
            try
            {
                File1.PostedFile.SaveAs(saveLocation);
                Response.Write("The file has been uploaded.");
                cmd.CommandText = "Insert into Song Values ('" +
                txtSongID.Text + "', '" +
                txtTitle.Text + "', '" +
                txtAlbum.Text + "', '" +
                txtArtist.Text + "', '" +
                txtGenre.Text + "', '" +
                txtReleaseDate.Text + "', " +
                txtListPrice.Text + ", '" +
                fileName + "', '" +
                fileName + "')";
                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("~/Default.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
                //Note: Exception.Message returns a detailed message that describes the current exception. 
                //For security reasons, we do not recommend that you return Exception.Message to end users in 
                //production environments. It would be better to put a generic error message. 
            }
        }
        else
        {
            Response.Write("Please select a file to upload");
        }
    }
}