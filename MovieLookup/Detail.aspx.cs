using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieLookup
{
    public partial class Detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnWatchList_Click(object sender, EventArgs e)
        {
            Response.Redirect("watchlist.aspx");
        }

        protected void btnAddToWatchList_Click(object sender, EventArgs e)
        {
            String movID = Request.QueryString["t"];
            String userIDFromCookie = Request.Cookies["user"].Value;

            SqlConnection conn = null;
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                conn = new SqlConnection(connString);

                String check = "SELECT * FROM [WatchList] WHERE UserID = '" + userIDFromCookie + "'" + "AND MovieID = '" + movID + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(check, conn);
                DataTable table = new DataTable();
                adapter.Fill(table);
                if (table.Rows.Count == 1)
                {
                    lblAddError.Text = "You already have this Movie in your watch list.";
                    throw new Exception("Movie already exists in watch list.");
                }
                else
                {
                    String query = "INSERT INTO [WatchList] ([UserID], [MovieID]) VALUES ('" + userIDFromCookie + "','" + movID + "')";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();

                    lblAddError.Text = "Movie added to watchlist";
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error occurred: " + ex.Message);
            }
        }
    }
}