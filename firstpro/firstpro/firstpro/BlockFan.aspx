<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockFan.aspx.cs" Inherits="firstpro.BlockFan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Block Fan</title>
   
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <nav class="navbar">
        <h1>Block Fan</h1>
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
                <asp:TextBox ID="FanID" runat="server" placeholder="Fan National ID"></asp:TextBox>
         </div>
            
        <div class="content2">
            <asp:Button ID="blockFanB" runat="server" Text="Block" OnClick="blockFanB_Click" />
            <asp:Button ID="homeB" runat="server" Text="Home" OnClick="homeB_Click" />
        </div>
         

    </form>
    </div>
    
</body>
</html>
