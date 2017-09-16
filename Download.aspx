<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Download.aspx.cs" Inherits="Default2" %>

<asp:Content ID="BodyContent2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="Select OrderID,
OrderLine.SongID,
Title, Album,
Artist, ListPrice,
FileName from OrderLine inner join Song
on OrderLine.SongID = Song.SongID
Where OrderID = @OrderID
">
        <SelectParameters>
            <asp:SessionParameter Name="OrderID" SessionField="OrderID" />
        </SelectParameters>
    </asp:SqlDataSource>
             <center><br /><br /><br /><br /><br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="OrderID,SongID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" Caption="Available Songs" OnUnload="GridView1_Unload">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="SongID" HeaderText="SongID" ReadOnly="True" SortExpression="SongID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Album" HeaderText="Album" SortExpression="Album" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" SortExpression="Artist" />
            <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" />
            <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
            <asp:HyperLinkField DataNavigateUrlFields="FileName" DataNavigateUrlFormatString="~/Songfolder/{0}" HeaderText="Download" Text="Download" />
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