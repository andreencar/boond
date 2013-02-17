using boond.Entitys;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace boond.App_Start
{
    public class DbProductsHandler
    {
        public Product getProductFromSubCat(Product toDiffer)
        {
            try
            {
                MvcApplication.Handler.Connection.Open();
                SqlCommand cmd = new SqlCommand("GetSubCatProduct", MvcApplication.Handler.Connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubCat", SqlDbType.Int).Value = toDiffer.SubCat;
                cmd.Parameters.AddWithValue("@returnvalue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                int valueRet = (int)cmd.Parameters["@returnvalue"].Value;
                if (toDiffer.Id == valueRet)
                    return getProductFromSubCat(toDiffer);
                /* SELECT Product with ID Equals to valueRet */
            }
        }

        public List<Category> getFavCats(int userID) { 
        
        }

        public List<Product> getProductsForBattle(int category) { 
        
        }
    }
}