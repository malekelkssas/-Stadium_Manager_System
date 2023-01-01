<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssociationManager.aspx.cs" Inherits="firstpro.SportsAssociationManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Sports Association Manager</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <div>
          Sports Association Manager Page
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Add_match" Text=" Add Match " />
        <asp:Button ID="Button2" runat="server" OnClick="Remove_Match" Text=" Remove Match " />
        <asp:Button ID="Button3" runat="server" OnClick="Coming_Matches" Text=" Coming Matches " /><br/><br/>
        <asp:Button ID="Button4" runat="server" OnClick="Played_Matches" Text=" Played Matches" />
        <asp:Button ID="Button5" runat="server" OnClick="Never_Matched" Text="  Never Matched  " />

    </form>
</body>
</html>
