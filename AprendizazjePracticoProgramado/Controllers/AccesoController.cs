using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

//importing the necessary libreries
using System.Data;
using System.Data.SqlClient;

// importar funcionalidades
using System.Security.Cryptography;
using System.Configuration; 

namespace AprendizazjePracticoProgramado.Controllers
{
    public class AccesoController : Controller
    {
        // GET: Acceso
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Autenticar()
        {
            return View();
        }

        // POST: Acceso/Autenticar
        // [HttpPost]
        //public ActionResult Autenticar()



    }
}