<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [SongID], [Title], [Album], [Artist], [Genre], [ReleaseDate], [ListPrice], [ClipName] 
FROM [Song]
WHERE Album LIKE @SearchKey OR Title LIKE @SearchKey OR Artist LIKE @SearchKey OR FileName LIKE @SearchKey">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="%" Name="SearchKey" SessionField="SearchKey" />
        </SelectParameters>
</asp:SqlDataSource>
<center><br /><br /><br />
    <asp:TextBox ID="TextBox1" runat="server" Width="426px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" OnClick="Button1Click" Text="Search" /><asp:Button ID="Button2" runat="server" OnClick="Button2Click" Text="Clear" />
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="Available Songs" CellPadding="3"  DataKeyNames="SongID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="SongID" HeaderText="SongID" ReadOnly="True" SortExpression="SongID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Album" HeaderText="Album" SortExpression="Album" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
            <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
            <asp:BoundField DataField="ClipName" HeaderText="ClipName" SortExpression="ClipName" />
            <asp:HyperLinkField DataNavigateUrlFields="ClipName" DataNavigateUrlFormatString="~/Songfolder/{0}" HeaderText="Preview" Text="Preview" />
            <asp:HyperLinkField DataNavigateUrlFields="SongID" DataNavigateUrlFormatString="~/shopcart.aspx?id={0}&amp;action='add'" HeaderText="Buy" Text="Buy" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
</center>

    <br /><br /><br /><br /><br /><br />

</asp:Content>
