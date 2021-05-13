<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8" />
        <title>Library System</title>
        <link rel="stylesheet" href="../styles/main.css" />
        <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
        <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
        <script runat="server">

            //Global Variables
            clsFine singleFine;
            String fineId;

            protected void Page_Load(Object sender, EventArgs e)
            {
                fineId = Convert.ToString(Request.Form["txtFineId"]);

                singleFine = new clsFine();
                singleFine.markFineAsPaid(fineId);

                Response.Redirect("Success.html");
            }

        </script>
    </head>
    <body>
    </body>
</html>
