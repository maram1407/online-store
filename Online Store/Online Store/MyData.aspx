<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyData.aspx.cs" Inherits="Online_Store.MyData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /><br /><br /><br />

     
     <div class="panel-heading" style="font-family: Arial; font-size: x-large; font-weight: bold">Мои Данные</div>

    <div class="panel-body">
          <div class="row">
               <div class="col-sm-6">
     <div class="form-group">
                       <label> Имя </label>
                       <asp:TextBox ID="txtSize" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>

                     <div class ="form-group">
                         <label> Пароль</label>
                   <asp:TextBox ID="txtPrice" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
          <div class="form-group">
                  <asp:Button ID="btnUpdateSubCategory" CssClass="btn btn-primary" runat="server" Text="Изменить данные" onclick="btnUpdateSubCategory_Click" />
                  

                  
                  <asp:Button ID="Order" CssClass="btn btn-primary" runat="server" Text="Мои Заказы" onclick="MyOrder_Click" />
                  </div>

         </div>
              </div>
        </div>
</asp:Content>
