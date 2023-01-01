<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlayedMatches.aspx.cs" Inherits="firstpro.PlayedMatches" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Played Matches</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <div>
            PlayedMatches</div><br />
        <div>
       <asp:Label ID="host_club" runat="server" Text="Label"> Host Club: </asp:Label>
       <asp:Label ID="Label1" runat="server" Text="Label">  </asp:Label>
        </div>
        <div>
       <asp:Label ID="guest_club" runat="server" Text="Label"> Guest Club: </asp:Label>
       <asp:Label ID="Label2" runat="server" Text="Label">  </asp:Label>
        </div>
        <div>
       <asp:Label ID="start_time" runat="server" Text="Label"> Start Time: </asp:Label>
       <asp:Label ID="Label3" runat="server" Text="Label">  </asp:Label>
        </div>
        <div>
       <asp:Label ID="end_time" runat="server" Text="Label"> End Time: </asp:Label>
       <asp:Label ID="Label4" runat="server" Text="Label">  </asp:Label>
        </div>

    </form>
</body>
</html>
