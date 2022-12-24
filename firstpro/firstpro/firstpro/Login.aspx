<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="firstpro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <br />
        Welcome To our App
        <br />
        <br />

            <asp:TextBox ID="UsernameTB" runat="server" placeholder="User name" MaxLength="20"></asp:TextBox>
        <br />
        <br />

        
        <asp:TextBox type="password" placeholder= "password" ID="PasswordTB" runat="server" MaxLength="20"></asp:TextBox>
        <p>
            &nbsp;&nbsp;
            <asp:Button ID="loginb" runat="server" OnClick="login" Text="login" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="RegisterB" runat="server" OnClick="Register" Text="Register" />
        </p>
    </form>
</body>
</html>
