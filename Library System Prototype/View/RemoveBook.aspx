<%@ Page Language = "C#" %>
<!DOCTYPE html>

<script runat="server">
</script>

<html>
<head>
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/RemoveBookSS.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>

<body>

<sidebar>
    
    <div>Remove Book</div>
    <br />
    <br />
    <span class="FirstTextBox">ISBN:</span>
    <br />
    <br />
    <span class="SecondTexBox">Book Title:</span>
    <br />
    <br />
    <span class="ThirdTextBox">Book Author:</span>
    <br />
    <br />
    <span class="FourthTextBox">Location:</span>   
    <br />
    <br />
    <span class="FifthTextBox">Strapline:</span>
    <br />
    <br />
    <span class="SixthTextBox">Removed?:</span>
</sidebar>
  
<article>
    <br />
    <div>Please enter the following Book details below:</div>
    <br />
    <form action="" method="get" id="form">
            <input type="number" name="txtISBN" required>
            <br>
            <input type="text" name="txtTitle" required>
            <br>
            <input type="text" name="txtAuthor" required>
            <br>
            <input type="text" name="txtLocation" required>
            <br>
            <input type="text" name="txtStrapline" required>
            <br>
            <input type="" name="txtRemoved" required>
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
        <input type="submit" value="Remove" form="form" /></footer>
</body>
</html>
