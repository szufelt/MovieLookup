<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="MovieLookup.Detail" %>

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
            <strong><span class="auto-style1">Movie Search Details<br />
            <br />
            <br />
            </span></strong>
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" CssClass="auto-style2" DataKeyNames="MovieID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
            <EditRowStyle BackColor="#7C6F57" />
            <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
            <Fields>
                <asp:ImageField DataImageUrlField="CoverImgURL" HeaderText="Cover Art">
                    <ControlStyle Height="250px" />
                </asp:ImageField>
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" />
                <asp:HyperLinkField DataNavigateUrlFields="TrailerLink" HeaderText="Trailer Link" Text="Youtube.com" />
            </Fields>
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
        </asp:DetailsView>
        <strong>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movie] WHERE ([MovieID] = @MovieID) ORDER BY [Title] DESC">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="1" Name="MovieID" QueryStringField="t" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </strong>
        <br />
        <asp:Button ID="btnAddToWatchList" runat="server" OnClick="btnAddToWatchList_Click" Text="Add To Watch List" />
        <br />
        <asp:Label ID="lblAddError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="btnWatchList" runat="server" OnClick="btnWatchList_Click">WatchList</asp:LinkButton>
    </form>
</body>
</html>
