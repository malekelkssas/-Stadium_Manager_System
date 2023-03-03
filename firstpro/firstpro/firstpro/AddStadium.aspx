﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStadium.aspx.cs" Inherits="firstpro.AddStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Stadium</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <nav class="navbar">
        <h1>Add Stadium</h1>
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
            <asp:TextBox ID="StadiumNameTB" runat="server" placeholder="Stadium Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="StadiumLocationTB" runat="server" placeholder="Stadium Location"></asp:TextBox>
            <br />
            <asp:TextBox ID="StadiumCapacityTB" runat="server" placeholder="Stadium Capacity"></asp:TextBox>
        </div>

        <div class="content2">
            <asp:Button ID="addStaduimB" runat="server" Text="Add" OnClick="addStaduimB_Click" />
            <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
        </div>

    </form>
    </div>
    
</body>
</html>
