using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        classUsers logica = new classUsers();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {
            string msj = "Usuario o Clave no validos";
            if (logica.ValidarUsuario(txtUser.Text, txtPassword.Text))
            {
                frmEmpleados frm = new frmEmpleados();
                Response.Redirect("frmEmpleados.aspx");
            }
            else
            {
              
                this.Page.Response.Write("<script language='JavaScript'>window.alert('" + msj + "');</script>");
                txtUser.Text = "";
                txtPassword.Text = "";
                txtUser.Focus();
                return;
            }

            
            
        }
    }
}