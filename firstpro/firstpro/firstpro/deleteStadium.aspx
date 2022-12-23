<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteStadium.aspx.cs" Inherits="firstpro.deleteStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>delete Stadium</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <div>


            <br />
            Staduim Name<br />
            <asp:TextBox ID="StaduimNameTB" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="deleteB" runat="server" OnClick="deleteClub" Text="Delete" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
            <br />
            <br />


        </div>
    </form>
</body>
</html>
