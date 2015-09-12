<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admaster.master" AutoEventWireup="true" CodeFile="ManageInfos.aspx.cs" Inherits="Admin_ManageInfos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>


<%@ Register Src="~/menus.ascx" TagPrefix="uc1" TagName="menus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/asd.css" rel="stylesheet" />
  <script>
        function addinfo() {
            var v = confirm('Previous Information Removed Permenently....Are sure want to Add???');
            if (v == true) {
                return true;
            }
            else
                return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menus" Runat="Server">
    <uc1:menus runat="server" ID="menus" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="data" Runat="Server">

      <div class="contact-form">
        <h2 style="color: black;">Enter Information Here...</h2>
        <hr />
        <asp:Label Text="" ID="lbl" Style="color: red; font-size: 19px;" runat="server" />
        <div>
            <span>
                <label>Information</label></span>
            <br />
            <span>
                <div style="width:100%; height:300px;">
                <cc1:Editor ID="Editor1" runat="server" />
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Something Here..." ControlToValidate="Editor1" ForeColor="Red" SetFocusOnError="True" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
               
            </span>
        </div>


        <div>
            <asp:Button Text="Add Info" runat="server" ID="btnAdd" OnClientClick="return addinfo();" Style="margin-right: 10%;" OnClick="btnAdd_Click" ValidationGroup="a"/><asp:Button Text="Reset" OnClick="btnreset_Click"
                 runat="server" ID="btnreset" />
        </div>
        <br />
          <br />
         
          <asp:GridView ID="GridView1" style="width:100%; height:auto; border:3px solid black;" runat="server" AutoGenerateColumns="False">
              <Columns>
                  <asp:TemplateField>
                      <ItemTemplate>
                          <div >
                              <asp:Literal ID="Literal1" runat="server" Text='<%#Bind("info") %>'></asp:Literal>
                          </div>
                      </ItemTemplate>
                      
                  </asp:TemplateField>
                  
              </Columns>
              <EmptyDataTemplate>
                  <center><h1>--No Information Avialable--</h1></center>
              </EmptyDataTemplate>
          </asp:GridView>
          </div>
</asp:Content>

