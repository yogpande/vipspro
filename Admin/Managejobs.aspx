<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admaster.master" AutoEventWireup="true" CodeFile="Managejobs.aspx.cs" Inherits="Admin_Managejobs" %>

<%@ Register Src="~/menus.ascx" TagPrefix="uc1" TagName="menus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/asd.css" rel="stylesheet" />

    <script>
        function deljob() {
            var v = confirm('Are You Sure Want To Delete These Job?');
            if (v == true) {
                return true;
            }
            else
                return false;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menus" runat="Server">
    <uc1:menus runat="server" ID="menus" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="data" runat="Server">

    <div class="contact-form">
        <h2 style="color: black;">Enter Job Details Here...</h2>
        <hr />
        <asp:Label Text="" ID="lbl" Style="color: red; font-size: 19px;" runat="server" />
        <div>
            <span>
                <label>Job Postion</label></span>
            <span>
                <asp:TextBox runat="server" ID="txtpos" CssClass="textbox" />
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpos" ForeColor="Red" ValidationGroup="z" ErrorMessage="Please Enter Job Position Here..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <span>
                <label>Required Qualification</label></span>
            <span>
                <asp:TextBox runat="server" ID="txtqual" CssClass="textbox" />
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtqual" ForeColor="Red" ValidationGroup="z" ErrorMessage="Please Enter Required Qualification Here..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <span>
                <label>Job Location</label></span>
            <span>
                <asp:TextBox runat="server" ID="txtloc" CssClass="textbox" />
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtloc" ForeColor="Red" ValidationGroup="z" ErrorMessage="Please Enter Job Location Here..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <span>
                <label>Job Details</label></span>
            <span>
                <asp:TextBox runat="server" ID="txtdet" CssClass="textbox" />
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdet" ForeColor="Red" ValidationGroup="z" ErrorMessage="Please Enter Job Details Here..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <span>
                <label>Salary</label></span>
            <span>
                <asp:TextBox runat="server" ID="txtsal" CssClass="textbox" />
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtsal" ForeColor="Red" ValidationGroup="z" ErrorMessage="Please Enter Salary Here..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <span>
                <label>Job Status</label></span>
            <span>

                <asp:DropDownList ID="drpStatus" runat="server" Style="padding: 8px; display: block; width: 100%; background: #fcfcfc; border: none; outline: none; color: #773702; font-size: 1em; font-family: Arial, Helvetica, sans-serif; box-shadow: inset 0px 0px 3px #999; -webkit-box-shadow: inset 0px 0px 3px #999; -moz-box-shadow: inset 0px 0px 3px #999; -o-box-shadow: inset 0px 0px 3px #999; -webkit-appearance: none;">
                    <asp:ListItem>Select Status</asp:ListItem>
                    <asp:ListItem>Visible</asp:ListItem>
                    <asp:ListItem>Invisible</asp:ListItem>
                </asp:DropDownList>
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="drpStatus" InitialValue="Select Status" ForeColor="Red" ValidationGroup="z" ErrorMessage="Please Select Job Status Here..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <asp:Button Text="Add Job" runat="server" ID="btnAdd" Style="margin-right: 10%;" ValidationGroup="z" OnClick="btnAdd_Click" />
            <asp:Button Text="Update Job" runat="server" ID="Button1" Style="margin-right: 10%;" OnClick="Button1_Click" Visible="false"/>
            <asp:Button Text="Reset" runat="server" ID="btnreset" OnClick="btnreset_Click" />
        </div>
        <br />
        <br />

      <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <asp:Label Text="" ID="lbl1" Style="color: red; font-size: 19px;" runat="server" />
                <asp:GridView ID="GridView1" DataKeyNames="jid" runat="server" CssClass="myGridStyle"  PagerStyle-CssClass="paging" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" HorizontalAlign="Center" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%#Container.DataItemIndex + 1%>'>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position">
                            <%--<EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("jpostion")%>'></asp:TextBox>
                    </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%#Bind("jpostion")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Location">
                            <%--  <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("jlocation")%>'></asp:TextBox>
                    </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%#Bind("jlocation")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Details">
                            <%--  <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%#Bind("jdetails")%>'></asp:TextBox>
                    </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%#Bind("jdetails")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Qualification">
                            <%-- <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%#Bind("jqual")%>'></asp:TextBox>
                    </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%#Bind("jqual")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Salary">
                            <%--  <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%#Bind("sal")%>'></asp:TextBox>
                    </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%#Bind("sal")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <%-- <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Bind("jstatus")%>'></asp:TextBox>
                    </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%#Bind("jstatus")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowSelectButton="True" />

                        <asp:TemplateField >
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" OnClientClick="return deljob();" runat="server" CommandName="delete">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <EmptyDataTemplate>
                        No Jobs Available....
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />

                    <PagerSettings Mode="NumericFirstLast" />


                    <PagerStyle CssClass="paging"></PagerStyle>


                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
       <%--     </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>

