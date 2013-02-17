
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace boond.Entitys
{
    public class Category
    {
        private int _id;

        public int Id
        {
            get { return _id; }
        }

        private String _nome;

        public String Nome
        {
            get { return _nome; }
        }

        public Category(int id, String nome)
        {
            _id = id; _nome = nome;
        }

    }
}