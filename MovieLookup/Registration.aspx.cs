using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieLookup
{
    public partial class Registration : System.Web.UI.Page
    {
        protected Boolean done = false;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Regex sampleRegex = new Regex(@"^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!*@#$%^&+=]).*$");
            lblRegistrationError.Text = "";

            if (txtFirstName.Text == String.Empty || txtLastName.Text == String.Empty || txtEmail.Text == String.Empty || txtUsername.Text == String.Empty)
            {
                lblRegistrationError.Text = "Please fill out all fields";
            }

            else if (!sampleRegex.IsMatch(txtPassword.Text))
            {
                lblRegistrationError.Text = "Password must meet password requirements.";
            }
            else if (txtPasswordConfirm.Text != txtPassword.Text)
            {
                lblRegistrationError.Text = "Passwords do not match.";
            }
            else
            {

                SqlConnection conn = null;
                try
                {
                    string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    conn = new SqlConnection(connString);

                    String check = "SELECT * FROM [User] WHERE Username = '" + txtUsername.Text + "'";
                    SqlDataAdapter adapter = new SqlDataAdapter(check, conn);
                    DataTable table = new DataTable();
                    adapter.Fill(table);
                    if (table.Rows.Count == 1)
                    {
                        lblRegistrationError.Text = "Username already exists. Please choose a new username.";
                        throw new Exception("Username already exists.");
                    }
                    else
                    {
                        string query = "INSERT INTO [User] ([FirstName], [LastName], [Email], [Username], [Password]) VALUES ('" + txtFirstName.Text + "','" + txtLastName.Text + "','" + txtEmail.Text + "','" + txtUsername.Text + "','" + txtPassword.Text + "')";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        conn.Open();
                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        done = true;
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("Error occurred: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                    if (done)
                    {
                        Response.Redirect("login.aspx");
                    }
                }
            }
        }

        protected void btnSearchPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}