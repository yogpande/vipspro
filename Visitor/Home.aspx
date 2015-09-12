<%@ Page Title="" Language="C#" MasterPageFile="~/Visitor/main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Visitor_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="process" runat="Server">
    <div style="width: 100%; height: auto; border: 3px solid black;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div>
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
<asp:Content ID="Content3" ContentPlaceHolderID="left" runat="Server">
    <div class="about-list" style="text-align:justify">
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam a volutpat ante. Pellentesque eget ultrices justo. Nam eget est non massa accumsan dignissim vel quis nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent viverra dolor at varius ullamcorper. Duis convallis nisl ullamcorper, dapibus tellus quis, luctus quam. Vestibulum mattis aliquet fringilla. Sed pharetra risus arcu, at lobortis nisl tincidunt at. Integer lectus turpis, posuere eget cursus a, vehicula sit amet ante. Duis eu ante lobortis, blandit purus vitae, porttitor augue. Vivamus nisl leo, dignissim eu nulla vitae, tincidunt tristique magna. Duis facilisis dolor placerat lacus ultricies, eget bibendum ante laoreet. Duis quis sagittis nunc. Donec et pretium nulla. Fusce nec rutrum nulla.
        </p>
        <p>
            Nam commodo ex in dolor tempor blandit. In velit metus, pharetra sit amet sapien vel, mattis dignissim erat. Integer dignissim, lorem ac mattis elementum, turpis metus scelerisque massa, faucibus molestie lorem lorem id enim. Sed non cursus augue. Nunc suscipit porttitor felis, elementum venenatis ex rutrum a. Pellentesque porttitor facilisis eros, id dapibus ligula condimentum nec. Nullam nec turpis in leo facilisis sollicitudin. In auctor ante pellentesque, mattis erat sed, eleifend nisi. Nam consectetur mattis pellentesque. Aliquam dapibus diam ipsum, ac bibendum nibh vestibulum nec. In posuere nisl vel malesuada sagittis.
        </p>
        
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="right" runat="Server">
    <div class="wrap">
        <div class="section group">
            <div class="col span_2_of_contact">
                <div class="contact-form">
                    <h3 style="color: yellowgreen;">Login Here</h3>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div>
                                <span>
                                    <label>Email Id</label></span>
                                <span>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TextBox1" ForeColor="red" runat="server" ErrorMessage="Please Enter Email Id..." Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="TextBox1" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="Not a Valid Email Id..." Display="Dynamic"></asp:RegularExpressionValidator>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>Password</label></span>
                                <span>
                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></span><span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TextBox2" ForeColor="red" runat="server" ErrorMessage="Please Enter Password..."></asp:RequiredFieldValidator>
                                    </span>
                            </div>
                            <div>
                                <span>
                                    <label>
                                        <asp:Label ID="Label1" runat="server" Visible="false" ForeColor="Red"></asp:Label></label></span>
                            </div>

                            <span>
                                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" /></span>
                            <br />
                            <br />
                            <div>
                                <span>
                                    <a href="Registration.aspx" style="color: yellowgreen; font-size: 18px; font-weight: 400;">Register here to Apply Jobs!</a></span>
                            </div>


                        </ContentTemplate>
                        <%-- <Triggers>
                            <asp:PostBackTrigger ControlID="Button1" />
                        </Triggers>--%>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

