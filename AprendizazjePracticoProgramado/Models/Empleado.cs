using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AprendizazjePracticoProgramado.Models
{
    public class Empleado
    {
           public string ci
        {
            get; set;
        }

        public string fechaNacimiento
        {
            get; set;
        }
        public string nombre
        {
            get; set;
        }
        public string apellido
        {
            get; set;
        }
        public string genero
        {
            get; set;
        }
        public string hire_date
        {
            get; set;
        }
        public string correo
        {
            get; set;
        }
        public string usuario
        {
            get; set;
        }
        public string clave
        {
            get; set;
        }
        public string Id
        {
            get; set;
        }
    }
}