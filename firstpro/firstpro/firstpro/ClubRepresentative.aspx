
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentative.aspx.cs" Inherits="firstpro.ClubRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Club Representative</title>
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
        .auto-style2 {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style2">
        <asp:Label ID="welcomeLabel" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Table ID="repClubs" runat="server"></asp:Table>
        <br />
        Matches of your selected club:<br />
        <asp:GridView ID="GridView2" runat="server" ShowHeaderWhenEmpty="True" EmptyDataText="No records Found" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Hide all selected club's matches" />
        <br />
        <br />
        <br />
        Insert a date to view all stadiums available starting from that date:<br />
        <input id="Text1" runat="server" type="datetime-local" style="margin: 89px 0px;"/>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" />
        <br />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Table ID="matchesMyClubHost" runat="server"></asp:Table>
        <br />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Hide all displayed stadiums" />
        <br />
        <br />
        <hr />
        <br />
        These are all the matches your club is scheduled to host. Click &quot;Select&quot; on a match to send a request asking to host the match to the manager of the stadium at which the match is scheduled to be played.<br />
        <br />
        <br />
        <br />
        
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>

    </form>
</body>
</html>
