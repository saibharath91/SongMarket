<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="AddCC.aspx.cs" Inherits="AddCC" %>

<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" runat="server">

    
  
          <center><br /><br /><br /><br /><br />

<table style="width: 100%;">
    
     <tr>
        <td>&nbsp;<asp:Label ID="Label2" runat="server" Text="FirstName"></asp:Label></td>
        <td>&nbsp;<asp:TextBox ID="txtFName" runat="server"></asp:TextBox></td>
        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="First Name is Required" ControlToValidate="txtFName"></asp:RequiredFieldValidator></td>
    </tr>
     <tr>
        <td>&nbsp;<asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
        <td>&nbsp;<asp:TextBox ID="txtLName" runat="server"></asp:TextBox></td>
        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last Name is Required" ControlToValidate="txtLName"></asp:RequiredFieldValidator></td>
    </tr>
         <tr>
        <td>&nbsp;<asp:Label ID="Label8" runat="server" Text="Middle Name"></asp:Label></td>
        <td>&nbsp;<asp:TextBox MaxLength="1" ID="txtMidInitial" runat="server"></asp:TextBox></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;<asp:Label ID="Label1" runat="server" Text="Credit Card Number"></asp:Label></td>
        <td>&nbsp;<asp:TextBox ID="txtCCNo" runat="server" TextMode="Number"></asp:TextBox></td>
        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Credit number" ControlToValidate="txtCCNo"></asp:RequiredFieldValidator></td>
    </tr>
     <tr>
        <td>&nbsp;<asp:Label ID="Label4" runat="server" Text="Expiration Date"></asp:Label></td>
        <td>&nbsp;<asp:TextBox ID="txtExpirationDate" runat="server" TextMode="Date"></asp:TextBox></td>
        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Expiration Date is Required" ControlToValidate="txtExpirationDate"></asp:RequiredFieldValidator></td>
    </tr>
       <tr>
        <td>&nbsp;<asp:Label ID="Label5" runat="server" Text="Card Type"></asp:Label></td>
        <td>&nbsp;<asp:TextBox ID="txtType" runat="server"></asp:TextBox></td>
        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Card Type is Required" ControlToValidate="txtType"></asp:RequiredFieldValidator></td>
    </tr>
       <tr>
        <td>&nbsp;<asp:Label ID="Label6" runat="server" Text="CVC number"></asp:Label></td>
        <td>&nbsp;<asp:TextBox ID="txtCVC" runat="server" TextMode="Number"></asp:TextBox></td>
        <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="CVC is Required" ControlToValidate="txtCVC"></asp:RequiredFieldValidator></td>
    </tr>
       <tr>
        <td>&nbsp;<asp:Label ID="Label7" runat="server" Text="is Default"></asp:Label></td>
        <td>&nbsp;<asp:RadioButton ID="txtIsDefaultT" Text="True" runat="server"/></td>
        <td>&nbsp;</td>
    </tr>
        <tr>
        <td></td>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Add Credit Card" OnClick="Button1_Click" /></td>
        <td></td>
    </tr>
</table>
</center>
        <br /><br /><br /><br /><br /><br />
</asp:Content>