<%@ page title="CEGIS :: Login..." language="C#" masterpagefile="~/OrgMaster.master" autoeventwireup="true" inherits="OrgLogin, App_Web_wofnlaod" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <title>CEGIS :: Login...</title>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="width:100%; margin:0;">
        <div style="border: 1px solid #AFAFAF; width:385px; margin:85px auto; box-shadow: 4px 3px 10px #3F453F;">
            <table style="width:100%; background-color:#D5DADF;">                    
                <tr>
                    <td colspan="2" class="heading" style="padding:8px; text-align:center; background-color:#BCCAD4;">
                        <span>User Login</span>
                    </td>
                </tr>
                <tr>
                    <td style="width: 35%;">&nbsp;</td>
                    <td style="width: 65%;">&nbsp;</td>
                </tr>
                <tr>
                    <td class="td_align_right">
                        User Name:</td>
                    <td>
                        <asp:TextBox ID="txtUserID" runat="server" Width="75%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="td_align_right">
                        Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" Width="75%" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>

                    <td>
                        <asp:Button ID="btnLogin" CssClass="mybtns sbtn" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <asp:Button ID="btnClear" CssClass="mybtns sbtn" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
