<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admaster.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>

<%@ Register Src="~/menus.ascx" TagPrefix="uc1" TagName="menus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/asd.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menus" Runat="Server">
    <uc1:menus runat="server" ID="menus" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="data" Runat="Server">
    <div class="contact-form">
         <h2 style="color: black;">User Details...</h2>
        <hr />
        <center>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <asp:Label Text="" ID="lbl1" Style="color: red; font-size: 19px;" runat="server" />
        <asp:GridView ID="GridView1" DataKeyNames="uid" runat="server" CssClass="myGridStyle" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" PagerStyle-CssClass="paging" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" HorizontalAlign="Center" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                      <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("fname")+" "+Eval("lname")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                  
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mobile">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Bind("mob") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Photo">
                    <ItemTemplate>
                       <asp:Image ID="Image1" runat="server" ImageUrl='<%#Bind("pic") %>' Width="80" Height="80"></asp:Image>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField SelectText="Get More Detail!" ShowSelectButton="True" />
            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <EmptyDataTemplate>
                No Users Available....
            </EmptyDataTemplate>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            
            <PagerSettings Mode="NumericFirstLast" />
           
           
            <PagerStyle CssClass="paging" />
           
           
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
           
           
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>


            </ContentTemplate>
        </asp:UpdatePanel></center>
    </div>
    
</asp:Content>

