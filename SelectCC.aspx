<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="SelectCC.aspx.cs" Inherits="SelectCC" %>

<asp:Content ID="BodyContent1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CC_No], [FirstName], [MiddleInitial], [Expiration], [CC_Type], [CVC], [UserID] FROM [CreditCard] WHERE ([UserID] = @UserID)">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
      <center><br /><br /><br /><br /><br />
    <asp:GridView ID="GridView1" DataKeyNames="CC_No" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Caption="Your Credit Cards" CellPadding="3" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
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
          <p>

              <asp:HyperLink ID="HyperLink1" runat="server" Text="Add Credit Card" NavigateUrl="~/addCC.aspx"/>
          </p>
       </center>
        <br /><br /><br /><br /><br /><br />
    </asp:Content>