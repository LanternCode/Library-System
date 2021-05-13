using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsUserSearch
/// </summary>
public class clsUserSearch
{

    private string mBor_ID;
    public string Bor_ID
    {
        get
        {
            return mBor_ID;
        }
        set
        {
            mBor_ID = value;
        }
    }

    private string mBor_FirstName;
    public string Bor_FirstName
    {
        get
        {
            return mBor_FirstName;
        }
        set
        {
            mBor_FirstName = value;
        }
    }

    private string mBor_Surname;
    public string Bor_Surname
    {
        get
        {
            return mBor_Surname;
        }
        set
        {
            mBor_Surname = value;
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

    public clsUserSearch()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}