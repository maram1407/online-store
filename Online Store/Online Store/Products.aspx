<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Online_Store.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>продукт</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <br />
    <br />
    <div class="row">
      <div class="col-md-12">
          <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                       Корзина <span id="CartBadge" runat="server" class="badge"> 0 </span>
                    </button>
                    <h3 >
                        <asp:Label ID="Label1"   runat="server" Text=" Отображение всех продуктов"></asp:Label>
                    </h3>
                    <hr />
                    
      </div>
    </div>
     
      <div class="panel-body">

      <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" 
              placeholder=" Поиск товар...." AutoPostBack="true" 
              ontextchanged="txtFilterGrid1Record_TextChanged" ></asp:TextBox>

    
      <hr />

       <asp:repeater ID="rptrProducts" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3"  >
            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
          <div class="thumbnail" >              
              <img  src="Image/ProductImage/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"  width="70%" />
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



    <%--second product--%>

</asp:Content>
