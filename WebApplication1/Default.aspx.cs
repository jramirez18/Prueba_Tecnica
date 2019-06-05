using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        classEmpleados emp = new classEmpleados();

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = emp.ListarEmp();
            GridView1.DataBind();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(GridView1.SelectedRow.Cells[0].Text);
            emp.EliminarEmp(id);
        }
    }
}