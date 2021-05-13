using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Library_System_Prototype.App_Code
{
    public class clsUser
    {

        //List of instances of this class
        public List<clsUser> users = new List<clsUser>();

        //Properties of the class
        public String userId;
        public String fk1_bor_type_id;
        public String firstName;
        public String lastName;
        public String address1;
        public String address2;
        public String address3;
        public String phoneNo;
        public String EMail;
        public String status;

        public clsUser()
        {
            //Empty constructor to initialise an instance
        }

        //Overloaded constructor to fill the instances of this class with data
        public clsUser(string firstName, string lastName)
        {
            //Connect to the db and find all users whose names match the parameters
            clsDataConnection dbManager = new clsDataConnection();
            dbManager.AddParameter("@firstName", firstName);
            dbManager.AddParameter("@lastName", lastName);
            dbManager.Execute("sproc_tblBorrower_findBorrowers");
            
            //Fill the list of this class' instances with retrieved data
            for(Int32 i = 0; i < dbManager.Count; ++i)
            {
                clsUser singleUser = new clsUser();

                singleUser.userId = Convert.ToString(dbManager.DataTable.Rows[i]["bor_id"]);
                singleUser.fk1_bor_type_id = Convert.ToString(dbManager.DataTable.Rows[i]["fk1_bor_type_id"]);
                singleUser.firstName = Convert.ToString(dbManager.DataTable.Rows[i]["bor_firstname"]);
                singleUser.lastName = Convert.ToString(dbManager.DataTable.Rows[i]["bor_surname"]);
                singleUser.address1 = Convert.ToString(dbManager.DataTable.Rows[i]["bor_address_1"]);
                singleUser.address2 = Convert.ToString(dbManager.DataTable.Rows[i]["bor_address_2"]);
                singleUser.address3 = Convert.ToString(dbManager.DataTable.Rows[i]["bor_address_3"]);
                singleUser.phoneNo = Convert.ToString(dbManager.DataTable.Rows[i]["bor_tel"]);
                singleUser.EMail = Convert.ToString(dbManager.DataTable.Rows[i]["bor_email"]);
                singleUser.status = Convert.ToString(dbManager.DataTable.Rows[i]["bor_status"]);

                users.Add(singleUser);
            }
        }

        //This function accepts a user and replaced their old data with the
        //data contained in the instance
        public void UpdateUser(clsUser userToUpdate)
        {
            clsDataConnection dbManager = new clsDataConnection();

            dbManager.AddParameter("@userId", userToUpdate.userId);
            dbManager.AddParameter("@firstName", userToUpdate.firstName);
            dbManager.AddParameter("@lastName", userToUpdate.lastName);
            dbManager.AddParameter("@addressLine1", userToUpdate.address1);
            dbManager.AddParameter("@addressLine2", userToUpdate.address2);
            dbManager.AddParameter("@addressLine3", userToUpdate.address3);
            dbManager.AddParameter("@email", userToUpdate.EMail);
            dbManager.AddParameter("@phoneNo", userToUpdate.phoneNo);
            dbManager.AddParameter("@userType", userToUpdate.fk1_bor_type_id);
            dbManager.AddParameter("@status", userToUpdate.status);

            dbManager.Execute("sproc_tblBorrower_UpdateBorrowerDetails");
        }

    }
}