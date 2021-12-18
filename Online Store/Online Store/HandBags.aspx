<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="HandBags.aspx.cs" Inherits="Online_Store.HandBags" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Сумочки</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
             <br />
    <br />
    <br />

            <div class="container">
  <h2>Сумочки</h2>  

    <div class="panel panel-primary" >
      <div class="panel-heading" style="background-color: #CC66FF"></div>
      <div class="panel-body" >
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
