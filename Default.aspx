<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ListView ID="lvFriends" DataSourceID="obsFriends" runat="server" ItemPlaceholderID="phFriends">
            <LayoutTemplate>
                <table>
                    <tr style="background-color: Black; color: White">
                        <td>
                            Firstname
                        </td>
                        <td>
                            Lastname
                        </td>
                    </tr>
                    <asp:PlaceHolder ID="phFriends" runat="server"></asp:PlaceHolder>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <%# Eval("firstname") %>
                    </td>
                    <td>
                        <%# Eval("lastname") %>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
        <asp:DataPager runat="server" ID="dpFriends" PagedControlID="lvFriends" PageSize="3">
            <Fields>
                <asp:NumericPagerField ButtonType="Link" />
            </Fields>
        </asp:DataPager>
        <asp:ObjectDataSource ID="obsFriends" runat="server" SelectCountMethod="CountFriends"
            SelectMethod="ViewFriends" TypeName="friends" EnablePaging="true"></asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
