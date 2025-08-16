using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AprendizazjePracticoProgramado.Models;

namespace AprendizazjePracticoProgramado.Controllers
{
    public class DepartamentoController : Controller
    {
        // GET: Departamento
        [HttpGet]
        public ActionResult Departamento()
        {
            return View(); // busca Views/Departamento/Departamento.cshtml
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Departamento(Departamento dep)
        {
            try
            {
                using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand("sp_insertDeparment", cn)) // verifica el nombre del SP
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombreDepar", dep.nombreDepar); // el parámetro del SP debe ser @nombre
                    cn.Open();
                    cmd.ExecuteNonQuery();
                }
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                return View(dep); // devuelve la vista con el modelo para mostrar errores
            }
        }
    }
}