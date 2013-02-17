using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace boond.App_Start
{
    public class DatabaseHandler
    {
        private SqlConnection myConn;
        public SqlConnection Connection { get { return myConn; } }

        public DatabaseHandler() {
            myConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        }



    }
}