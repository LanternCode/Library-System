using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Library_System_Prototype.App_Code
{
    public class clsFine
    {

        //Public properties of the class
        public DateTime fineDate;
        public Int32 fineTotal;
        public Int32 finedPersonId;
        public String finedPersonName;
        public Int32 resultingLoanId;
        public String resultingLoanName;

        public clsFine()
        {
            //empty constructor just to initiate the class instance
        }

        //Overloaded constructor to fill the class with data from the database
        public clsFine(String fineId)
        {
            //Connect with the DB and get all the data about a single fine
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@fineId", fineId);
            dbManager.Execute("sproc_tblFine_selectFine");

            //Assign retrieved data to the class' attributes
            fineDate = Convert.ToDateTime(dbManager.DataTable.Rows[0]["fine_date"]);
            fineTotal = Convert.ToInt32(dbManager.DataTable.Rows[0]["fine_amount"]);
            finedPersonId = Convert.ToInt32(dbManager.DataTable.Rows[0]["fk1_bor_id"]);
            resultingLoanId = Convert.ToInt32(dbManager.DataTable.Rows[0]["fk2_loan_id"]);

            //Retrieve the title of the book assigned to this fine
            dbManager.AddParameter("@fineId", fineId);
            dbManager.Execute("sproc_GetBookTitleByFineId");
            resultingLoanName = Convert.ToString(dbManager.DataTable.Rows[0]["bk_title"]);

            //Retrieve the full name of the borrower who was fined
            dbManager.AddParameter("@fineId", fineId);
            dbManager.Execute("sproc_GetUserNameByFineId");
            finedPersonName = Convert.ToString(dbManager.DataTable.Rows[0]["bor_name"]);
        }

        //This function deleted a fine with the specified ID from the database
        public void deleteFine(Int32 fineId)
        {
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@fineId", fineId);
            dbManager.Execute("sproc_tblFine_removeFine");
        }

        //This function changes fine with Id of [@fineId] status from DUE to PAID
        public void markFineAsPaid(String fineId)
        {
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@fineId", fineId);
            dbManager.Execute("sproc_tblFine_MarkFineAsPaid");
        }

    }
}