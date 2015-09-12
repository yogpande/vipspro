<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admaster.master" AutoEventWireup="true" CodeFile="ManageCity.aspx.cs" Inherits="Admin_ManageCity" %>

<%@ Register Src="~/menus.ascx" TagPrefix="uc1" TagName="menus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/asd.css" rel="stylesheet" />
     <script>
        function delcity() {
            var v = confirm('Are You Sure Want To Delete These City?');
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
        <h2 style="color: black;">Enter City Here...</h2>
        <hr />
        <asp:Label Text="" ID="lbl" Style="color: red; font-size: 19px;" runat="server" />
        <div>
            <span>
                <label>City Name</label></span>
            <span>
                <asp:TextBox runat="server" ID="txtcname" CssClass="textbox" />
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ValidationGroup="c" ControlToValidate="txtcname" runat="server" ErrorMessage="please enter city name..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <span>
                <label>Select State</label></span>
            <span>
                <asp:DropDownList ID="drpState" runat="server" Style="padding: 8px; display: block; width: 100%; background: #fcfcfc; border: none; outline: none; color: #464646; font-size: 1em; font-family: Arial, Helvetica, sans-serif; box-shadow: inset 0px 0px 3px #999; -webkit-box-shadow: inset 0px 0px 3px #999; -moz-box-shadow: inset 0px 0px 3px #999; -o-box-shadow: inset 0px 0px 3px #999; -webkit-appearance: none;">
                </asp:DropDownList>
            </span>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="c" ControlToValidate="drpState" InitialValue="Select State" runat="server" ErrorMessage="Please Select State..."></asp:RequiredFieldValidator>
            </span>
        </div>

        <div>
            <asp:Button Text="Add City" runat="server" ID="btnAdd" OnClick="btnAdd_Click" ValidationGroup="c" Style="margin-right: 10%;" /><asp:Button Text="Reset" runat="server" ID="btnreset" OnClick="btnreset_Click"/>
        </div>
        <br />
        <br />
        <hr />
        <br />
        <center>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:Label Text="" ID="lbl1" Style="color: red; font-size: 19px;" runat="server" />
        <asp:GridView ID="GridView1" DataKeyNames="cid" runat="server" CssClass="myGridStyle" PagerStyle-CssClass="paging" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" HorizontalAlign="Center" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Container.DataItemIndex+1 %>'>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("cname") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Bind("cname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <EditItemTemplate>
                        <asp:dropdownlist runat="server" ID="drp" Style="padding: 8px; display: block; width: 100%; background: #fcfcfc; border: none; outline: none; color: #464646; font-size: 1em; font-family: Arial, Helvetica, sans-serif; box-shadow: inset 0px 0px 3px #999; -webkit-box-shadow: inset 0px 0px 3px #999; -moz-box-shadow: inset 0px 0px 3px #999; -o-box-shadow: inset 0px 0px 3px #999; -webkit-appearance: none;"></asp:dropdownlist>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Bind("sname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return delcity();" CommandName="delete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <EmptyDataTemplate>
                No City Available....
            </EmptyDataTemplate>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            
            <PagerSettings Mode="NumericFirstLast" />
           
           
            <PagerStyle CssClass="paging" />
           
           
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>


            </ContentTemplate>
        </asp:UpdatePanel></center>
    </div>
    <hr />
</asp:Content>

