<%@ Page Language="C#" %>
<%@ Import Namespace="Library_System_Prototype.App_Code"%>
<!DOCTYPE html>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        //var to store the username
        string UserName = Request.Form["txtUserName"];
        //var to store the book name
        string BookName = Request.Form["txtBokName"];
        //var to store the reservation date
        string ReservationDate = Request.Form["txtReservationDate"];
        //connect to databse
        clsDataConnection DB = new clsDataConnection();
        DB.AddParameter("@res_id", UserName);
        DB.AddParameter("@BookName", BookName);
        DB.AddParameter("@res_date", ReservationDate);
        //execute the stored procedure
       DB.Execute("sproc_tblReservation_Add");





    }

</script>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>

</body>
</html>