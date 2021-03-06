﻿<%@ Page Language="C#" Title="Test Request Entry" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="TestRequestEntryUI.aspx.cs" Inherits="Diagnostic_Application.View.TestRequestEntryUI" %>


<asp:Content ID="ContentTestRequestEntry" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" class="form-horizontal" runat="server">
        <h3>Test Request Entry</h3>
        <asp:Label ID="InfoMessageLabel" CssClass="infoMessage" runat="server" Visible="false" Text=""></asp:Label>
        <div class="col-lg-9">
            <!-- type setup -->
            <div class="type-setup">
                <div class="form-group">
                    <asp:Label ID="TestNameLabel" runat="server" CssClass="col-sm-5 control-label" Text="Name of the Patient"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="PatientNameTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-sm-5 control-label" Text="Date Of Birth"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="DateOfBirthTextBox" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-sm-5 control-label" Text="Mobile No"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="MobileNoTextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-sm-5 control-label" Text="Select Test"></asp:Label>
                    <div class="col-sm-7">
                        <asp:DropDownList ID="TestNameDropDownList" CssClass="form-control" AutoPostBack="True" runat="server" OnSelectedIndexChanged="TestNameDropDownList_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>

                
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-sm-7 control-label bold-label" Text="Fee"></asp:Label>
                    <div class="col-sm-5">
                        <asp:TextBox ID="FeeTextBox" Enabled="False" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="TestSetupIDHiddenrField" runat="server" />
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <asp:Button ID="AddButton" runat="server" CssClass="btn btn-primary right" Text="Add" OnClick="AddButton_Click" />
                    </div>
                </div>
            </div>
            <!-- type setup -->
        </div>
        
        
        <div>
            <asp:GridView 
                    ID="TestEntryGridView" 
                    CssClass="table table-bordered custom-table" 
                    HorizontalAlign="Center" 
                    runat="server" 
                    AutoGenerateColumns="False" 
                    EmptyDataText="No data available." 
                    BackColor="White" 
                    BorderColor="#CC9966" 
                    BorderStyle="None" 
                    BorderWidth="1px" 
                    CellPadding="3" 
                    ShowFooter="True" OnRowDataBound="TestWiseReportGridView_RowDataBound">
                    
                    <Columns>
                        <asp:TemplateField HeaderText="SL">
                            <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Test Name" DataField="Test" />
                        <asp:BoundField HeaderText="Total Test" DataField="Fee" />
                        <asp:TemplateField>
                            
                            <ItemTemplate>
                               
                                <asp:Label ID="testTypeIdLabel" runat="server" Visible="False" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle CssClass="GridHeaderCol2" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#008B8B" Font-Bold="True" ForeColor="#663399" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#008B8B" Font-Bold="True" ForeColor="#000000" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            </div>

        
        


        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-9">
                <asp:Button ID="SaveButton" runat="server" CssClass="btn btn-primary right" Text="Save" OnClick="SaveButton_Click" />
            </div>
        </div>
        
    </form>
</asp:Content>
