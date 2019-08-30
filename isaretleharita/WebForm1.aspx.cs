using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace isaretleharita
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("data source=.;initial catalog=harita;integrated security=True;MultipleActiveResultSets=True");
            conn.Open();
            SqlCommand cmd = new SqlCommand("insert into maps (lat,lng,comment) values (@x,@y,@Aciklama)",conn);
            cmd.Parameters.AddWithValue("@Aciklama", TextBox3.Text.ToString());
            cmd.Parameters.AddWithValue("@x", txtLat.Text.ToString());
            cmd.Parameters.AddWithValue("@y", txtLng.Text.ToString());
            cmd.ExecuteNonQuery();
            conn.Close();
            TextBox3.Text = string.Empty;
            txtLat.Text = string.Empty;
            txtLng.Text = string.Empty;
        }


    }
}