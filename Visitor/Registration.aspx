<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Visitor_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vip`s Pro</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="header-about">
            <div class="header-top">
                <div class="wrap">
                    <div class="top-nav">
                        <ul>
                            <li><a href="Home.aspx">Home</a></li>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="wrap">
                    <div class="logo">
                        <a href="index.html">
                            <img src="../images/logo.png" alt="" /></a>
                    </div>

                    <div class="clear"></div>

                </div>
            </div>
        </div>
        <div class="content-top">
            <div class="wrap">
                <div class="section group">
                    <div class="col span_2_of_contact">
                        <div class="contact-form">
                            <h3>Register Here...</h3>
                            <hr />
                            <asp:Label Text="" ID="lbl" Style="color: red; font-size: 19px;" runat="server" />
                            <br />
                            <div>
                                <span>
                                    <label>First Name</label></span>
                                <span>
                                    <asp:TextBox ID="txtfname" runat="server"></asp:TextBox></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtfname" runat="server" ErrorMessage="please enter first name here"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>Last Name</label></span>
                                <span>
                                    <asp:TextBox ID="txtlname" runat="server"></asp:TextBox></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtlname" runat="server" ErrorMessage="please enter last name here"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>Gender</label></span>
                                <span>
                                    <asp:RadioButtonList ID="rdoGen" runat="server" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="10">
                                        <asp:ListItem Selected="True">Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList>
                                </span>
                            </div>

                            <div>
                                <span>
                                    <label>Email Id</label></span>
                                <span>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtemail" runat="server" OnTextChanged="txtemail_TextChanged" AutoPostBack="true"></asp:TextBox>
                                            <h2 style="color: red;">
                                                <asp:Literal ID="Literal1" runat="server"></asp:Literal></h2>
                                            </span>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ForeColor="Red" ControlToValidate="txtemail" runat="server" ErrorMessage="please enter email here"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="Red" ErrorMessage="please enter correct email id" ControlToValidate="txtemail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </span>
                            </div>

                            <div>
                                <span>
                                    <label>Password</label></span>
                                <span>
                                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password"></asp:TextBox></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="txtpass" runat="server" ErrorMessage="please enter password here"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>Mobile</label></span>
                                <span>
                                    <asp:TextBox ID="txtmob" runat="server"></asp:TextBox></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ControlToValidate="txtmob" runat="server" ErrorMessage="please enter mobile number here"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <label>Address</label></span>
                                <span>
                                    <asp:TextBox ID="txtadd" runat="server"></asp:TextBox></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" ControlToValidate="txtadd" runat="server" ErrorMessage="please enter address here"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>


                                    <div>
                                        <span>
                                            <label>Select State</label></span>
                                        <span>
                                            <asp:DropDownList ID="drpState" AutoPostBack="true" runat="server" OnSelectedIndexChanged="drpState_SelectedIndexChanged" Style="padding: 8px; display: block; width: 100%; background: #fcfcfc; border: none; outline: none; color: #464646; font-size: 1em; font-family: Arial, Helvetica, sans-serif; box-shadow: inset 0px 0px 3px #999; -webkit-box-shadow: inset 0px 0px 3px #999; -moz-box-shadow: inset 0px 0px 3px #999; -o-box-shadow: inset 0px 0px 3px #999; -webkit-appearance: none;">
                                            </asp:DropDownList>
                                        </span>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" ControlToValidate="drpState" InitialValue="Select State" runat="server" ErrorMessage="please select state here"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                    <div>
                                        <span>
                                            <label>Select City</label></span>
                                        <span>
                                            <asp:DropDownList ID="drpCity" runat="server" Style="padding: 8px; display: block; width: 100%; background: #fcfcfc; border: none; outline: none; color: #464646; font-size: 1em; font-family: Arial, Helvetica, sans-serif; box-shadow: inset 0px 0px 3px #999; -webkit-box-shadow: inset 0px 0px 3px #999; -moz-box-shadow: inset 0px 0px 3px #999; -o-box-shadow: inset 0px 0px 3px #999; -webkit-appearance: none;">
                                            </asp:DropDownList>
                                        </span>
                                        <span>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" ControlToValidate="drpCity" InitialValue="Select City" runat="server" ErrorMessage="please select city here"></asp:RequiredFieldValidator>
                                        </span>
                                    </div>
                                </ContentTemplate>

                            </asp:UpdatePanel>
                            <div>
                                <span>
                                    <label>Upload Photo</label></span>
                                <span>
                                    <asp:FileUpload ID="FileUpload1" runat="server" /></span>
                                <span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" ControlToValidate="FileUpload1" runat="server" ErrorMessage="please upload your photo here"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                            <div>
                                <span>
                                    <asp:Button ID="Button1" runat="server" Text="Register Me..." OnClick="Button1_Click" /></span>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="wrap">
                <div class="copy">
                    <p>© 2015-2016 All rights Reserved | Design by <a href="#">Yug Webs Pvt. Ltd.</a></p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
