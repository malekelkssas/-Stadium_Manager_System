<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManager.aspx.cs" Inherits="firstpro.StadiumManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Stadium Manager</title>
    <link rel="stylesheet" href="Style.css">
    <style>
        
    </style>
</head>
<body>
    <div class="navbar">
        <a href="Login.aspx">Login</a>
        <a href="Register.aspx">Register</a>
    </div>
    <form id="stadiumManagerView" runat="server" method="get">
        <div class="controls">
            <div id="Info">
                <label id="stadiumName" runat="server"></label>
                <label id="stadiumLocation" runat="server"></label>
                <label id="stadiumStatus" runat="server"></label>
                <label id="stadiumCapacity" runat="server"></label>
            </div>
            <div class="reqContainer">
                <div class="vcButtons">
                    <input runat="server" onserverclick="viewRequests_Click" type="button" value="View Requests" />
                    <input runat="server" onserverclick="hideRequests_Click" type="button" value="Close Requests" />
                </div>
                <div class="wraptable">
                    <asp:Table ID="requests" runat="server"></asp:Table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
