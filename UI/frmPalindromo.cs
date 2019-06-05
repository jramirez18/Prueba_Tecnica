using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace UI
{
    public partial class frmPalindromo : Form
    {

        string texto, verifica = "";
        public frmPalindromo()
        {
            InitializeComponent();
        }

        private void btn_Verificar_Click(object sender, EventArgs e)
        {
            texto= textBox1.Text;
            for (int i = texto.Length-1; i >=0; i--)
            {
                verifica += texto[i].ToString();

            }
            if (texto==verifica)
            {
                label2.Text = texto + " Es un palindromo";
                

            }else
            {
                label2.Text = texto + " No es un palindromo";
                
            }
            textBox1.Clear();
            textBox1.Focus();
            verifica = default(String);
        }
    }
}
