<%@ page title="CEGIS :: Organization Viewer" language="C#" masterpagefile="~/OrgMaster.master" autoeventwireup="true" inherits="OrgViewer, App_Web_wofnlaod" %>
<%@ Register TagPrefix="atk" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server" ClientIDMode="Static">
    
    <asp:ScriptManager ID="myScriptManager" runat="server" AllowCustomErrorsRedirect="True" EnablePartialRendering="True"
                    AsyncPostBackErrorMessage="Error in Ajax Loading... . .!'" />

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
    
    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
        <div class="pageloading">
            <p>
                Please wait ... . .
            </p>
        </div>
    </asp:Panel>
    <atk:modalpopupextender ID="mpeLoading" runat="server" TargetControlID="pnlPopup"
        PopupControlID="pnlPopup" BackgroundCssClass="modal_bg" />
        
        
    <div style="width:100%; padding:5px; text-align: center;">
        <span class="heading">Organization Information Details</span>
    </div>

    <div style="width:auto; padding:5px 20px; text-align:right;">
        Search By:
        <asp:DropDownList ID="ddlSearchOpt" runat="server" style="width:170px; margin:3px; padding:2px;">
        </asp:DropDownList>
        <asp:TextBox ID="txtSearch" runat="server" style="width:140px; margin:3px; padding:2px;" ></asp:TextBox>
        <asp:Button ID="btnSearch" CssClass="mybtns vsbtn" runat="server" Text="Go >>" OnClick="btnSearch_Click" />
    </div>
    
    <%--OrgName, OrgAdd, OrgOfficePhone, OrgCell, OrgFax, OrgEmail, 
                FocalPersonName, FocalPersonDesig, FocalPersonEmail, OrgWeb--%>
    
    <div style="width:100%; overflow:auto">
        <asp:UpdatePanel ID="upOrgInfo" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="gvOrgDetails" />
                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                
                <asp:GridView ID="gvOrgDetails" runat="server" Width="100%" GridLines="None" CellPadding="4" 
                    AllowPaging="True" AutoGenerateColumns="False" AllowSorting="True" ForeColor="#333333" 
                    OnRowDataBound="gvOrgDetails_RowDataBound" OnRowUpdating ="gvOrgDetails_RowUpdating" 
                    OnRowEditing="gvOrgDetails_RowEditing" OnRowCancelingEdit="gvOrgDetails_RowCancelingEdit" 
                    OnRowDeleting="gvOrgDetails_RowDeleting" OnSorting="gvOrgDetails_Sorting" 
                    OnPageIndexChanging="gvOrgDetails_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="OrgID" SortExpression="OrgID">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgID" runat="server" Width="50px" Text='<%# Bind("OrgID") %>' style="text-align:center;" Enabled="false"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgID" runat="server" Text='<%# Bind("OrgID") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Organization Name" SortExpression="OrgName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgName" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgName" runat="server" Text='<%# Bind("OrgName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Organization Address" SortExpression="OrgAdd">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgAdd" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgAdd") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgAdd" runat="server" Text='<%# Bind("OrgAdd") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Office Phone" SortExpression="OrgOfficePhone">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgOfficePhone" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgOfficePhone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgOfficePhone" runat="server" Text='<%# Bind("OrgOfficePhone") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cell" SortExpression="OrgCell">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgCell" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgCell") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgCell" runat="server" Text='<%# Bind("OrgCell") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fax" SortExpression="OrgFax">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgFax" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgFax") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgFax" runat="server" Text='<%# Bind("OrgFax") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Address" SortExpression="OrgEmail">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgEmail" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgEmail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgEmail" runat="server" Text='<%# Bind("OrgEmail") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Focal Person Name" SortExpression="FocalPersonName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFocalPersonName" runat="server" TextMode="MultiLine" Text='<%# Bind("FocalPersonName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFocalPersonName" runat="server" Text='<%# Bind("FocalPersonName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Focal Person Designation" SortExpression="FocalPersonDesig">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFocalPersonDesig" runat="server" TextMode="MultiLine" Text='<%# Bind("FocalPersonDesig") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFocalPersonDesig" runat="server" Text='<%# Bind("FocalPersonDesig") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Focal Person Email" SortExpression="FocalPersonEmail">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFocalPersonEmail" runat="server" TextMode="MultiLine" Text='<%# Bind("FocalPersonEmail") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFocalPersonEmail" runat="server" Text='<%# Bind("FocalPersonEmail") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Web" SortExpression="OrgWeb">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOrgWeb" runat="server" TextMode="MultiLine" Text='<%# Bind("OrgWeb") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOrgWeb" runat="server" Text='<%# Bind("OrgWeb") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Button" Visible="False" 
                            ShowDeleteButton="True" >
                        <ControlStyle CssClass="mybtns vsbtn" />
                        <ItemStyle BorderColor="#669999" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#E0E7FA" />
                    <FooterStyle BackColor="#0D5C83" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
