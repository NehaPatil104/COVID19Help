<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="displayBedAvail.aspx.cs" Inherits="COVID19Help.displayBedAvail" %>

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

       <form id="form1" runat="server">  
        <div class="container">
            <h1 class="display-4 text-center mt-3" style="font-weight:400;">Bed Availability</h1>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CovidHelp %>" SelectCommand="SELECT * FROM [bedAvailability]"></asp:SqlDataSource>
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" CssClass="table table-striped table-bordered table-hover">
                            <Columns>                
                                 <asp:TemplateField headertext="Hospital">
                                    <ItemTemplate>
                                        <br />          
                                        
                                        <p>
                                          <a data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                            <%# Eval ("hospital_name") %>
                                          </a>                   
                                        </p>
                                        <div class="collapse" id="collapseExample">
                                          <div class="card card-body">
                                            <p>Address: <%# Eval ("address") %></p>
                                            <p>Contact Person: <%# Eval ("contact_person") %></p>
                                            <p>Phone: <%# Eval ("phone") %></p>
                                          </div>
                                        </div>

                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                                                                
                                <asp:BoundField DataField="tehsil" HeaderText="Tehsil" SortExpression="tehsil" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="ICU_bed_total" HeaderText="ICU Bed Total" SortExpression="ICU_bed_total" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="ICU_bed_occupied" HeaderText="ICU Bed Occupied" SortExpression="ICU_bed_occupied" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="ICU_bed_avail" HeaderText="ICU Bed Avail" SortExpression="ICU_bed_avail" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="oxygen_bed_total" HeaderText="Oxygen Bed Total" SortExpression="oxygen_bed_total" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="oxygen_bed_occupied" HeaderText="Oxygen Bed Occupied" SortExpression="oxygen_bed_occupied" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="oxygen_bed_avail" HeaderText="Oxygen Bed Avail" SortExpression="oxygen_bed_avail" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="isolation_bed_total" HeaderText="Isolation Bed Total" SortExpression="isolation_bed_total" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="isolation_bed_occupied" HeaderText="Isolation Bed Occupied" SortExpression="isolation_bed_occupied" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                                <asp:BoundField DataField="isolation_bed_avail" HeaderText="Isolation Bed Avail" SortExpression="isolation_bed_avail" HeaderStyle-CssClass="visible-lg" ItemStyle-CssClass="visible-lg"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
     </form>
</body>
</html>
