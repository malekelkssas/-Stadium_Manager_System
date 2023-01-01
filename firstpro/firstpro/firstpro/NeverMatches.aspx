<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NeverMatches.aspx.cs" Inherits="firstpro.NeverMatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Never Matched</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <div>
           Never Matched
        </div><br />
        <asp:Label ID="Label1" runat="server" Text="Label">  First Club:  </asp:Label> 
                <div> 
        <asp:Label ID="Label2" runat="server" Text="Label"> </asp:Label>
            </div>
        <br /> 
        <asp:Label ID="Label3" runat="server" Text="Label"> Second Club: </asp:Label>
                <div> 
        <asp:Label ID="Label4" runat="server" Text="Label"> </asp:Label>
            </div>
    </form>
</body>
</html>
