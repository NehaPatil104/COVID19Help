<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="COVID19Help.admin.dashboard" %>

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
     
    <form id="form1" runat="server">
        <section>
            <div class="container-fluid bed-design d-flex justify-content-around align-items-center">
                <span class="brand-text">COVID19 HELP</span>            
                <asp:Button ID="Button1" runat="server" Text="LOGOUT" class="button" OnClick="Button1_Click"/>
            </div>
    </section>
    </form>
        
        <section id="service">
        <div class="container">
            <h1 class="text-center mt-5">DASHBOARD</h1>
            <hr style="width: 200px; margin: auto; border: 1px solid #547eb6;"/>
            <div class="services">
                <div class="shape rounded-pill">
                    <a href="displayBedAvailadmin.aspx">Bed Availability</a>
                </div>
                <div class="shape rounded-pill">
                    <a href="displayVaccineCenteradmin.aspx">Vaccination Centers</a>
                </div>
                <div class="shape rounded-pill">
                    <a href="https://localhost:44329/displayEmergencyPhone.html">Emergency Numbers</a>
                </div>
                <div class="shape rounded-pill">
                    <a href="displayTestCenteradmin.aspx">Test Centers</a>
                </div>
                <div class="shape rounded-pill  ">
                    <a href="displayCovidInfoadmin.aspx">COVID Dashboard</a>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
