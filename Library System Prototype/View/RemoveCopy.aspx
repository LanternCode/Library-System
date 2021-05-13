<%@ Page Language = "C#" %>
<!DOCTYPE html>

<script runat="server">
</script>

<html>
<head>
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/RemoveCopySS.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>

<body>

<sidebar>
    
    <div>Remove Copy</div>
    <br />
    <br />
    <span class="FirstTextBox">Copy Barcode:</span>
    <br />
    <br />
    <span class="SecondTexBox">Book Title:</span>
    <br />
    <br />
    <span class="ThirdTextBox">Book Author:</span>
    <br />
    <br />   
</sidebar>
  
<article>
    <br />
    <div>Pleas enter details of the Book Copy below:</div>
    <br />
    <form action="" method="get" id="form">
            <input type="number" name="txtCopyBarcode" required>
            <br>
            <input type="text" name="txtTitle" required>
            <br>
            <input type="text" name="txtAuthor" required>
            <br>
        </form>
       
</article>
<footer>
    <a href="Default.html">
        <button onclick="">
            Main Menu</button>
    </a>
    <button onclick="">
            Back
        </button>
        <input type="submit" value="Remove" form="form" />

    </footer>
</body>
</html>
