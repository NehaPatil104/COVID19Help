<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayTestCenter.aspx.cs" Inherits="COVID19Help.displayTestCenter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;700&display=swap" rel="stylesheet" />
    
    <link href="css/style.css" rel="stylesheet" />
    <title>COVID19 HELP</title>
</head>
<body>
    <section>
        <div class="container-fluid bed-design d-flex justify-content-around align-items-center">
            <h1>COVID19 HELP</h1>
            <a href="index.html">HOME</a>
        </div>
    </section>

        <form id="form2" runat="server">  
        <div class="container">
            <h1 class="display-4 text-center mt-3" style="font-weight:400;">Test Centers</h1>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">                     
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testCenter %>" SelectCommand="SELECT * FROM [testcenter]"></asp:SqlDataSource>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" CssClass="table table-striped table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Sr.No" InsertVisible="False" ReadOnly="True" SortExpression="Id" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="centerCategory" HeaderText="Test Center Category" SortExpression="centerCategory" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                                <asp:BoundField DataField="block" HeaderText="Block" SortExpression="block" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                                <asp:BoundField DataField="centerName" HeaderText="Test Center Name" SortExpression="centerName" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                                <asp:BoundField DataField="pincode" HeaderText="Pincode" SortExpression="pincode" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>           
     </form>
</body>
</html>
