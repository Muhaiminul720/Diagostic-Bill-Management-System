using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Diagnostic_Application.Models;


namespace Diagnostic_Application.DAL {
    public class TestEntryGetway:CommonGatway 
    {
      

        public List<TestSetup> GetAllTestSetup(){
            
            SqlConnection connection = new SqlConnection(connectionString);
            string query = "SELECT * FROM TestSetup";
            SqlCommand command = new SqlCommand(query, connection);
            
            List<TestSetup> testSetupList = new List<TestSetup>();
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();

            if (reader.HasRows){
                while (reader.Read()){
                    TestSetup testSetup = new TestSetup();
                    testSetup.Id = int.Parse(reader["id"].ToString());
                    testSetup.TestName = reader["testname"].ToString();
                    testSetup.Fee = Convert.ToDecimal(reader["fee"].ToString());

                    testSetupList.Add(testSetup);
                }
                reader.Close();
            }

            connection.Close();

            return testSetupList;
        }



        public int SavePatient(Patient patient){

            
            string query = "INSERT INTO Patient (patient_name,date_of_birth,bill_no,mobile,paymentStatus,created_at, dueAmount) VALUES('"+ patient.PatientName +"','"+ patient.DateOfBirth +"','"+ patient.BillNumber +"','"+ patient.MobileNo + "', 0 , GETDATE(), '" + patient.DueAmount +"'); SELECT SCOPE_IDENTITY()";

           
           
            int patientID;
            command.CommandType = CommandType.Text;
            command.CommandText = query;
            connection.Open();

            patientID = Convert.ToInt32(command.ExecuteScalar());
            connection.Close();
           

            return patientID;
        }


        public TestSetup GetTestSetup(string testID){
            

            string query = "SELECT id, testname, fee FROM TestSetup WHERE id='" + testID + "'";

            command.CommandText = query;
            connection.Open();
            TestSetup testSetup = null;
            SqlDataReader reader = command.ExecuteReader();
           
            if (reader.HasRows){
                while (reader.Read()){

                    testSetup = new TestSetup();
                    testSetup.Id = int.Parse(reader["id"].ToString());
                    testSetup.TestName = reader["testname"].ToString();
                    testSetup.Fee = Convert.ToDecimal(reader["fee"].ToString());
                    
                }

                reader.Close();
            }

            connection.Close();
            return testSetup;
        }


        public int SavePatientTestInformation(PatientTest patientTest){
            int rowAffected;

            //throw new NotImplementedException();
           ;
            string query = "INSERT INTO PatientTest(patientID, testSetupID, created_at) VALUES(" + patientTest.PatientID + "," + patientTest.TestTypeID + ",GETDATE())";
            command.CommandText = query;
            connection.Open();

            rowAffected = command.ExecuteNonQuery();
            connection.Close();

            return rowAffected;
        }

    }

}