using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Dominio
{
    class Laboratorio
    {
        private int id;
        private string nombre;
        private Pais paisOrigen;
        private bool experiencia;


        public int Id { get { return id; } }

        public string Nombre
        {
            get { return nombre; }
        }

        public Pais PaisOrigen
        {
            get { return paisOrigen; }
        }

        public bool Experiencia
        {
            get { return experiencia; }
        }


        public Laboratorio(int id, string nombre, Pais paisOrigen, bool experiencia)
        {
            this.id = id;
            this.nombre = nombre;
            this.paisOrigen = paisOrigen;
            this.experiencia = experiencia;
        }


    }
}
