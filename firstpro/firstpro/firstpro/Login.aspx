<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="firstpro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
        <form id="form1" runat="server" >
        
            <div style="text-align:center; max-height:10px;">
                <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
            </div>
                <br />
            
            <div class="divitext">
                <asp:TextBox ID="UsernameTB" runat="server" placeholder="User name" MaxLength="20"></asp:TextBox>
                <br />
                <asp:TextBox type="password" placeholder= "password" ID="PasswordTB" runat="server" MaxLength="20" ></asp:TextBox>
            </div>
        

           <div class="content2" style="display:flex">
                <asp:Button ID="loginb" runat="server" OnClick="login" Text="login"  />
                 <asp:Button ID="RegisterB" runat="server" OnClick="Register" Text="Register" />
           </div>
        
        
    </form>
    </div>
</body>
</html>
