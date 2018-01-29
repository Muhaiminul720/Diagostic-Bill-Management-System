using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Diagnostic_Application.View.View_Model;

namespace Diagnostic_Application.DAL {
    public class UnPaidBillGatway:CommonGatway
    {

        


        public List<UnpaidBillWiseModel> UnpaidBillReport(string fromDate, string toDate) {

        
            string query = @"select * from patient WHERE paymentStatus=0 ORDER BY created_at DESC";
            command.CommandText = query;
            connection.Open();
            SqlDataReader reader = command .ExecuteReader();
            List<UnpaidBillWiseModel> unpaBillViewModels = new List<UnpaidBillWiseModel>();
            while (reader.Read()) {
                UnpaidBillWiseModel unpaidViewModel = new UnpaidBillWiseModel();

                unpaidViewModel.PatientName = (reader["patient_name"].ToString());
                unpaidViewModel.BillNo = reader["bill_no"].ToString();
                unpaidViewModel.MobileNo = reader["mobile"].ToString();
                unpaidViewModel.TotalAmount = Convert.ToDecimal(reader["dueAmount"].ToString());
                unpaBillViewModels.Add(unpaidViewModel);
            }
            reader.Close();
            connection.Close();
            return unpaBillViewModels;
        }
    }
}
