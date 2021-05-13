<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <form id="form" runat="server">
       <%
           string ISBN = Request["txtISBN"];
           string Author = Request["txtAuthor"];
           string Title = Request["txtTitle"];
           string Publisher = Request["txtPublisher"];
           Int32 PublishYear = Convert.ToInt32(Request["txtPubYear"]);
           string ShelfNo = Request["txtShelfNo"];
           Int32 Edition = Convert.ToInt32(Request["txtEdition"]);
           string Genre = Request["ddlGenre"];
           clsDataConnection db = new clsDataConnection();
           db.AddParameter("@ISBN", ISBN);
           db.AddParameter("@Author", Author);
           db.AddParameter("@Title", Title);
           db.AddParameter("@Publisher", Publisher);
           db.AddParameter("@PubYear", PublishYear);
           db.AddParameter("@ShelfNo", ShelfNo);
           db.AddParameter("@Edition", Edition);
           db.AddParameter("@Genre", Genre);
           db.Execute("sproc_AddBook");
           Response.Redirect("Default.html");
        %>
    </form>
</body>
</html>
