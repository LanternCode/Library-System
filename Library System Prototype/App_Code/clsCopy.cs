using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Library_System_Prototype.App_Code
{
    public class clsCopy
    {

        //This function marks a copy included in a loan as returned. Enter parametes is the loan's id.
        public void markCopyAsReturned(String loanId)
        {
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@loanId", loanId);
            dbManager.Execute("sproc_tblCopy_setAvailableStatus");
        }

    }
}