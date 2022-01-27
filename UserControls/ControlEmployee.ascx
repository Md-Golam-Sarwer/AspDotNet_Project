<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlEmployee.ascx.cs" Inherits="EvidenceExam.UserControls.ControlEmployee" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        text-align: center;
        font-size: large;
    }
    .auto-style3 {
        width: 131px;
    }
    .auto-style4 {
        width: 261px;
    }
    .auto-style5 {
        width: 139px;
    }
</style>
<div>

    <table class="auto-style1">
        <tr>
            <td class="auto-style2" colspan="2"><strong>Employee Information</strong></td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Employee Name</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmployeeName" runat="server" Width="185px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmployeeName" ErrorMessage="Input Employee Name">* Must input Employee Name</asp:RequiredFieldValidator>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Gender</td>
            <td class="auto-style4">
                <asp:RadioButtonList ID="rblGender" runat="server" Width="215px" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Email </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmail" runat="server" Width="204px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Insert Valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*Insert Valid Email Address</asp:RegularExpressionValidator>
            </td>
            <td rowspan="8">
                <asp:GridView ID="GridViewEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" GridLines="Vertical" Height="241px" OnSelectedIndexChanged="GridViewEmployee_SelectedIndexChanged" Width="418px">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                        <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                        <asp:BoundField DataField="CellPhoneNo" HeaderText="CellPhoneNo" SortExpression="CellPhoneNo" />
                        <asp:ImageField DataImageUrlField="EmployeeImage" HeaderText="EmployeeImage" ControlStyle-Width="120" ControlStyle-Height="80" >
<ControlStyle Height="80px" Width="120px"></ControlStyle>
                        </asp:ImageField>
                        <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" />
                        <asp:BoundField DataField="BranchID" HeaderText="BranchID" SortExpression="BranchID" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Confirm Email</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtConfirmEmail" runat="server" Width="201px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" ErrorMessage="Email doesn't machted!!">*Email doesn&#39;t machted!!</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Cellphone No.</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtCellphone" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCellphone" ErrorMessage="Must input 11 digit" ValidationExpression="\d{11}">*Must input 11 digit</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Date of Birth (DOB)</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" Width="194px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDOB" ErrorMessage="Input Year Between 2010 to 2022" MaximumValue="12/01/2022" MinimumValue="01/01/2010" Type="Date">*Input Year Between 2010 to 2022</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Branch</td>
            <td class="auto-style4">
                <asp:DropDownList ID="ddlBranch" runat="server" Height="16px" Width="204px" DataSourceID="SqlDataSource2" DataTextField="BranchName" DataValueField="BranchID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [BranchName], [BranchID] FROM [Branch]"></asp:SqlDataSource>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Last Update</td>
            <td class="auto-style4">
                <asp:Calendar ID="CalendarLastUpdate" runat="server"></asp:Calendar>
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">Employee Image</td>
            <td class="auto-style4">
                <asp:FileUpload ID="fuEmployeeImage" runat="server" />
            </td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="lblEmployeeId" runat="server"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:CheckBox ID="CheckBoxAgree" runat="server" Text="Yes,Employee Information is Correct!!" />
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                Employee Id For Update/Delete</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmployeeId" runat="server" Width="191px"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:Label ID="lblMessege" runat="server"></asp:Label>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style4">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>

</div>