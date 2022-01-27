<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeInformation.aspx.cs" Inherits="EvidenceExam.Employee_SQL.EmployeeInformation" %>

<%@ Register Src="~/UserControls/ControlEmployee.ascx" TagPrefix="uc1" TagName="ControlEmployee" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <uc1:ControlEmployee runat="server" id="ControlEmployee" />
    </div>
    <div>
    <style>
    body {height:990px; margin:auto;border: 3px solid #73AD21; background-color: powderblue; }
    </style>
    </div>
</asp:Content>
