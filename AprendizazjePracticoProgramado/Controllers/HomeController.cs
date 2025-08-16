using AprendizazjePracticoProgramado.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

//importar lo necesario
using System.Data;
using System.Data.SqlClient;
//using AprendizazjePracticoProgramado.Models;
using System.Text;
using System.Web.UI.WebControls;
using System.Configuration;
using Microsoft.Ajax.Utilities;



namespace AprendizazjePracticoProgramado.Controllers
{
    public class HomeController : Controller
    {
        // GET: ACCESO
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Autenticar()
        {
            ViewBag.Message = "Your authenticate page.";

            return View();
        }

        public ActionResult Registro()
        {
            ViewBag.Message = "Your registra page.";
            return View();

        }




        // POST: Acceso/Autenticar
        [HttpPost]
        public ActionResult Autenticar(Empleado oEmpleado)
        {
            string mensaje = "";
            try
            {
                using (SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("sp_UserAuthentication", conexion);
                    //SqlCommand cmd = new SqlCommand("Select * from employees", conexion);
                    cmd.Parameters.AddWithValue("usuario", oEmpleado.correo);
                    cmd.Parameters.AddWithValue("clave", oEmpleado.clave);
                    cmd.Parameters.Add("id",SqlDbType.Int).Direction = ParameterDirection.Output;
                    cmd.Parameters.Add("mensaje", SqlDbType.VarChar,100).Direction = ParameterDirection.Output;
                    cmd.CommandType = CommandType.StoredProcedure;
                    //cmd.CommandType = CommandType.Text;
                    //SqlCommand cmd = new SqlCommand("SELECT * FROM employees", conexion);
                    conexion.Open();
                    cmd.ExecuteNonQuery();
                    // Reemplaza la línea problemática por esta conversión explícita a string:
                    oEmpleado.Id = cmd.Parameters["id"].Value.ToString();
                    //oEmpleado.Id= Convert.ToInt32(cmd.Parameters["id"].Value);
                    mensaje = cmd.Parameters["mensaje"].Value.ToString();
                    conexion.Close();

                    //return RedirectToAction("Index", "Home");
                    
                    if(oEmpleado.Id == "1"){
                        return RedirectToAction("Index", "Home");

                    } else if (oEmpleado.Id == "0")
                    {
                        return RedirectToAction("Registro", "Home");
                    }
                    else
                    {
                        return View();
                    }
                }
            }
            catch (Exception e)
            {
                // Manejo de excepciones
                Console.WriteLine("Error: " + e.Message);
                return View();

            }

        }
        /*
        // POST: Acceso/Autenticar
        [HttpPost]
        public ActionResult Autenticar(Empleado oEmpleado)
        {
            // Usamos el bloque 'try-catch' para capturar cualquier error de conexión o de SQL.
            try
            {
                // 1. Obtiene la cadena de conexión desde Web.config.
                string connectionString = ConfigurationManager.ConnectionStrings["Cnn"].ConnectionString;

                // 2. Usamos 'using' para asegurar que la conexión se cierre automáticamente.
                using (SqlConnection conexion = new SqlConnection(connectionString))
                {
                    // 3. Define la consulta SQL. En este caso, solo necesitamos una simple
                    // para saber si podemos leer de la tabla.
                    string sqlQuery = "SELECT COUNT(*) FROM employees";

                    // 4. Crea un objeto SqlCommand con la consulta y la conexión.
                    using (SqlCommand cmd = new SqlCommand(sqlQuery, conexion))
                    {
                        // 5. Abre la conexión a la base de datos.
                        conexion.Open();

                        // 6. Ejecuta la consulta y obtiene el resultado.
                        // 'ExecuteScalar()' es ideal para consultas que devuelven un solo valor (como COUNT).
                        int count = (int)cmd.ExecuteScalar();

                        // 7. Si no hubo errores y el conteo es mayor o igual a cero, la conexión es exitosa.
                        // Opcionalmente, puedes mostrar un mensaje de éxito.
                        ViewBag.Mensaje = $"¡Conexión exitosa! La tabla 'employees' tiene {count} registros.";
                    }
                }
            }
            catch (SqlException ex)
            {
                // 8. Si ocurre un error de SQL (ej: servidor no encontrado, tabla no existe),
                // se captura aquí y se muestra un mensaje de error.
                ViewBag.Mensaje = $"Error de conexión: {ex.Message}";
            }
            catch (Exception ex)
            {
                // 9. Captura cualquier otro tipo de error.
                ViewBag.Mensaje = $"Ha ocurrido un error inesperado: {ex.Message}";
            }

            // Retorna la vista con el mensaje de estado.
            return View("Autenticar");
        }
        */
    }
}