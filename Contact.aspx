<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
            <center><br /><br /><br /><br /><br />
    <h2>Contact</h2>
    <asp:HyperLink runat="server" Text = "Facebook Profile" NavigateUrl="https://www.facebook.com/Sathyayhtas"></asp:HyperLink><br />
      <asp:HyperLink runat="server" Text="Linkedin Profile" NavigateUrl="https://www.linkedin.com/in/unnisathya92/"></asp:HyperLink><br />
    
    <address>
      Sathya, V<br />
        Chicago, IL 60607<br />
        <abbr title="Phone">Ph:</abbr>
        312.383.7213
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:unnisathya18@gmail.com">unnisathya18@gmail.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:unnisathya18@gmail.com.com">unnisathya92@gmail.com</a>
    </address>

          </center>
        <br /><br /><br /><br /><br /><br />
</asp:Content>
