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

        clsBook booksFound;
        Boolean booksLoaded = false;
        Boolean zeroBooksFound = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Form["txtBookTitle"] != null && Request.Form["txtBookAuthor"] != null)
            {
                booksFound = new clsBook(Request.Form["txtBookTitle"], Request.Form["txtBookAuthor"]);
                booksLoaded = true;
                zeroBooksFound = booksFound.books.Count == 0 ? true : false;
            }
        }

    </script>
</head>
<body>
    <main class="browseCatalogue">

        <article class="headerRow">
            <h1>Browse Catalogue</h1>
            <h2>Enter the title of a book or its author's name to search our catalogue for matching books.</h2>
        </article>

        <article class="mainRow">
            <form method="post" action="BrowseCatalogue.aspx">
                <br />
                <label>Book Title:</label>
                <input type="text" name="txtBookTitle" value="<% Response.Write(Request.Form["txtBookTitle"]); %>" required /><br />
                <label>Book Author:</label>
                <input type="text" name="txtBookAuthor" value="<% Response.Write(Request.Form["txtBookAuthor"]); %>" /><br />
                <input type="submit" value="Start Search" />
            </form>
            <h3>Books found:</h3>
            <% if (booksLoaded == false){ %>
                    <h4>Search for books and results will be shown here!</h4>
            <% }else if (zeroBooksFound == true){ %>
                    <h4>Sorry, no books were found matching the entered data.</h4>
            <% }else{
                    foreach(clsBook book in booksFound.books)
                    {
                        %>
                            <div class="bookFrame">
                                <div class="bookDetails">
                                    <p><% Response.Write(book.bookTitle); %></p>
                                    <p><% Response.Write("by " + book.bookAuthor); %></p>
                                    <p><% Response.Write(book.bookPublisher + ", " + book.bookPublishYear); %></p>
                                    <p><% Response.Write("Edition: " + book.bookEditionNo); %></p>
                                    <p><% Response.Write("Location: " + book.bookLocation); %></p>
                                </div>
                                <div class="bookLoanOptions">
                                    <a target="_blank" href="TakeLoan.aspx?isbn=<% Response.Write(book.isbn); %>">Loan this book</a>
                                    <a target="_blank" href="MakeReservation.aspx?isbn=<% Response.Write(book.isbn); %>">Make Reservation</a>
                                </div>
                                <div class="bookManagementOptions">
                                    <a target="_blank" href="EditBook.aspx?isbn=<% Response.Write(book.isbn); %>">Edit book</a>
                                    <a target="_blank" href="RemoveBook.aspx?isbn=<% Response.Write(book.isbn); %>">Remove book</a>
                                    <a target="_blank" href="ManageCopies.aspx?isbn=<% Response.Write(book.isbn); %>">Manage Copies</a>
                                </div>
                            </div>
                        <%
                    }
               } 
            %>
        </article>

        <footer>
            <br />
            <a href="Default.html">Main Menu</a>
        </footer>

    </main>
</body>
</html>


