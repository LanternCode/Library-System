<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    clsUsers UserList = new clsUsers();
    protected void Page_Load(object sender, EventArgs e)
    {
        UserList.Suspension = Convert.ToString(Request.Form["lstUsers"]);
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
            <%
                Response.Write("<p>" + Request.Form["lstUsers"] + "</p>");
            %>
    </form>
</body>
</html>
