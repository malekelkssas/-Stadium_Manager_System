<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addclub.aspx.cs" Inherits="firstpro.Addclub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Club</title>
    </head>
<body>
    <form id="form1" runat="server">
        <br />
        Club Name<br />
        <asp:TextBox ID="clubName" runat="server"></asp:TextBox>
        <br />
        <br />
        Club Location<br />
        &nbsp;<asp:TextBox ID="clubLocation" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="AddClubB" runat="server" Text="Add" OnClick="AddClub" />
    </form>
        
</body>
</html>
