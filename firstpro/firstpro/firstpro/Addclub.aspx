<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addclub.aspx.cs" Inherits="firstpro.Addclub" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Club</title>
    <style type="text/css">
        .auto-style2 {
            width: 498px;
            height: 118px;
            margin-left: 0px;
        }
        </style>
    <link rel="stylesheet" href="CSS.css" />
    </head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
            <asp:Label ID="comment" runat="server" Text=" "></asp:Label>
            </div>
        <div class="auto-style2">
             
          
            Club Name<br />
        <asp:TextBox ID="clubName" runat="server"></asp:TextBox>
            <br/>
        
        <br />
        Club Location<br />
        <asp:TextBox ID="clubLocation" runat="server"></asp:TextBox>
        <br />
            <br />

            
        <asp:Button ID="AddClubB" runat="server" Text="Add" OnClick="AddClub" />
   
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="HomeB" runat="server" OnClick="Home" Text="Home" />
        </div>
    </form>
        
</body>
</html>
