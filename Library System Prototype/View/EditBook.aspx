<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/styles.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
    <script runat="server">
        clsBook Book = new clsBook();
        protected void Page_Load(object sender, EventArgs e)
        {
            Book.GetBook("58601713");
            if(Request.Form["txtISBN"] != null)
            {
                //Book.FindBook(Convert.ToString(Request.Form["txtISBN"]));
                Book.GetBook("58601713");
            }
        }
    </script>
</head>
<body>
    <sidebar>
        <div>
            Edit book from collection
        </div>
        <hr />
        <p>
            Title:
        </p>
        <p>
            Author:
        </p>
        <p>
            ISBN:
        </p>
        <p>
            Publisher:
        </p>
        <p>
            Published Year:
        </p>
        <p>
            Shelf Number:
        </p>
        <p>
            Edition:
        </p>
        <p>
            Genre:
        </p>
    </sidebar>

    <article>
        <br />
        <div>
            Edit a book's details from the library's collection
        </div>
        <br />
        <form action="EditBookProcessor.aspx" method="post" id="form">
            <input type="text" name="txtTitle" required value="<%Response.Write(Book.Title); %>"/>
            <br/>
            <input type="text" name="txtAuthor" required value="<%Response.Write(Book.Author); %>"/>
            <br/>
            <input type="text" name="txtISBN" required value="<%Response.Write(Book.ISBN); %>"/>
            <br/>
            <input type="text" name="txtPublisher" required value="<%Response.Write(Book.Publisher); %>"/>
            <br/>
            <input type="number" name="txtPubYear" required value="<%Response.Write(Book.PubYear); %>"/>
            <br/>
            <input type="text" name="txtShelfNo" required value="<%Response.Write(Book.ShelfNo); %>"/>
            <br/>
            <input type="number" name="txtEdition" required value="<%Response.Write(Book.Edition); %>"/>
            <br/>
            <select name="ddlGenre" size="4">
                <option value="G001" selected>SciFi</option>
                <option value="G002">Manga</option>
                <option value="G003">Humour</option>
                <option value="G004">Cyberpunk</option>
                <option value="G005">Thriller</option>
            </select>
            <br>
        </form>
    </article>
    <footer>
        <a href="Default.html">
            <button>
                Main Menu
            </button>
        </a>
        <input type="submit" value="Edit" form="form" />

    </footer>
</body>
</html>
