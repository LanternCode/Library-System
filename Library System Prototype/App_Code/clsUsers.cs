using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsUsers
/// </summary>
public class clsUsers
{
    clsDataConnection db = new clsDataConnection();
    public clsUsers()
    {
        //Empty constructor to allow initialization
    }
    
    public List<clsUserSearch> UserSearch
    {
        get
        {
            List<clsUserSearch> mUserSearch = new List<clsUserSearch>();
            db = new clsDataConnection();

            if (mName == null)
            {
                mName = "";
            }

            db.AddParameter("@Name", mName);
            db.Execute("sproc_SearchUsers");
            Int32 Index = 0;
            Int32 Count;
            Count = db.Count;

            while (Index < Count)
            {
                clsUserSearch NewUser = new clsUserSearch();
                NewUser.Bor_ID = Convert.ToString(db.DataTable.Rows[Index]["bor_id"]);
                NewUser.Bor_FirstName = Convert.ToString(db.DataTable.Rows[Index]["bor_firstname"]);
                NewUser.Bor_Surname = Convert.ToString(db.DataTable.Rows[Index]["bor_surname"]);
                mUserSearch.Add(NewUser);
                Index++;
            }
            return mUserSearch;
        }
    }
    public Int32 Count
    {
        get
        {
            return db.Count;

        }
    }
    private string mName;
    public string Name
    {
        get
        {
            return mName;

        }
        set
        {
            mName = value;
        }
    }

    private string mSuspension;
    public string Suspension
    {
        get
        {
            return mSuspension;

        }
        set
        {
            mSuspension = value;
        }
    }

}