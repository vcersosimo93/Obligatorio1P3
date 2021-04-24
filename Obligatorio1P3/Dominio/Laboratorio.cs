using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Dominio
{
    public class Laboratorio
    {
        private int id;
        private string nombre;
        private Pais paisOrigen;
        private bool experiencia;
        

        
        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public Pais PaisOrigen
         {
             get { return paisOrigen; }
             set { paisOrigen = value; }
         }

        public bool Experiencia
        {
            get { return experiencia; }
            set { experiencia = value; }
        }

        

        public Laboratorio(int id, string nombre, Pais paisOrigen, bool experiencia)
        {
            this.id = id;
            this.nombre = nombre;
            this.paisOrigen = paisOrigen;
            this.experiencia = experiencia;
            
        }

        public Laboratorio()
        {

        }


    }
}
