<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdmin.aspx.cs" Inherits="firstpro.SystemAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>System Admin</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <nav class="navbar" >
        <asp:Label ID="Lab" runat="server" Text=" "></asp:Label>
        <div class="links">
            <a href="SystemAdmin.aspx">Home</a>
            <a href="/create" style ="color: beige;background-color: red;border-radius: 8px;">Info</a>
        </div>
    </nav>

    <div class="neon-border2">
        <form id="form1" runat="server">

        <div class="content2">
            <asp:Button ID="AddClubB" runat="server" OnClick="AddClub" Text="AddClub" />
            <asp:Button ID="BlockFanB" runat="server" Text="BlockFan" OnClick="BlockFan" />
            <asp:Button ID="DeleteclubB" runat="server" OnClick="Deleteclub" Text="DeleteClub" />
            <asp:Button ID="AddStadiumB" runat="server" Text="AddStadium" OnClick="AddStadium" />
            <asp:Button ID="DeleteStadiumB" runat="server" Text="DeleteStadium" OnClick="DeleteStadium" />
        
        </div>
    </form>
    </div>
    
</body>
</html>
