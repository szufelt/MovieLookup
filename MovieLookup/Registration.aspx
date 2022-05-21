<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="MovieLookup.Registration" %>

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
        <p>
            <strong><span class="auto-style1">Registration</span></strong></p>
        <p>
            <asp:Label ID="lblRegistrationError" runat="server" Font-Bold="True" Font-Names="Cambria" ForeColor="#CC0000"></asp:Label>
            <br class="auto-style2" />
            <span class="auto-style2">First Name:</span><br class="auto-style2" />
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="auto-style2"></asp:TextBox>
            <br class="auto-style2" />
            <br class="auto-style2" />
            <span class="auto-style2">Last Name:</span><br class="auto-style2" />
            <asp:TextBox ID="txtLastName" runat="server" CssClass="auto-style2"></asp:TextBox>
            <br class="auto-style2" />
            <br class="auto-style2" />
            <span class="auto-style2">Email:</span><br class="auto-style2" />
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="auto-style2"></asp:TextBox>
            </p>
        <p>
            <span class="auto-style2">Username:</span><br class="auto-style2" />
            <asp:TextBox ID="txtUsername" runat="server" CssClass="auto-style2"></asp:TextBox>
            </p>
        <p>
            <span class="auto-style2">Password:</span><br class="auto-style2" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="auto-style2"></asp:TextBox>
            </p>
        <p>
            <span class="auto-style2">Confirm Password:</span><br class="auto-style2" />
            <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" CssClass="auto-style2"></asp:TextBox>
            <br class="auto-style2" />
            <br class="auto-style2" />
            <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" CssClass="auto-style2" />
            <br class="auto-style2" />
            <br class="auto-style2" />
            <asp:LinkButton ID="btnLogin" runat="server" OnClick="btnSearchPage_Click" CssClass="auto-style2">Log In</asp:LinkButton>
            <span class="auto-style2">&nbsp;&nbsp;
            </span>
            </p>
        <div>
        </div>
    </form>
</body>
</html>
