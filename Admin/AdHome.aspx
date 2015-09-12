<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admaster.master" AutoEventWireup="true" CodeFile="AdHome.aspx.cs" Inherits="Admin_AdHome" %>

<%@ Register Src="~/menus.ascx" TagPrefix="uc1" TagName="menus" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/asd.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menus" runat="Server">
    <uc1:menus runat="server" ID="menus" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="data" runat="Server">

    <div>
        <div class="col_1_of_4 span_1_of_4">
            <div class="tab-img" style="text-align: center;">
                <div class="chair">
                    <p>
                        <a href="Managejobs.aspx">
                            <img class="img" src="../images/work.png" alt="" align="middle" width="210" height="150">
                            Manage Jobs</a>
                    </p>
                </div>
            </div>

        </div>
        <div class="col_1_of_4 span_1_of_4">
            <div class="tab-img" style="text-align: center;">
                <div class="chair">
                    <p>
                        <a href="#">
                            <img class="img" src="../images/exam.png" alt="" align="middle" width="210" height="150">Manage Exams</a>
                    </p>
                </div>
            </div>

        </div>

        <div class="col_1_of_4 span_1_of_4">
            <div class="tab-img" style="text-align: center;">
                <div class="chair">
                    <p>
                        <a href="ManageUsers.aspx">
                            <img class="img" src="../images/users.png" alt="" align="middle" width="210" height="150">Manage Users</a>
                    </p>
                </div>
            </div>

        </div>
        <div class="col_1_of_4 span_1_of_4">
            <div class="tab-img" style="text-align: center;">
                <div class="chair">
                    <p>
                        <a href="#">
                            <img class="img" src="../images/Results_Icon.png" alt="" align="middle" width="210" height="150">Manage Results</a>
                    </p>
                </div>
            </div>

        </div>
        <div class="col_1_of_4 span_1_of_4">
            <div class="tab-img" style="text-align: center;">
                <div class="chair">
                    <p>
                        <a href="#">
                            <img class="img" src="../images/fees.png" alt="" align="middle" width="210" height="150">
                            Manage Fees</a>
                    </p>
                </div>
            </div>

        </div>
        <div class="col_1_of_4 span_1_of_4">
            <div class="tab-img" style="text-align: center;">
                <div class="chair">
                    <p>
                        <a href="manageinfos.aspx">
                            <img class="img" src="../images/infos.png" alt="" align="middle" width="210" height="150">Manage Infos</a>
                    </p>
                </div>
            </div>

        </div>
       
    </div>
</asp:Content>
