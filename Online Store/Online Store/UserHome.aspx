<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="Online_Store.UserHome" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Home</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Bag.css" rel="stylesheet" />
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <script>

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "Cart.aspx";
            });
        });

     </script>
</head>
<body>
    <form id="form1" runat="server">
        <div >
            <div class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #FF00FF">
             <div class="container " style="background-color: #FF00FF">
                <div class="navbar-header" style="background-color: #FF00FF">
                    <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Index.aspx" style="color: #000000; font-family: Arial; font-size: small;"><span>
                        <img src="icons/icon.png"  height="30" /></span>Интернет Магазин
                    </a>
                  </div>
                        <div class="navbar-collapse collapse" style="background-color: #FF00FF; ">
                            <ul class="nav navbar-nav navbar-right" style="color: #000000; font-family: Arial" >
                        
                                <li style="color: #000000; font-family: Arial"><a style="color: #000000; font-family: Arial" href="UserHome.aspx">Главная</a> </li>
                                <li style="color: #000000; font-family: Arial"><a style="color: #000000; font-family: Arial" href="About.aspx">О компании</a> </li>
                       
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="Cataloge.aspx" >Каталог</a></li >
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="Products.aspx" >Все продукты</a></li >
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="MyData.aspx" >Личный Кабинет</a></li >
                                <li>
                              <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Корзина <span class="badge " id="pCount" runat="server"></span>
                               </button>
                               </li>

                                 <li  style="color: #000000; font-family: Arial" >

                            <asp:Button ID="btnLogin" CssClass ="btn btn-default navbar-btn " runat="server" Text="Вход" OnClick="btnLogin_Click" />
                            <asp:Button ID="btnlogout" CssClass ="btn btn-default navbar-btn " runat="server" Text="Выход" OnClick="btnlogout_Click" />
                            
                        </li>
                               
                               
                          <li>
                        <asp:Button ID="Button1" CssClass ="btn btn-link navbar-btn " runat="server" Text=""  />
                        </li>
                             
                          </ul>
                 </div>
            </div>
                
        </div>
          
      </div >
         <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label  ID="lblSuccess" runat="server"   style="font-size:40px ;color: #000000; text-align: center
   "></asp:Label>
         <hr />     
    <footer >
            <div class ="container" >
               
               <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                
                <p>&copy;2021 Марам Аль-Саиди </p>
            </div>
               
                
           

        </footer>
    
    </form>
</body>
</html>
