﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Backpacks.aspx.cs" Inherits="Online_Store.Backpacks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Рюкзаки</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
             <br />
    <br />
    <br />

            <div class="container">
  <h2>Рюкзаки</h2>  

    <div class="panel panel-primary" >
      <div class="panel-heading" style="background-color: #FF00FF"></div>
      <div class="panel-body" >
          <asp:Label ID="Label1" Class ="col-xs-3 control-label " runat="server" Text=""  ></asp:Label>
           <asp:repeater ID="rptrProducts" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3" >
            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
          <div class="thumbnail" >              
              <img src="Image/ProductImage/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"/>
              <div class="caption"> 
                  
                   <div class="proNameView"> <%# Eval ("PName") %> </div>
                  <hr />
                   <div class="proPrice">  <%# Eval ("PPrice") %> Руб</div> 
                   
              </div>
          </div>
                </a>
        </div>
               
               </ItemTemplate>
       </asp:repeater>
          </div>
        </div>
        </div>
</asp:Content>
