<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/main.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
    <script runat="server">

        //global variables
        clsUser users;
        clsLoan loans;
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

            //Once the user was selected, get all their loans
            if(Request.Form["ddlMatchingUser"] != null)
            {
                loans = new clsLoan(Request.Form["ddlMatchingUser"]);
                userSelected = true;
            }

            //Once a loan was selected, the copy will be marked as returned. Loan return date will also be updated.
            if(Request.Form["ddlLoansOnRecord"] != null)
            {
                clsCopy singleCopy = new clsCopy();
                singleCopy.markCopyAsReturned(Request.Form["ddlLoansOnRecord"]);

                loans = new clsLoan();
                loans.setLoanReturnDate(Request.Form["ddlMatchingUser"], DateTime.Now.ToString("dd-MMM-yyyy"));

                Response.Redirect("Success.html");
            }
        }

    </script>
</head>
<body>
    <main class="markCopyAsReturned">

        <article class="leftBar">
            <h1>Mark Copy As<br />Returned</h1>
            <p>First Name:</p>
            <p>Last Name:</p>
            <p>Matching Users:</p>
            <p>Loans On Record:</p>
        </article>

        <article class="rightBar">
            <h2>Mark a copy of a book as returned, so that other users may take it on loan.</h2>
            <form id="markCopyAsReturnedForm" method="post" action="MarkCopyAsReturned.aspx">
                <input type="text" name="txtFirstName" value="<% Response.Write(Request.Form["txtFirstName"]); %>" required /><br />
                <input type="text" name="txtLastName" value="<% Response.Write(Request.Form["txtLastName"]); %>" required /><br />
                <input type="submit" class="inBetweenButton" value="Search Users" /><br />
                <select name="ddlMatchingUser" size="4">
                    <% 
                        //Show the select box only when the operator started searching for the users
                        if(usersLoaded)
                        {
                            foreach (clsUser user in users.users)
                            {
                    %>         
                               <option value="<% Response.Write(user.userId); %>">
                                    <% Response.Write(user.userId + " - " + user.firstName + ' ' + user.lastName + " - " + user.EMail); %>
                               </option> 
                    <%
                            }
                        }
                    %>
                </select><br />
                <input type="submit" class="inBetweenButton" value="Select User" /><br />
                <select name="ddlLoansOnRecord" size="4">
                    <% 
                        //Show the select box with user's loans only after the user was selected
                        if(userSelected)
                        {
                            foreach (clsLoan loan in loans.loans)
                            {
                    %>         
                               <option value="<% Response.Write(loan.loanId); %>">
                                    <% Response.Write(loan.loanId + " - " + loan.bookTitle + " - " + loan.loanIssueDate.ToString("dd MMM yyyy")); %>
                               </option> 
                    <%
                            }
                        }
                    %>
                </select>
            </form>
        </article>

        <footer>
            <a class="buttonLeft" href="Default.html">Main Menu</a>
            <div class="buttonsRight">
                <% if (userSelected)
                    {
                        //Show the button to mark copy as returned only once a user was selected
                        %>
                        <button class="submitButton" type="submit" form="markCopyAsReturnedForm" value="Submit">Return Copy</button>
                        <%
                    }
                %>
            </div>
        </footer>

    </main>
</body>
</html>

