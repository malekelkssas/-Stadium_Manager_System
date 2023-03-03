<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentativeReg.aspx.cs" Inherits="firstpro.ClubRepresentativeReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ClubRepresentativeReg</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <nav class="navbar">
        <h1>Welcome</h1>
        <div class="links">
            <a href="Login.aspx">Home</a>
            <a href="/create" style ="color: beige;background-color: red;border-radius: 8px;">Info</a>
        </div>
    </nav>
    <div class="neon-border">
        <form id="form1" runat="server">
        <div class="divitext">
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
            <br />
        <asp:TextBox ID="nameTB" runat="server" placeholder="Name" required = "True" MaxLength="20"></asp:TextBox>
            <br />
        <asp:TextBox ID="usernameTB" runat="server" placeholder="User name" required = "True" MaxLength="20"></asp:TextBox>
            <br />
        <asp:TextBox ID="clubnameTB" runat="server" placeholder="Club name" required = "True" MaxLength="20"></asp:TextBox>
            <br />
        <asp:TextBox ID="passwordTB" runat="server" placeholder="Password" required = "True" type="password" MaxLength="20"></asp:TextBox>
        </div>
            <br />
        <div class="content2">
            <asp:Button ID="RegisterB" runat="server" OnClick="Register" Text="Register" />
        </div>
    </form>
    </div>
</body>
</html>
