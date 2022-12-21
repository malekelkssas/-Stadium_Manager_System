<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="firstpro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Welcome To our App<p>
            <asp:TextBox ID="UsernameTB" runat="server" value="userName"></asp:TextBox>
        </p>
        <asp:TextBox ID="PasswordTB" runat="server" value="Password"></asp:TextBox>
        <p>
            <asp:Button ID="loginb" runat="server" OnClick="login" Text="login" />
        </p>
    </form>
</body>
</html>
