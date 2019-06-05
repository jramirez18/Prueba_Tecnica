using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DataSet_UserTableAdapters;

namespace BLL
{
    public class classUsers
    {
        private usuariosTableAdapter user;

        private usuariosTableAdapter USER
        {
            get
            {
                if (user == null)
                    user = new usuariosTableAdapter();
                return user;
            }
        }


        public bool ValidarUsuario(string usuario, string password)
        {

            if (USER.GetData_Validar(usuario, password) == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
