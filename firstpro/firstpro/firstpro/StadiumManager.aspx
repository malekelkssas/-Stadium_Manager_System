<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManager.aspx.cs" Inherits="firstpro.StadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Stadium Manager</title>
    <style>
        #stadiumManagerView{
            text-align:center;
        }
        #stadiumInfo{
            width: 100%;
            display:flex;
            justify-content:space-around;
            margin-top:50px;
        }
        .aspNetHidden{
            display: none;
        }
        
            
    </style>
</head>
<body>
    <h1 style="text-align:center">
         Welcome
    </h1>
    <form id = "stadiumManagerView" runat="server" method ="get">
        <div id="stadiumInfo">
            <label id="stadiumName" runat="server"></label>
            <label id="stadiumLocation" runat="server"></label>
            <label id="stadiumStatus" runat="server"></label>
        </div>

        <input  runat="server" onserverclick="viewRequests_Click" type="button" value="View Requests" />
        <input  runat="server" onserverclick="hideRequests_Click" type="button" value="Close Requests" />

        <asp:Table ID="requests" runat="server" GridLines="Both" HorizontalAlign="Center" Font-Names="Verdana" Font-Size="8pt" 
                  CellPadding="15" CellSpacing="0">
        </asp:Table>
    </form>
</body>
</html>
