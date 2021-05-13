<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>

<script runat="server">

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
    <form id="form" runat="server">
       <%
           //Takes values passed to it from EditBook.aspx and then runs it through clsBook.EditBook which runs the stored procedure to edit the book based on supplied ISBN
           string ISBN = Request["txtISBN"];
           string Author = Request["txtAuthor"];
           string Title = Request["txtTitle"];
           string Publisher = Request["txtPublisher"];
           Int32 PublishYear = Convert.ToInt32(Request["txtPubYear"]);
           string ShelfNo = Request["txtShelfNo"];
           Int32 Edition = Convert.ToInt32(Request["txtEdition"]);
           string Genre = Request["ddlGenre"];

           clsBook Book = new clsBook();
           Book.EditBook(ISBN, Author, Title, Publisher, PublishYear, ShelfNo, Edition, Genre);
           Response.Redirect("Default.html");
        %>
    </form>
</body>
</html>
