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
    public partial class Login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlConnection conn = null;
            try
            {
                string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                conn = new SqlConnection(connString);
                String query = "SELECT * FROM [User] WHERE Username = '" + txtUsername.Text + "' AND Password = '" + txtPassword.Text + "'";
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable table = new DataTable();
               
                adapter.Fill(table);
                DataRow row = table.Rows[0];
                String userIDCookie = row["Id"].ToString();

                if (table.Rows.Count == 1)
                {
                    Response.Cookies["user"].Value = userIDCookie;
                    Response.Redirect("Search.aspx");
                }
                else
                {
                    lblLoginError.Text = "Incorrect Username or password";
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error occurred: " + ex.Message);
            }
            
        }
        
    }
}