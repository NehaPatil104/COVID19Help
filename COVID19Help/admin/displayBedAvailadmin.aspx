<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayBedAvailadmin.aspx.cs" Inherits="COVID19Help.displayBedAvailadmin" %>

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
            <h1 class="display-4 text-center mt-3" style="font-weight:400;">Bed Availability</h1>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        
                        <asp:GridView ID="GridViewadmin" runat="server" AutoGenerateColumns="False" Width="100%" 
                            CssClass="table table-striped table-bordered table-hover" ShowFooter="true" DataKeyNames="Id" 
                            ShowHeaderWhenEmpty="true" OnRowCommand="GridViewadmin_RowCommand" OnRowEditing="GridViewadmin_RowEditing"
                            OnRowCancelingEdit="GridViewadmin_RowCancelingEdit" OnRowUpdating="GridViewadmin_RowUpdating"
                            OnRowDeleting="GridViewadmin_RowDeleting"
                            >
                            <Columns>             
                                 <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("hospital_name") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtHospital" Text='<%# Eval("hospital_name") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtHospitalFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tehsil">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("tehsil") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtTehsil" Text='<%# Eval("tehsil") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtTehsilFooter" runat="server" />
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
                                <asp:TemplateField HeaderText="Contact Person">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("contact_person") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtContactPerson" Text='<%# Eval("contact_person") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtContactPersonFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Phone">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("phone") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtPhone" Text='<%# Eval("phone") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtPhoneFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total ICU Bed">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ICU_bed_total") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtICUBedTotal" Text='<%# Eval("ICU_bed_total") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtICUBedTotalFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ICU Bed Occupied">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ICU_bed_occupied") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtICUBedOccupied" Text='<%# Eval("ICU_bed_occupied") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtICUBedOccupiedFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ICU Bed Available">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("ICU_bed_avail") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtICUBedAvail" Text='<%# Eval("ICU_bed_avail") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtICUBedAvailFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Oxygen Bed">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("oxygen_bed_total") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOxygenBedTotal" Text='<%# Eval("oxygen_bed_total") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtOxygenBedTotalFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Oxygen Bed Occupied">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("oxygen_bed_occupied") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOxygenBedOccupied" Text='<%# Eval("oxygen_bed_occupied") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtOxygenBedOccupiedFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Oxygen Bed Available">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("oxygen_bed_avail") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtOxygenBedAvail" Text='<%# Eval("oxygen_bed_avail") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtOxygenBedAvailFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total Isolation Bed">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("isolation_bed_total") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtIsolationBedTotal" Text='<%# Eval("isolation_bed_total") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtIsolationBedTotalFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Isolation Bed Occupied">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("isolation_bed_occupied") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtIsolationBedOccupied" Text='<%# Eval("isolation_bed_occupied") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtIsolattionBedOccupiedFooter" runat="server" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Isolation Bed Available">
                                    <ItemTemplate>
                                        <asp:Label Text='<%# Eval("isolation_bed_avail") %>' runat="server" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtIsolationBedAvail" Text='<%# Eval("isolation_bed_avail") %>' runat="server" />
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:TextBox ID="txtIsolationBedAvailFooter" runat="server" />
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
