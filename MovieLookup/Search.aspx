<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="MovieLookup.Search" %>

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
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">Movie Search<br />
            </span></strong>
        </div>
        <p>
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnSearch" runat="server" Font-Names="Cambria" Text="Search" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MovieID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="5">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:ImageField DataImageUrlField="CoverImgURL" HeaderText="Cover Art">
                        <ControlStyle Height="150px" />
                    </asp:ImageField>
                    <asp:HyperLinkField DataNavigateUrlFields="MovieID" DataNavigateUrlFormatString="~/Detail.aspx?t={0}" DataTextField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Movie] WHERE (([Title] LIKE '%' + @Title + '%') OR ([Description] LIKE '%' + @Description + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" DefaultValue=" " Name="Title" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSearch" DefaultValue=" " Name="Description" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:LinkButton ID="btnWatchList" runat="server" OnClick="btnWatchList_Click">Watch List</asp:LinkButton>
        </p>
    </form>
</body>
</html>
