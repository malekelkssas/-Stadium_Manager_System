<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteClub.aspx.cs" Inherits="firstpro.deleteClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>delete Club</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <div>
            <br />
            Club Name<br />
            <asp:TextBox ID="ClubName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="deleteClubB" runat="server" Text="Delete" OnClick="deleteClubB_Click" />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
        </div>
    </form>
</body>
</html>
