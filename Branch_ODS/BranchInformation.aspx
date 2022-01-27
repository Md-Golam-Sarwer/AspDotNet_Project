<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BranchInformation.aspx.cs" Inherits="EvidenceExam.Branch_ODS.BranchInformation" %>

<%@ Register Src="~/UserControls/ControlBranch.ascx" TagPrefix="uc1" TagName="ControlBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
    body {height:990px; margin:auto;border: 3px solid #73AD21; background-color: lightyellow; }
    </style>
    <p>This is Content Page and Branch comes from User Control</p>
    <h2  >Branch Information</h2>
    <uc1:ControlBranch runat="server" id="ControlBranch" />
</asp:Content>
