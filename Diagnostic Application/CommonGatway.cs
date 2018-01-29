using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
namespace Diagnostic_Application
{
    public class CommonGatway
    {
        public string connectionString = WebConfigurationManager.ConnectionStrings["DiagnosisAppDB"].ConnectionString;

        public SqlConnection connection { get; set; }
        public SqlCommand command { get; set; }

        public CommonGatway()
        {
            connection = new SqlConnection(connectionString);
            command = new SqlCommand();
            command.Connection = connection;
        }

    }
}