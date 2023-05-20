<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fan.aspx.cs" Inherits="firstpro.Fan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fan</title>
    
    <link rel="stylesheet" href="Style.css" />
    <link rel="stylesheet" href="CSS.css" />

</head>
<body>
    <div class="navbar">
        <div class="links">
            
        <a href="Fan.aspx">Home</a>
        <a href="/create" style ="color: beige;background-color: red;border-radius: 8px;">Info</a>

        </div>
    </div>

    <form id="form1" runat="server">
        <div class="controls">
            <div id="Info" style="width:30%">
                <asp:Table ID="Tickets" runat="server"></asp:Table>
            </div>
            <div class="reqContainer" style="width:70%">
                <div class="selectDate">
                    <input id="Text1" runat="server" type="datetime-local" style="margin: 89px 0px;"/>
                    <div class="veButtons">
                        <asp:Button ID="viewMatch" runat="server" Text="View Matches" OnClick="viewMatches_Click" />
                        <asp:Label ID="errorMessage" runat="server" Style="color: red" Hidden>Please Enter a valid Date</asp:Label>
                        <label id="done" runat="server" style="color:darkgreen;margin: 0px 12px;padding:12px 16px;">Completed Successfully!</label>
                    </div>
                </div>
                <div class="wraptable">
                    <asp:Table ID="matches" runat="server"></asp:Table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
