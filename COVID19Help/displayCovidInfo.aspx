<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayCovidInfo.aspx.cs" Inherits="COVID19Help.displayCovidInfo" %>

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
    <div class="container-fluid">
        <section>
            <div class="container-fluid bed-design d-flex justify-content-around align-items-center">
                <h1>COVID19 HELP</h1>
                <a href="index.html">HOME</a>
            </div>
        </section>
        <div class="container">
            <h1 class="text-center mt-5">COVID19 DASHBOARD</h1>
            <div class="services">                
                <form id="form2" runat="server">  
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:covidData %>" SelectCommand="SELECT * FROM [covidinfo]"></asp:SqlDataSource>
                        <br />
                <asp:GridView ID="GridViewCovid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="50%"
                             ShowFooter="True" DataKeyNames="Id" OnSelectedIndexChanged="GridViewCovid_SelectedIndexChanged">
                            <Columns>             
                                 <asp:TemplateField HeaderText="" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                                    <ItemTemplate >
                                        <div class="shape-two rounded-pill">
                                            <p class="mt-5">Total Swab</p>                                        
                                            <b class="text-primary"><asp:Label Text='<%# Eval("totalSwab") %>' runat="server" /></b>
                                        </div>
                                    </ItemTemplate>
                                 
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                                    <ItemTemplate>
                                        <div class="shape-two rounded-pill">
                                            <p class="mt-5">Total Positive</p>
                                            <b class="text-danger"><asp:Label Text='<%# Eval("totalPositive") %>' runat="server" /></b>
                                        </div>
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                                    <ItemTemplate>
                                        <div class="shape-two rounded-pill">
                                            <p class="mt-5">Total Active</p>
                                            <b class="text-danger"><asp:Label Text='<%# Eval("totalActive") %>' runat="server" /></b>
                                        </div>
                                       
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                                    <ItemTemplate>
                                        <div class="shape-two rounded-pill">
                                            <p class="mt-5">Total Death</p>
                                            <b class="text-danger"><asp:Label Text='<%# Eval("totalDeath") %>' runat="server" /></b>
                                        </div>
                                    </ItemTemplate>
                                    
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                                    <ItemTemplate>
                                        <div class="shape-two rounded-pill">
                                            <p class="mt-5">Total Discharge</p>
                                            <b class="text-success"><asp:Label Text='<%# Eval("totalDischarge") %>' runat="server" /></b>
                                        </div>
                                    </ItemTemplate>
                                   
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg">
                                    <ItemTemplate>
                                        <div class="shape-two rounded-pill">
                                            <p class="mt-5">Report Awaited</p>
                                            <b class="text-info"><asp:Label Text='<%# Eval("reportAwaited") %>' runat="server" /></b>
                                        </div>
                                    </ItemTemplate>                                
                                </asp:TemplateField>                             
                                
                            </Columns>
                        </asp:GridView>
                    </form>
            </div>
        </div>
        </div>
</body>
</html>
