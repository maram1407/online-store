<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="Online_Store.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <br />
    <br />

    <br /><br /><br />
    <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                        Корзина <span id="CartBadge" runat="server" class="badge">0</span>
    </button>
    <br />
    <div style="padding-top:50px">


    <!--- Success Alert --->
                        <div id="divSuccess" runat="server" class="alert alert-success alert-dismissible fade in h4">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>Успех! </strong>Товар успешно добавлен в корзину. <a href="Cart.aspx">Просмотр корзины</a>
                        </div>

        <div class="col-md-5">
            <div style="max-width:480px" class="thumbnail">
             <%--   for proImage slider--%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
      <li data-target="#carousel-example-generic" data-slide-to="4"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

      <asp:repeater ID="rptrImage" runat="server">
          <ItemTemplate>
    <div class="item <%# GetActiveImg (Container.ItemIndex)%> " >
      <img src="Image/ProductImage/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Image/ImageNotAvailable.jpg'">
      
    </div>
             </ItemTemplate>
    </asp:repeater>s


  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Предыдущий</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Следующий</span>
  </a>
</div>

              <%--  for proimage slider ending--%>
            </div>
        </div>
        <div class="col-md-5">
            <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                <ItemTemplate>
            <div class="divDet1">
                 <h1 class="proNameView" style="font-weight: bold; color: #000000; font-size: large"><%# Eval("PName") %> </h1>
                <span class="proPrice">Цена: <%#Eval("PPrice") %> Руб </span> 
                <br />
            </div>
            <div >
                <h5 class="h5size"> ЦВЕТ</h5>
                <div>
                    <asp:radiobuttonlist ID="rblColor" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Value="Белый" Text="Белый"></asp:ListItem>
                        <asp:ListItem Value="Черный" Text="Черный"></asp:ListItem>
                        <asp:ListItem Value="Коричневый" Text="Коричневый"></asp:ListItem>
                        <asp:ListItem Value="Красный" Text="Красный"></asp:ListItem>
                    </asp:radiobuttonlist>
                </div>
            </div>
            <div class="divDet1">
                <asp:button ID="btnAddtoCart" CssClass="mainButton" runat="server" text="ДОБАВИТЬ В КОРЗИНУ" OnClick="btnAddtoCart_Click"/>
           <asp:Label ID="lblError" CssClass ="text-danger " runat="server" ></asp:Label>
                
            </div>
            <div class="divDet1">
                <h5 class="h5size">Описание</h5>
                <p>   <%#Eval("PDescription") %>          </p>

                
            </div>
           
                    <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PCategoryID") %>' />
                    <asp:HiddenField ID="hfTypeID" runat="server" Value='<%# Eval("PTypeID") %>' />
                   


</ItemTemplate>
</asp:Repeater>

        </div>

    </div>
    
</asp:Content>
