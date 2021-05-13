<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        Int32 fineId = Convert.ToInt32(Request.Form["txtFineId"]);
        clsFine singleFine = new clsFine();
        singleFine.deleteFine(fineId);
        Response.Redirect("Success.html");
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/main.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>
<body>
</body>
</html>
