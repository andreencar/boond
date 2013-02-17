using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace boond.Entitys
{
    public class Product
    {
        private int _cat;

        public int Cat
        {
            get { return _cat; }
        }

        private int _subCat;

        public int SubCat
        {
            get { return _subCat; }
        }
        
        private int _id;

        public int Id
        {
            get { return _id; }
        }
        
        private String _name;

        public String Name
        {
            get { return _name; }
        }

        private String _feedURI;

        public String FeedURI
        {
            get { return _feedURI; }
        }

        private String _imageURI;

        public String ImageURI
        {
            get { return _imageURI; }
        }

        public Product(int cat, int subCat, int id, String name, String feedUri, String imageUri)
        {
            _cat = cat; _subCat = subCat; _id = id; _name = name; _feedURI = feedUri; _imageURI = imageUri;
        }
    }
}