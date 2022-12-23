<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStadium.aspx.cs" Inherits="firstpro.AddStadium" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AddS tadium</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
        </div>
        <div>
            <br />
            Stadium Name<br />
            <asp:TextBox ID="StadiumNameTB" runat="server"></asp:TextBox>
            <br />
            <br />
            Stadium Location<br />
            <asp:TextBox ID="StadiumLocationTB" runat="server"></asp:TextBox>
            <br />
            <br />
            Stadium Capacity<br />
            <asp:TextBox ID="StadiumCapacityTB" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="addStaduimB" runat="server" Text="Add" OnClick="addStaduimB_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
        </div>
    </form>
</body>
</html>
