using AprendizazjePracticoProgramado.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AprendizazjePracticoProgramado.Controllers
{
    public class EmpleadoController : Controller
    {
        // GET: Empleado
        [HttpGet]
        public ActionResult Registrar()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Registrar( Empleado emp )
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_insertEmployee", cn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("ci", emp.ci);
                    cmd.Parameters.AddWithValue("nombre", emp.nombre);
                    cmd.Parameters.AddWithValue("apellido", emp.apellido);
                    cmd.Parameters.AddWithValue("fechaNacimiento", emp.fechaNacimiento);
                    cmd.Parameters.AddWithValue("genero", emp.genero);
                    cmd.Parameters.AddWithValue("correo", emp.correo);
                    cmd.Parameters.AddWithValue("clave", emp.clave);
                    cn.Open();
                    cmd.ExecuteNonQuery();
                    cn.Close();
                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error:" + ex);
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                return View();
            }
        }
    }
}