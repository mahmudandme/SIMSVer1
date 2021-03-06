﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="AddStudentSession.aspx.cs" Inherits="SIMS.UI.Admin.AddStudentSession" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .grid th{
        text-align: center;        
    }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h3 class="page-header">Add New Session</h3>
                        
     <div class="row placeholders">
    <div class="col-xs-6 col-sm-3 col-md-4 placeholder">
         
  
       
  
        
     <div class="form-group">
    <label for="inputdefault" style="float: left">Session</label><br/>
         <asp:TextBox ID="sessionValueTextBox" CssClass="form-control" runat="server"></asp:TextBox>
  </div>
        <div class="myButtonClass">
           
            <asp:Button ID="saveSessionButton" CssClass="btn btn-primary pull-right" runat="server" Text="Save" OnClick="saveSessionButton_Click"/>
  
        </div>
       

  </div>
     </div> 
       
        <div class="row placeholders">
 <div class="col-xs-6 col-sm-3 col-md-7 placeholder">        
     <span class="label label-success" style="float: left;font-size: 20px;position:relative" id="successStatusLabel" runat="server"></span>  
     <span class="label label-warning" style="float: left;font-size: 20px;position:relative" id="failStatusLabel" runat="server"></span>       
  </div>
     </div>                                          
  <div class="row placeholders">
 <div class="col-xs-6 col-sm-3 col-md-7 placeholder">        
     <asp:GridView ID="sessionGridView" CssClass="table table-responsive grid" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" AutoGenerateColumns="False">
         <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
         <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
         <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
         <RowStyle BackColor="White" ForeColor="#003399" />
         <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
         <SortedAscendingCellStyle BackColor="#EDF6F6" />
         <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
         <SortedDescendingCellStyle BackColor="#D6DFDF" />
         <SortedDescendingHeaderStyle BackColor="#002876" />
         <Columns>
             <asp:TemplateField HeaderText="Serial">
                 <ItemTemplate>
                     <%#Container.DataItemIndex+1 %>
                 </ItemTemplate>
             </asp:TemplateField>
             <asp:BoundField HeaderText="Session value" DataField="SessionValue"/>
             
         </Columns>
     </asp:GridView>         
  </div>
     </div>        
        </div>  

</asp:Content>
