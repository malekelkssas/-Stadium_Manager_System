<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteMatch.aspx.cs" Inherits="firstpro.DeleteMatch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Match</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label5" runat="server" Text=" "></asp:Label>
        </div>
        <div>
           Delete Match</div> <br />
    <asp:Label ID="Label1" runat="server" Text="Host Club Name:"></asp:Label><br />
    <asp:TextBox ID="HostClubName" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label2" runat="server" Text="Guest Club Name:"></asp:Label><br />
    <asp:TextBox ID="GuestClubName" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label3" runat="server" Text="Start Time:"></asp:Label><br />
    <asp:TextBox ID="StartTime" runat="server"></asp:TextBox><br />
    <asp:Label ID="Label4" runat="server" Text="End Time:"></asp:Label><br />
    <asp:TextBox ID="EndTime" runat="server"></asp:TextBox><br /><br />
    <asp:Button ID="DELETE" runat="server" OnClick="Delete" Text="DELETE" />
    <asp:Label ID="comment" runat="server" Text=" "></asp:Label>

    </form>
</body>
</html>
