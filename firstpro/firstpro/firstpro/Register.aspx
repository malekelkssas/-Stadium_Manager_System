<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="firstpro.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Regisiter</title>
    <link rel="stylesheet" href="CSS.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="SportsAssociationManagerB" runat="server" OnClick="SportsAssociationManagerReg" Text="Sports Association Manager" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ClubRepresentativeB" runat="server" OnClick="ClubRepresentativeReg" Text="Club Representative" />
        <br />
            <br />
        <asp:Button ID="StadiumManagerB" runat="server" OnClick="StadiumManagerReg" Text="Stadium Manager" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="FanB" runat="server" OnClick="FanReg" Text="Fan" />
        </div>
    </form>
</body>
</html>
