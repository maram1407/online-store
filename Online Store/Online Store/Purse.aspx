<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Purse.aspx.cs" Inherits="Online_Store.Purse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Кошелок</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
             <br />
    <br />
    <br />

            <div class="container">
  <h2>Кошелоки</h2>  

    <div class="panel panel-primary">
      <div class="panel-heading"></div>
      <div class="panel-body">
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
