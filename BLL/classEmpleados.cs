using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.DataSet_EmpleadosTableAdapters;
using System.Data;

namespace BLL
{
    public class classEmpleados
    {
        private empleadosTableAdapter empleado;

        private empleadosTableAdapter EMPLEADO
        {
            get
            {
                if (empleado == null)
                    empleado = new empleadosTableAdapter();
                return empleado;
            }
        }


        public string InsertarEmpleado(string dpi, string nombre_completo, int total_hijos, int salario_base)
        {
            string msj = "";
            try
            {
                EMPLEADO.GetData_Insertar(dpi, nombre_completo, Convert.ToInt16(total_hijos), salario_base, ref msj);
            }
            catch (Exception error)
            {

                msj = error.Message;
            }
            return msj;
        }

        public DataTable ListarEmp()
        {
            return EMPLEADO.GetData_Llistar();
        }

        public DataTable EliminarEmp(int id_empleado)
        {
            return EMPLEADO.GetData_Eliminar(id_empleado);
        }
    }
}
