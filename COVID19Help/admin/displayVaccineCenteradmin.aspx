<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayVaccineCenteradmin.aspx.cs" Inherits="COVID19Help.displayVaccineCenteradmin" %>

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
            <h1 class="display-4 text-center mt-3" style="font-weight:400;">Vaccine Centers</h1>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        
                        <asp:GridView ID="GridViewVaccine" runat="server" AutoGenerateColumns="False" Width="100%" 
                            CssClass="table table-striped table-bordered table-hover" ShowFooter="True" DataKeyNames="Id" 
                            ShowHeaderWhenEmpty="True" OnRowCommand="GridViewVaccine_RowCommand" OnRowEditing="GridViewVaccine_RowEditing"
                            OnRowCancelingEdit="GridViewVaccine_RowCancelingEdit" OnRowUpdating="GridViewVaccine_RowUpdating"
                            OnRowDeleting="GridViewVaccine_RowDeleting"
                            >
                            <Columns>             
                                 <asp:TemplateField HeaderText="Facility Category">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("facilityCategory") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFacilityCategory" Text='<%# Eval("facilityCategory") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtFacilityCategoryFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Block">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("block") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtBlock" Text='<%# Eval("block") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtBlockFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Facility Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("facilityName") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtFacilityName" Text='<%# Eval("facilityName") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtFacilityNameFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("address") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtAddress" Text='<%# Eval("address") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtAddressFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Pincode">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("pincode") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPincode" Text='<%# Eval("pincode") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPincodeFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                                        <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                                        <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:ImageButton ImageUrl="~/images/addnew.png" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                                    </FooterTemplate>
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
