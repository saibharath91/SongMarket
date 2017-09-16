<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="shopcart.aspx.cs" Inherits="shopcart" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
        SelectCommand="SELECT * FROM [vShopcart] WHERE ([shopcartid] = @shopcartid)">
        <SelectParameters>
            <asp:SessionParameter Name="shopcartid" SessionField="shopcartID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <center><br /><br /><br /><br /><br />
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
        Caption="Your Shopcart" CellPadding="3" 
        DataSourceID="SqlDataSource1" 
    EmptyDataText="Your shopcart is empty..." AutoGenerateColumns="False" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="quantity" HeaderText="quantity" 
                SortExpression="quantity" />
            <asp:BoundField DataField="SongID" HeaderText="SongID" 
                SortExpression="SongID" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="Artist" HeaderText="Artist" 
                SortExpression="Artist" />
            <asp:BoundField DataField="listprice" HeaderText="listprice" 
                SortExpression="listprice" />
            <asp:BoundField DataField="subtotal" HeaderText="subtotal" 
                SortExpression="subtotal" />
            <asp:HyperLinkField DataNavigateUrlFields="SongID" 
                DataNavigateUrlFormatString="~/shopcart.aspx?id={0}&amp;action='del'" 
                HeaderText="Remove" Text="Delete" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView><br /><br />
    <p>
    Total Amount: 
    <asp:Label ID="lblAmount" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/selectCC.aspx" 
            onload="HyperLink1_Load">Checkout</asp:HyperLink>
    </p>
        </center>
        <br /><br /><br /><br /><br /><br />

</asp:Content>
