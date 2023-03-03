<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteStadium.aspx.cs" Inherits="firstpro.deleteStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>delete Stadium</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <nav class="navbar">
        <h1>delete Stadium</h1>
        <div class="links">
            <a href="SystemAdmin.aspx">Home</a>
            <a href="/create" style ="color: beige;background-color: red;border-radius: 8px;">Info</a>
        </div>
    </nav>

    <div class="neon-border">
        
    <form id="form1" runat="server">
        <div class="lab">
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <br />
        <div class="divitext">

            <asp:TextBox ID="StaduimNameTB" runat="server" placeholder="Staduim Name"></asp:TextBox>
        </div>
        <div class="content2">
            <asp:Button ID="deleteB" runat="server" OnClick="deleteClub" Text="Delete" />
            <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
        </div>
    </form>
    </div>

</body>
</html>
