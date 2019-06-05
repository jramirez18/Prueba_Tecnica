using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class frmEmpleados : System.Web.UI.Page
    {
        const double igss = 0.0483;
        const double irtra = 0.01;
        const int bonoPadre = 133;
        const int bonoDecreto = 250;

        classEmpleados emp = new classEmpleados();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Calculos();
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            string msj = "";
            try
            {
                msj = emp.InsertarEmpleado(txtDPI.Text, txtName.Text, Convert.ToInt32(txtTotalHijos.Text), Convert.ToInt32(txtSalario.Text));
                this.Page.Response.Write("<script language='JavaScript'>window.alert('" + msj + "');</script>");
                //Limpiar();
            }
            catch (Exception error)
            {
                this.Page.Response.Write("<script language='JavaScript'>window.alert('" + error.ToString() + "');</script>");
            }
        }

        //        private void Limpiar()
        //        {
        //            TextBox1.Text = "";
        //            TextBox2.Text = "";
        //            TextBox3.Text = "";
        //            TextBox4.Text = "";
        //            TextBox1.Focus();
        //        }

        public void Calculos()
        {
            double totalIgss = igss * Convert.ToDouble(txtSalario.Text);
            txtIGSS.Text = Convert.ToString(totalIgss);

            double totalIrtra = irtra * Convert.ToDouble(txtSalario.Text);
            txtIRTRA.Text = Convert.ToString(totalIrtra);

            double bonoPaterno = bonoPadre * Convert.ToInt16(txtTotalHijos.Text);
            txtBonoP.Text = Convert.ToString(bonoPaterno);

            double salarioTotal = Convert.ToDouble(txtSalario.Text) + bonoPaterno + bonoDecreto;
            txtSalarioTotal.Text = Convert.ToString(salarioTotal);

            double salarioLiquido = salarioTotal - totalIgss - totalIrtra;
            txtSalarioLiquido.Text = Convert.ToString(salarioLiquido);


        }
    }
}