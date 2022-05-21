<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MovieLookup.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
            font-size: x-large;
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
            color: #008000;
        }
        .auto-style2 {
            font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">Login</span></strong><p>
                <span class="auto-style2">
                <asp:Label ID="lblLoginError" runat="server" Font-Bold="True" Font-Names="Cambria" ForeColor="#CC0000"></asp:Label>
                </span>
            </p>
            <p>
                <span class="auto-style2">Username:</span><br class="auto-style2" />
            <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style2"></asp:TextBox>
            </p>
        <p>
            <span class="auto-style2">Password:</span><br class="auto-style2" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="auto-style2"></asp:TextBox>
            </p>
            <span class="auto-style2">
            <asp:Button ID="btnLogin" runat="server" Font-Names="Cambria" OnClick="btnLogin_Click" Text="Login" />
            </span>
            <br />
            <span class="auto-style2">&nbsp;<br />
            <asp:LinkButton ID="btnRegister" runat="server" OnClick="btnRegister_Click">Register</asp:LinkButton>
            <br />
            <br />
            </span>
            <br />
        </div>
    </form>
</body>
</html>
