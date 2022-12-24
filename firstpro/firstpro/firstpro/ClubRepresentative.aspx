 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentative.aspx.cs" Inherits="firstpro.ClubRepresentative" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Club Representative</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Club Representative&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
        </div>
        <div>
            <div style="margin-top: 0px">
                Clubs<br />
                <asp:Panel ID="Panel1" runat="server">
                </asp:Panel>
                <br />
                <br />
            </div>
            Club Name<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View" />
            <br />
            <asp:Panel ID="Panel2" runat="server">
            </asp:Panel>
            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [name], [id], [location] FROM [Club] WHERE ([name] = @name)">
            <SelectParameters>
                <asp:SessionParameter Name="name" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
