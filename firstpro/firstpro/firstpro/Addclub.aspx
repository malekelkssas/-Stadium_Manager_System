<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addclub.aspx.cs" Inherits="firstpro.Addclub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Club</title>
    <link rel="stylesheet" href="CSS.css" />
    </head>
<body>
    <nav class="navbar">
        <h1>Add club</h1>
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
                <asp:TextBox ID="clubName" runat="server" placeholder="Club Name"></asp:TextBox>
                <br />
                <asp:TextBox ID="clubLocation" runat="server" placeholder="Club Location"></asp:TextBox>
            </div>
            
        

            <div class="content2">
                <asp:Button ID="AddClubB" runat="server" Text="Add" OnClick="AddClub" />
                <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
            </div>
        
        
    </form>
    
    </div>
        
</body>
</html>
