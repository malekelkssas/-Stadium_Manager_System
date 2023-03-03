<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="firstpro.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Regisiter</title>
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

    <div class ="neon-border2">
        <form id="form1" runat="server">
             <div class="content2">
                    <asp:Button ID="FanB" runat="server" OnClick="FanReg" Text="Fan" />
                    <asp:Button ID="StadiumManagerB" runat="server" OnClick="StadiumManagerReg" Text="Stadium Manager" />
                        <br />
                    <asp:Button ID="ClubRepresentativeB" runat="server" OnClick="ClubRepresentativeReg" Text="Club Representative" />
                    <asp:Button ID="SportsAssociationManagerB" runat="server" OnClick="SportsAssociationManagerReg" Text="Sports Association Manager" />
            </div>
        </form>
    </div>
</body>
</html>
