<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/styles.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
    <script runat="server">
        clsDataConnection db = new clsDataConnection();
        clsUsers UserList = new clsUsers();
        clsSuspend Suspend = new clsSuspend();
        Int32 Index = 0;
        string Bor_ID;
        string Bor_FirstName;
        string Bor_Surname;

        protected void Page_Load(object sender, EventArgs e)
        {
            string test = Request.Form["txtUsername"];
            if(Request.Form["txtUsername"] != null)
            {
                Int32 Count = UserList.Count;
                UserList.Name = Request.Form["txtUsername"];
            }
            if (Request["action"] == "Suspend")
            {
                Suspend.SuspendUser(Convert.ToString(Request.Form["lstUsers"]));
            }
            if (Request["action"] == "Unsuspend")
            {
                Suspend.UnsuspendUser(Convert.ToString(Request.Form["lstUsers"]));
            }
        }

    </script>
</head>
<body>
    <sidebar>
        <div>
            Suspend Borrower
        </div>
        <hr>
        <p>
            User's Name:
        </p>
        <p>
            <br />
        </p>
        <p>
            Select User:
        </p>

    </sidebar>

    <article>
        <br />
        <div>
            Edit a book's details from the library's collection
        </div>
        <br />
        <form action="SuspendBorrower.aspx" method="post" id="form">
            <input type="text" name="txtUsername" />
            <br/>
        </form>
        <input type="submit" form="form" id="btnRefresh" style="width:100%;" value="Search Users" />
            <br/>
        <form action="SuspendBorrower.aspx" method="post" id="form2" runat="server">
            <select id="lstUsers" name="lstUsers" size="30" style="width:100%;">
                    <%
                        while(Index < UserList.UserSearch.Count)
                        {
                            Bor_ID = UserList.UserSearch[Index].Bor_ID;
                            Bor_FirstName = UserList.UserSearch[Index].Bor_FirstName;
                            Bor_Surname = UserList.UserSearch[Index].Bor_Surname;

                            Response.Write("<option value='" + Bor_ID +"'>" + Bor_FirstName + " " + Bor_Surname + "</option>");
                            Index++;
                        }
                    %>
            </select>
        </form>
    </article>
    <footer>
        <a href="Default.html">
            <button>
                Main Menu
            </button>
        </a>
        <input type="submit" form="form2" name="action" value="Suspend" />
        <input type="submit" form="form2" name="action" value="Unsuspend" />

    </footer>
</body>
</html>
