<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="deleteClub.aspx.cs" Inherits="firstpro.deleteClub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>delete Club</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Club Name<br />
            <asp:TextBox ID="ClubName" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="deleteClubB" runat="server" Text="Delete" OnClick="deleteClubB_Click" />
        </div>
    </form>
</body>
</html>
