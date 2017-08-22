<%@ page title="CEGIS :: Organization Entry" language="C#" masterpagefile="~/OrgMaster.master" autoeventwireup="true" inherits="OrgEntry, App_Web_wofnlaod" %>
<%@ Register TagPrefix="atk" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <script type="text/javascript">

        function pageLoad() {
            $('#<%=txtOrgName.ClientID %>').focus(function() {
                $('#<%=lblConfMsg.ClientID %>').text('');
            });
            $('#<%=txtOrgAdd.ClientID %>').focus(function() {
                $('#<%=lblConfMsg.ClientID %>').text('');
            });
        }

        function checkorginfo() {

            var orgName = $("#<%=txtOrgName.ClientID %>").val();
            var orgAdd = $("#<%=txtOrgAdd.ClientID %>").val();

            if (!orgName || orgName.trim() == '') {
                alert('Organization Name is empty !');
                $("#<%= txtOrgName.ClientID %>").focus();
                return false;
            }

            if (!orgAdd || orgAdd.trim() == '') {
                alert('Organization Address is empty !');
                $("#<%=txtOrgAdd.ClientID %>").focus();
                return false;
            }

            return true;
        }

        function confirmmsg(isOk) {
            var msg;

            if (isOk && isOk == true)
                msg = "Data Inserted Successfully.";
            else
                msg = "Data Insertion Failed !";

            alert(msg);
        }

    </script>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server" ClientIDMode="Static">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="True" />
    
    <script type="text/javascript" language="javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(beginRequest);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(endRequest);

        function beginRequest(sender, args) {
            window.$find('<%=mpeLoading.ClientID %>').show();
        }

        function endRequest(sender, args) {
            window.$find('<%=mpeLoading.ClientID %>').hide();
        }
    </script>

    <div>

        <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display:none">
            <div class="pageloading">
                <p>
                    Please wait ... . .
                </p>
            </div>
        </asp:Panel>
        <atk:ModalPopupExtender ID="mpeLoading" runat="server" BackgroundCssClass="modal_bg" DropShadow="false"
            PopupControlID="pnlPopup" TargetControlID="btnHide" CancelControlID="btnClose" />
        
        <asp:Panel ID="pnlConfirm" runat="server" CssClass="modalPopup" Style="display:none;">
            <div class="cfmmsgdiv">
                <asp:UpdatePanel ID="upCfrmMsg" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnClear" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                        <table width="100%" style="font-size: 8.75pt;" cellpadding="3">
                            <tr>
                                <td class="headtr" colspan="4">
                                    Confirmation... . .
                                    <asp:Button ID="btnCloseMsg" runat="server" CssClass="btnclose" Text="X" OnClientClick="$find('mpeCfrmMsg').hide();" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" style="text-align: center">
                                    <span class="heading" style="color:#FA2413;">This Organization information already exist !</span>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td width="30%" class="td_align_right">OrgId  :</td>
                                <td width="70%">
                                    <asp:Label ID="lblOrgId" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td width="30%" class="td_align_right">Organization Name  :</td>
                                <td width="70%">
                                    <asp:Label ID="lblOrgName" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Organization Address  :</td>
                                <td>
                                    <asp:Label ID="lblOrgAdd" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Office Phone No.  :</td>
                                <td>
                                    <asp:Label ID="lblOrgOfficePhone" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Cell No.  :</td>
                                <td>
                                    <asp:Label ID="lblOrgCell" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Fax  :</td>
                                <td>
                                    <asp:Label ID="lblOrgFax" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Email Address  :</td>
                                <td>
                                    <asp:Label ID="lblOrgEmail" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Focal Person Name  :</td>
                                <td>
                                    <asp:Label ID="lblFocalPersonName" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Focal Person Designation  :</td>
                                <td>
                                    <asp:Label ID="lblFocalPersonDesig" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Focal Person Email  :</td>
                                <td>
                                    <asp:Label ID="lblFocalPersonEmail" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="td_align_right">Website  :</td>
                                <td>
                                    <asp:Label ID="lblOrgWeb" runat="server" Width="75%"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnAddNew"  CssClass="mybtns vsbtn" runat="server" Text="Add New" 
                                        OnClientClick="return confirm(' Are you sure to add duplicate data ?');" 
                                        onclick="btnAddNew_Click" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="btnReplace"  CssClass="mybtns vsbtn" runat="server" Text="Replace" 
                                        OnClientClick="return confirm(' Are you sure to replace data ?');" 
                                        onclick="btnReplace_Click" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="btnClose" CssClass="mybtns vsbtn" runat="server" Text="Close" OnClientClick="$find('mpeCfrmMsg').hide();" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4"></td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </asp:Panel>

        <input id="btnHide" runat="server" type="hidden" />
        <atk:ModalPopupExtender ID="mpeCfrmMsg" runat="server" BackgroundCssClass="modal_bg" DropShadow="false" 
            PopupControlID="pnlConfirm" TargetControlID="btnHide" CancelControlID="btnClose">
        </atk:ModalPopupExtender>
        

        <asp:UpdatePanel ID="upOrgInfo" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnAddNew" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnReplace" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <table width="100%" cellpadding="8">
                    <tr>
                        <td colspan="4" style="text-align: center">
                            <span class="heading">Organization Information Entry</span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">
                            <asp:Label ID="lblConfMsg" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td width="30%" class="td_align_right">Organization Name  :</td>
                        <td width="70%">
                            <asp:TextBox ID="txtOrgName" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Organization Address  :</td>
                        <td>
                            <asp:TextBox ID="txtOrgAdd" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Office Phone No.  :</td>
                        <td>
                            <asp:TextBox ID="txtOrgOfficePhone" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Cell No.  :</td>
                        <td>
                            <asp:TextBox ID="txtOrgCell" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Fax  :</td>
                        <td>
                            <asp:TextBox ID="txtOrgFax" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Email Address  :</td>
                        <td>
                            <asp:TextBox ID="txtOrgEmail" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Focal Person Name  :</td>
                        <td>
                            <asp:TextBox ID="txtFocalPersonName" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Focal Person Designation  :</td>
                        <td>
                            <asp:TextBox ID="txtFocalPersonDesig" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Focal Person Email  :</td>
                        <td>
                            <asp:TextBox ID="txtFocalPersonEmail" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="td_align_right">Website  :</td>
                        <td>
                            <asp:TextBox ID="txtOrgWeb" runat="server" Width="75%"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">
                            <asp:Button ID="btnSave"  CssClass="mybtns" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return checkorginfo();" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnClear"  CssClass="mybtns" runat="server" Text="Clear" OnClick="btnClear_Click" OnClientClick="return confirm(' Are you sure to clear all data ?');" />
                            &nbsp;&nbsp;
                            <asp:Button ID="btnCancel"  CssClass="mybtns" runat="server" Text="Cancel" OnClick="btnCancel_Click" OnClientClick="return confirm(' Are you sure to exit ?');" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>

