<%@ Page Language = "C#" %>
<!DOCTYPE html>

<script runat="server">
</script>

<html>
<head>
    <meta charset="utf-8" />
    <title>Library System</title>
    <link rel="stylesheet" href="../styles/CheckFinesSS.css" />
    <link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="../images/favicon.ico" type="image/x-icon" />
</head>
<body>
    <sidebar>
    
        <div>Check Fines</div>
        <br />
        <br />
        <span class="FirstTextBox">Fine ID:</span>
        <br />
        <br />
        <span class="SecondTexBox">Fine Date:</span>
        <br />
        <br />
    </sidebar>
    <article>
        <br />
        <div>Please enter the Fine-Holder&#39;s details below:</div>
        <br />
        <form action="" method="get" id="form">
                <input type="number" name="txtFineID" required>
                <br>
                <input type="date" name="txtFineDate" required>
                <br>
            
            </form>
       
    </article>
    <footer>
        <a href="Default.html">
            <button>
                Main Menu
            </button>
        </a>
            <input type="submit" value="Mark as Paid" form="form" />
            <input type="submit" value="Cancel Fine" form="form" />

    </footer>
</body>
</html>