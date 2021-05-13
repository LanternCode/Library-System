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

        String fineId;
        String finedPerson;
        Int32 fineTotal;
        DateTime finedOn;
        String finedFor;

        protected void Page_Load(object sender, EventArgs e)
        {
            fineId = Convert.ToString(Request.Form["txtFineId"]);
            clsFine singleFine = new clsFine(fineId);

            finedPerson = singleFine.finedPersonName;
            fineTotal = singleFine.fineTotal;
            finedOn = singleFine.fineDate;
            finedFor = singleFine.resultingLoanName;
        }

    </script>
</head>
<body>
    <main class="cancelFine">

        <article class="leftBar">
            <h1>Cancel<br />Fine</h1>
            <p>Fined Person:</p>
            <p>Fine Total:</p>
            <p>Fined On:</p>
            <p>Borrowed Book:</p>
        </article>

        <article class="rightBar">
            <h2>Below you see all the details of a single fine. Use the button below if you wish to remove the fine.</h2>
            <form id="cancelFineForm" method="post" action="CancelFineProcessor.aspx">
                <input type="hidden" name="txtFineId" value="<% Response.Write(fineId); %>" />
                <input type="text" name="txtFinedPerson" value="<% Response.Write(finedPerson); %>" readonly /><br />
                <input type="text" name="txtFineTotal" value="<% Response.Write(fineTotal); %>" readonly /><br />
                <input type="text" name="txtFinedOn" value="<% Response.Write(finedOn); %>" readonly /><br />
                <input type="text" name="txtFinedFor" value="<% Response.Write(finedFor); %>" readonly />
            </form>
        </article>

        <footer>
            <a class="buttonLeft" href="Default.html">Main Menu</a>
            <button type="submit" form="cancelFineForm" value="Submit">Confirm Cancellation</button>
        </footer>

    </main>
</body>
</html>