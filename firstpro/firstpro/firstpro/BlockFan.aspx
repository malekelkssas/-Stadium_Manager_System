<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockFan.aspx.cs" Inherits="firstpro.BlockFan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Block Fan</title>
    <style type="text/css">
        .auto-style1 {
            height: 131px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <br />
            Fan National ID<br />
            <asp:TextBox ID="FanID" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="blockFanB" runat="server" Text="Block" OnClick="blockFanB_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="homeB" runat="server" Text="Home" OnClick="homeB_Click" />
        </div>
    </form>
</body>
</html>
