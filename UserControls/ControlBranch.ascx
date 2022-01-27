<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ControlBranch.ascx.cs" Inherits="EvidenceExam.UserControls.ControlBranch" %>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<%-- DataKeyNames is mandatory --%>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BranchID" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="ObjectDataSource1" ForeColor="Black" GridLines="None" ShowFooter="True">
    <AlternatingRowStyle BackColor="PaleGoldenrod" />
    <Columns>
        <asp:TemplateField HeaderText="BranchID" SortExpression="BranchID">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BranchID") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("BranchID") %>'></asp:Label>
            </ItemTemplate>
            <%-- Add Footer to insert a button --%>
            <FooterTemplate>
                <asp:Button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click"/>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="BranchName" SortExpression="BranchName">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BranchName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("BranchName") %>'></asp:Label>
            </ItemTemplate>
            <FooterTemplate>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </FooterTemplate>
        </asp:TemplateField>
        <asp:CommandField HeaderText="Actions" ShowDeleteButton="True" ShowEditButton="True" ShowHeader="True" />
    </Columns>
    <FooterStyle BackColor="Tan" />
    <HeaderStyle BackColor="Tan" Font-Bold="True" />
    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
    <SortedAscendingCellStyle BackColor="#FAFAE7" />
    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
    <SortedDescendingCellStyle BackColor="#E1DB9C" />
    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
</asp:GridView>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBranches" TypeName="EvidenceExam.Models.Branch_DAL" InsertMethod="InsertMethod" DeleteMethod="DeleteMethod" UpdateMethod="UpdateMethod">
    <DeleteParameters>
        <asp:Parameter Name="branchID" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="branchName" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="branchID" Type="Int32" />
        <asp:Parameter Name="branchName" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>

