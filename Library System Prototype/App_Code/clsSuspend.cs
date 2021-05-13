using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsSuspend
/// </summary>
public class clsSuspend
{
    public clsSuspend()
    {
        //Empty constructor to allow initialisation
    }

    //This function changes user's suspension status to 'Suspended'
    public void SuspendUser(string Id)
    {
        clsDataConnection db = new clsDataConnection();
        db.AddParameter("@Id", Id);
        db.Execute("sproc_SuspendUser");
    }

    //This function is used to undo a previously performed suspension
    public void UnsuspendUser(string Id)
    {
        clsDataConnection db = new clsDataConnection();
        db.AddParameter("@Id", Id);
        db.Execute("sproc_UnsuspendUser");
    }
}