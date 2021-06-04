<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="COVID19Help.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet" />
    
    <link href="../css/style.css" rel="stylesheet" />
    <title>COVID19 HELP</title>
</head>
<body>
    <section>
        <div class="container-fluid bed-design d-flex justify-content-around align-items-center">
            <h1>COVID19 HELP</h1>
            <a href="https://localhost:44329/index.html">HOME</a>
        </div>
    </section>
    <div class="container mt-5" style="width: 500px;">
        <h1 class="display-4 text-center">&nbsp;</h1>
        <h1 class="display-4 text-center">Admin Login</h1>
        
        <form id="form1" runat="server">
            <br /><br />
            <p class="text-center">
                <asp:Label ID="Label3" runat="server" Text="Enter Valid User Credentials" CssClass="alert alert-danger"></asp:Label>
            </p>
        
        <div class="mb-3">
            <asp:Label ID="Label1" runat="server" Text="Username" class="form-label"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
        </div>
        <div class="mb-3">
            <asp:Label ID="Label2" runat="server" Text="Password" class="form-label"></asp:Label>
              &nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
        </div>
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="LOGIN" class="btn btn-primary"/>
         </form>
    </div>
    <p>
        &nbsp;</p>
   
</body>
</html>
