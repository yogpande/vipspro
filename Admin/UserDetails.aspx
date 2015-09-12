<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admaster.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="Admin_UserDetails" %>

<%@ Register Src="~/menus.ascx" TagPrefix="uc1" TagName="menus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/asd.css" rel="stylesheet" />
    <style type="text/css">
        .tbl {
            border: 0px solid white;
        }

            .tbl tr, .tbl tr td, .tbl tr th {
                border: 0px solid white;
            }

                .tbl tr th {
                  
                    text-transform: capitalize;
                    /*box-shadow: 150px 0px 200px #A4DE54;*/
                    
                }

                .tbl tr td {
                    padding-left:30px;
                    box-shadow:inset 10px 10px 10px rgba(164, 222, 84, 0.26);
                    text-align: left;
                    color:#99B98F;
                    text-transform: capitalize;
                }

        .img-pro {
            Width: 180px;
            Height: 180px;
            border-radius: 10px 10px 10px 10px;
            box-shadow: 0px 0px 5px black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menus" runat="Server">
    <uc1:menus runat="server" ID="menus" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="data" runat="Server">
    <div class="contact-form">

        <asp:GridView ID="GridView1" runat="server" CssClass="myGridStyle" PagerStyle-CssClass="paging" AutoGenerateColumns="False" HorizontalAlign="Center">
            <Columns>

                <asp:TemplateField HeaderText="User Detail">
                    <ItemTemplate>                       
                        <div style="width: 90%; height: 490px;">
                            <div style="width: 40%; height: 300px; float: left;">
                                <br />
                                <br />
                                <span>
                                    <label>Profile Photo</label></span>

                                <span>
                                    <asp:Image CssClass="img-pro" ID="Image2" runat="server" ImageUrl='<%#Bind("pic") %>'></asp:Image>
                                </span>

                            </div>
                            <div style="width: 59%; height: auto; float: left;">
                                <br />
                                <br />
                                <table class="tbl" cellpadding="0" cellspacing="0" border="0" >
                                    <tr>
                                        <td>User ID</td>
                                        <td>
                                            <asp:Label ID="Literal1" runat="server" Text='<%#Eval("uid")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Name</td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("fname")+" "+Eval("lname")%>'></asp:Label>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Gender</td>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Bind("gender") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Email ID</td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Bind("email") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Mobile</td>
                                        <td>
                                           <asp:Label ID="Label4" runat="server" Text='<%#Bind("mob") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Address</td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text='<%#Bind("addr") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>State</td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%#Bind("sname") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>City</td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text='<%#Bind("cname") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>Registration Date</td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text='<%#Bind("regdate") %>'></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>User Status</td>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text='<%#Bind("isactive") %>'></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                No Data Found!
            </EmptyDataTemplate>

<PagerStyle CssClass="paging"></PagerStyle>
        </asp:GridView>
        <asp:Button Text="Back To List" PostBackUrl="~/Admin/ManageUsers.aspx" runat="server" />
    </div>
</asp:Content>

