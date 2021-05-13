<%@ Page Language = "C#" %>
<!DOCTYPE html>

<script runat="server">
</script>

<html>
<head>
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/AddEditCopySS.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>

<body>

<sidebar>
    
    <div>Add/Edit Copy</div>
    <br />
    <br />
    <span class="FirstTextBox">Copy Barcode:</span>
    <br />
    <br />
    <span class="SecondTexBox">ISBN:</span>
    <br />
    <br />
    <span class="ThirdTextBox">Status:</span>
    <br />
    <br />
    <span class="FourthTextBox">Condition:</span>    
</sidebar>
  
<article>
    <br />
    <div>Please enter details of the Book Copy below:</div>
    <br />
    <form action="" method="get" id="form">
            <input type="number" name="txtCopyBarcode" required>
            <br>
            <input type="number" name="txtISBN" required>
            <br>
            <input type="text" name="txtStatus" required>
            <br>
            <input type="text" name="txtCondition" required>
            <br>
        </form>
       
</article>
<footer>
    <a href="Default.html">
        <button>
            Main Menu
        </button>
    </a>
        <button onclick="">
            Back
        </button>
        <input type="submit" value="Add" form="form" />
        <input type="submit" value="Edit" form="form" />

    </footer>
</body>
</html>
