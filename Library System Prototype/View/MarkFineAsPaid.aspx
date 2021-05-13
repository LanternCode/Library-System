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

        //Global Variables
        clsFine singleFine;
        String fineId;
        String finedPerson;
        Int32 fineTotal;
        DateTime finedOn;
        String finedFor;

        protected void Page_Load(Object sender, EventArgs e)
        {
            //get fineId from a previously submitted "Check Fines" form
            fineId = Convert.ToString(Request.Form["ddlFineId"]);

            //Create an instance of clsFine and get all the details to be shown on this pag
            singleFine = new clsFine(fineId);

            //Assign the retrieved data to the global variables to be displayed later
            finedPerson = singleFine.finedPersonName;
            fineTotal = singleFine.fineTotal;
            finedOn = singleFine.fineDate;
            finedFor = singleFine.resultingLoanName;
        }

    </script>
</head>
<body>
    <main class="registerFinePayment">

        <article class="leftBar">
            <h1>Mark<br />Fine As Paid</h1>
            <p>Fined Person:</p>
            <p>Fine For:</p>
            <p>Fined On:</p>
            <p>Fine Total:</p>
        </article>

        <article class="rightBar">
            <h2>Below you see all the details of a single fine. Once the fine was repaid, press the button on the bottom to register the payment.</h2>
            <form id="registerFinePaymentForm" method="post" action="RegisterFinePaymentProcessor.aspx">
                <input type="text" value="<% Response.Write(finedPerson); %>" readonly /><br />
                <input type="text" value="<% Response.Write(finedFor); %>" readonly /><br />
                <input type="text" value="<% Response.Write(finedOn); %>" readonly /><br />
                <input type="text" value="<% Response.Write(fineTotal + " $"); %>" readonly /><br />
                <input type="hidden" name="txtFineId" value="<% Response.Write(fineId); %>" />
            </form>
        </article>

        <footer class="registerFinePaymentFooter">
            <a class="buttonLeft" href="Default.html">Main Menu</a>
            <div class="buttonsRight">
                <a class="backButton" href="#">Back</a>
                <button class="submitButton" type="submit" form="registerFinePaymentForm" value="Submit">Mark Fine As Paid</button>
            </div>
        </footer>

    </main>
</body>
</html>
