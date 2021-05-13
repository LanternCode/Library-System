using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Library_System_Prototype.App_Code
{
    public class clsLoan
    {

        //List of instances of this class
        public List<clsLoan> loans = new List<clsLoan>();

        //Properties of the class
        public String loanId;
        public DateTime loanIssueDate;
        public String bookTitle;

        //Overloaded constructor to fill the instances of this class with data
        public clsLoan(string userId)
        {
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@userId", userId);
            dbManager.Execute("sproc_tblLoan_findUserLoans");

            for (Int32 i = 0; i < dbManager.Count; ++i)
            {
                clsLoan singleLoan = new clsLoan();

                singleLoan.loanId = Convert.ToString(dbManager.DataTable.Rows[i]["loan_id"]);
                singleLoan.loanIssueDate = Convert.ToDateTime(dbManager.DataTable.Rows[i]["loan_issue_date"]);

                clsDataConnection tempManager = new clsDataConnection();
                tempManager.AddParameter("@loanId", singleLoan.loanId);
                tempManager.Execute("sproc_GetBookTitleByLoanId");

                singleLoan.bookTitle = Convert.ToString(tempManager.DataTable.Rows[0]["bk_title"]);

                loans.Add(singleLoan);
            }
        }

        public clsLoan()
        {
            //Empty constructor to initialise an instance
        }

        public void setLoanReturnDate(string loanId, string returnDate)
        {
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@loanId", loanId);
            dbManager.AddParameter("@returnDate", returnDate);
            dbManager.Execute("sproc_tblLoan_SetLoanReturnDate");
        }

    }
}