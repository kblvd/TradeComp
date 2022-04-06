using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TradeComp
{
    public partial class ShowInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource2.Insert();
            GridView2.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Panel1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            Panel1.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Button4.Text == "Рекатировать заказы")
            {
                GridView2.AutoGenerateEditButton = true;
                Button4.Text = "Закончить редактирование";
            } 
            else
            {
                GridView2.AutoGenerateEditButton = false;
                Button4.Text = "Рекатировать заказы";
            }
                
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (Button5.Text =="Удалить заказ")
            {
                GridView2.AutoGenerateEditButton = true;
                Button5.Text = "Закончить удаление";
            }
            else
            {
                GridView2.AutoGenerateEditButton = false;
                Button5.Text = "Удалить заказ";
            }
        }
    }
}