<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>
<html>
    <head runat="server">
        <meta charset="utf-8" />
        <title>Library System</title>
        <link rel="stylesheet" href="../styles/main.css" />
        <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
        <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
        <script runat="server">

            //global variables
            clsUser users;
            clsUser user;
            Boolean usersLoaded = false;
            Boolean userSelected = false;

            protected void Page_Load(Object sender, EventArgs e)
            {
                //Once the user submitted user's first and last name, get all users with matching names
                if(Request.Form["txtFirstName"] != null && Request.Form["txtLastName"] != null)
                {
                    users = new clsUser(Request.Form["txtFirstName"], Request.Form["txtLastName"]);
                    usersLoaded = true;
                }

                //Once the user was selected, get all their personal details
                if(Request.Form["ddlMatchingUser"] != null)
                {
                    foreach(clsUser singleUser in users.users)
                    {
                        if(singleUser.userId == Request.Form["ddlMatchingUser"])
                        {
                            user = singleUser;
                        }
                    }
                    userSelected = true;
                }

                //Once the form was submitted, get all the newly entered details and replaced the old ones wit
                //the new ones
                if(Request.Form["ddlLoansOnRecord"] != null)
                {
                    clsUser userToUpdate = new clsUser();

                    userToUpdate.userId = user.userId;
                    userToUpdate.firstName = Request.Form["txtNewFirstName"];
                    userToUpdate.lastName = Request.Form["txtNewLastName"];
                    userToUpdate.address1 = Request.Form["txtAddressLine1"];
                    userToUpdate.address2 = Request.Form["txtAddressLine2"];
                    userToUpdate.address3 = Request.Form["txtAddressLine3"];
                    userToUpdate.EMail = Request.Form["txtEmail"];
                    userToUpdate.phoneNo = Request.Form["txtPhone"];
                    userToUpdate.fk1_bor_type_id = Request.Form["ddlUserType"];

                    userToUpdate.UpdateUser(userToUpdate);
                    Response.Redirect("Success.html");
                }
            }

        </script>
    </head>
    <body>
        <main class="updatePersonalDetails">

            <article class="leftBar">
                <h1>Update<br />Personal Details</h1>
                <p>First Name:</p>
                <p>Last Name:</p>
                <% if (usersLoaded){ 
                        //Show the label only when the search for users was finished %>
                        <p>Matching Users:</p>
                <% } %>
                <% if (userSelected){ 
                        //Show all the detail labels only once a user was selected %>
                        <p>First Name:</p>
                        <p>Last Name:</p>
                        <p>Address Line 1:</p>
                        <p>Address Line 2:</p>
                        <p>Address Line 3:</p>
                        <p>Email:</p>
                        <p>Phone Number:</p>
                        <p>Access Level:</p>
                <% } %>
            </article>

            <article class="rightBar">
                <h2>Use the form located below to update one or all selected details of a library user.</h2>
                <form id="updateDetailsForm" method="post" action="UpdatePersonalDetails.aspx">
                    <input type="text" name="txtFirstName" value="<% Response.Write(Request.Form["txtFirstName"]); %>" required /><br />
                    <input type="text" name="txtLastName" value="<% Response.Write(Request.Form["txtLastName"]); %>" required /><br />
                    <input type="submit" class="inBetweenButton" value="Search Users" /><br />                  
                    <% 
                        //Show the select box only when the operator started searching for the users
                        if(usersLoaded)
                        {
                            %> <select name="ddlMatchingUser" size="4"> <%
                                    foreach (clsUser user in users.users)
                                    {
                            %>         
                                       <option value="<% Response.Write(user.userId); %>">
                                            <% Response.Write(user.userId + " - " + user.firstName + ' ' + user.lastName + " - " + user.EMail); %>
                                       </option> 
                            <%
                                    }
                            %> 
                               </select><br />
                               <input type="submit" class="inBetweenButton" value="Select User" /><br />
                    <%
                        }
                    %>
                    
                    
                    <% 
                        //Show the select box with user's loans only after the user was selected
                        if(userSelected)
                        {
                            //Fill all the input fields with already existing details to prevent unwanted changes
                           %>
                                <input type="text" name="txtNewFirstName" value="<% Response.Write(user.firstName); %>" required /><br />
                                <input type="text" name="txtNewLastName" value="<% Response.Write(user.lastName); %>" required /><br />
                                <input type="text" name="txtStreet" value="<% Response.Write(user.address1); %>" /><br />
                                <input type="text" name="txtCity" value="<% Response.Write(user.address2); %>" /><br />
                                <input type="text" name="txtPostcode" value="<% Response.Write(user.address3); %>" /><br />
                                <input type="email" name="txtEmail" value="<% Response.Write(user.EMail); %>" /><br />
                                <input type="tel" name="txtPhoneNo" value="<% Response.Write(user.phoneNo); %>" /><br />
                                <select name="ddlUserType">
                                    <option value="BT01" <% Boolean selected = (user.fk1_bor_type_id == "BT01" ? true : false); if(selected) Response.Write("selected"); %> >Undergraduate Student</option>
                                    <option value="BT02" <% selected = (user.fk1_bor_type_id == "BT02" ? true : false); if(selected) Response.Write("selected"); %>>Postgraduate Student</option>
                                    <option value="BT03" <% selected = (user.fk1_bor_type_id == "BT03" ? true : false); if(selected) Response.Write("selected"); %>>Academic Staff</option>
                                    <option value="BT03" <% selected = (user.fk1_bor_type_id == "BT04" ? true : false); if(selected) Response.Write("selected"); %>>Non-Academic Staff</option>
                                </select>
                           <%
                        }
                    %>
                </form>
            </article>

            <footer class="footer">
                <a class="buttonLeft" href="Default.html">Main Menu</a>
                <div class="buttonsRight">
                     <% if (userSelected)
                        {
                            //Show the button to update personal details only once a user was selected
                            %>
                                <button class="submitButton" type="submit" form="updateDetailsForm" value="Submit">Update Details</button>
                            <%
                        }
                     %>
                </div>
            </footer>

        </main>
    </body>
</html>