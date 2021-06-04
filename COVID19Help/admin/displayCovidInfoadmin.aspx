<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayCovidInfoadmin.aspx.cs" Inherits="COVID19Help.displayCovidInfoadmin" %>

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


       <form id="formadmin" runat="server">
            <section>
                <div class="container-fluid bed-design d-flex justify-content-around align-items-center">
                    <span class="brand-text">COVID19 HELP</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Text="DASHBOARD" OnClick="Button2_Click" CssClass="button" />
                </div>
            </section>
        <div class="container">
            <h1 class="display-4 text-center mt-3" style="font-weight:400;">COVID19 DASHBOARD</h1>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        
                        <asp:GridView ID="GridViewCovid" runat="server" AutoGenerateColumns="False" Width="100%" 
                            CssClass="table table-striped table-bordered table-hover" ShowFooter="True" DataKeyNames="Id" 
                            ShowHeaderWhenEmpty="True"  OnRowEditing="GridViewCovid_RowEditing"
                            OnRowCancelingEdit="GridViewCovid_RowCancelingEdit" OnRowUpdating="GridViewCovid_RowUpdating"
                          
                            >
                            <Columns>             
                                 <asp:TemplateField HeaderText="Total Swab">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("totalSwab") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txttotalSwab" Text='<%# Eval("totalSwab") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Positive">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("totalPositive") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txttotalPositive" Text='<%# Eval("totalPositive") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Active">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("totalActive") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txttotalActive" Text='<%# Eval("totalActive") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Death">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("totalDeath") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txttotalDeath" Text='<%# Eval("totalDeath") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Discharge">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("totalDischarge") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txttotalDischarge" Text='<%# Eval("totalDischarge") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Report Awaited">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("reportAwaited") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtreportAwaited" Text='<%# Eval("reportAwaited") %>' runat="server" />
                                    </EditItemTemplate>                                  
                                </asp:TemplateField>
                                

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                                        <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                                    </EditItemTemplate>               
                                </asp:TemplateField>
                                
                            </Columns>
                        </asp:GridView>
                        <br />
                        <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
                        <br />
                        <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
                    </div>
                </div>
            </div>
        </div>
     </form>
</body>
</html>
