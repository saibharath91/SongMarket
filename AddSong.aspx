<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddSong.aspx.cs" Inherits="AddSong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
           <center><br /><br /><br /><br /><br />

<INPUT type=file id=File1 name=File1 runat="server" >

    <table style="width: 100%;">
        <tr>
            <td>&nbsp;<asp:Label ID="Label1" runat="server" Text="Song ID"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtSongID" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Song ID is required" ControlToValidate="txtSongID"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label2" runat="server" Text="Title"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Title is required" ControlToValidate="txtTitle"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label3" runat="server" Text="Album"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtAlbum" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Album is required" ControlToValidate="txtAlbum"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label4" runat="server" Text="Artist"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtArtist" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Artist is required" ControlToValidate="txtArtist"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label5" runat="server" Text="Genre"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtGenre" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Genre is required" ControlToValidate="txtGenre"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td style="height: 27px">&nbsp;<asp:Label ID="Label6" runat="server" Text="Release Date"></asp:Label></td>
            <td style="height: 27px">&nbsp;<asp:TextBox ID="txtReleaseDate" TextMode="Date" runat="server"></asp:TextBox></td>
            <td style="height: 27px">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Release Date is required" ControlToValidate="txtReleaseDate"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label7" runat="server" Text="List Price"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtListPrice" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="List Price is required" ControlToValidate="txtListPrice"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label8" runat="server" Text="Clip Name"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtClipName" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Clip Name is required" ControlToValidate="txtClipName"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp;<asp:Label ID="Label9" runat="server" Text="File Name"></asp:Label></td>
            <td>&nbsp;<asp:TextBox ID="txtFileName" runat="server"></asp:TextBox></td>
            <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="File Name is required" ControlToValidate="txtFileName"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Btn_Upload" runat="server" Text="Upload" OnClick="Btn_Upload_Click" />
            </td>
            <td></td>
        </tr>
    </table>
           </center>        <br /><br /><br /><br /><br /><br />

</asp:Content>
    
