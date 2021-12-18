<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Online_Store.About1" %>

<!DOCTYPE html>
<script runat="server">


</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Интернет Магазин Сумок</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <link href="css/Bag.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style type="text/css">
         .auto-style2 {
             width: 45%;
             height: 403px;
         }
         .auto-style3 {
             height: 56px;
         }
         .auto-style4 {
             width: 45%;
             height: 151px;
         }
         .auto-style5 {
             height: 55px;
         }
     </style>
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
                        
                                <li style="color: #000000; font-family: Arial"><a style="color: #000000; font-family: Arial" href="Index.aspx">Главная</a> </li>
                                <li style="color: #000000; font-family: Arial"><a style="color: #000000; font-family: Arial" href="About.aspx">О компании</a> </li>
                       
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="Cataloge.aspx" >Каталог</a></li >
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="Products.aspx" >Все продукты</a></li >
                                <li>
                              <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Корзина <span class="badge " id="pCount" runat="server"></span>
                               </button>
                               </li>
                               <li style="color: #000000; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #000000; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li style="color: #000000; font-family: Arial" id="btnSignIN" runat="server"><a style="color: #000000; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
                               <li>
                           <%-- <asp:Button ID="btnlogout" CssClass="btn btn-defult navbar-btn " runat="server"
                                  Text="Sign Out" OnClick="btnlogout_Click" />--%>
                              </li>
                          </ul>
                 </div>
            </div>
        </div>
             <br />
             <br />
             <br />
        </div>

       <%-- <div style="font-family: Arial; font-size: xx-large; font-weight: bold ; text-align:center">
            <h1>О компании</h1>
        </div>

        <div class="panel-heading" style="font-family: Arial; font-size: large; font-weight: bold; background-color: #3366CC;">
            <h1>Наша компания сегодня это:</h1>
        </div>

        <div> 
            <p>Более 270 магазинов «Империя Сумок» в более чем 90 городах России;
Запуск on-line продаж в интернет - магазине "Империя Сумок" в 2017 году.
Перспективы открытия более двухсот пунктов самовывоза по всей России;
Бренды Francesco Molinary, Poshete, Marzia, Grott, Ecotope, Ecotope Kids, Rain Berry, Mr.Bag, Passo Avanti, полюбившиеся миллионам россиян;
В первую очередь – качество предлагаемой продукции и клиентоориентированность нашего бизнеса;
Многие годы работы на розничном рынке;
Имя, известное тысячам и тысячам партнеров в России и за ее пределами.</p>
        </div>--%>
    </form>
    <br />
    <br />
    <table class="auto-style2" align="center">
        <tr>
            <td style="font-family: Arial; font-size: xx-large; font-weight: bold ; text-align:center">О компании</td>
        </tr>
        <tr>
            <td style="font-family: Arial; font-size: large; background-color: #C0C0C0 " class="auto-style5"  >&nbsp;&nbsp; Наша компания сегодня это:</td>
        </tr>
        <tr >
            <td >
                <br />
                -
                Более 270 магазинов «Империя Сумок» в более чем 90 городах России;<br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                -
                Запуск on-line продаж в интернет - магазине "Империя Сумок" в 2017 году.<br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                -
                Перспективы открытия более двухсот пунктов самовывоза по всей России;<br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                -
                В первую очередь – качество предлагаемой продукции и клиентоориентированность нашего бизнеса;<br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                -
                Многие годы работы на розничном рынке;<br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                -
                Имя, известное тысячам и тысячам партнеров в России и за ее пределами.<br />
            </td>
        </tr>
       
    </table>

    <br />
    <br />
    <table class="auto-style4" align="center">
       
        <tr>
            <td style="font-family: Arial; font-size: large; background-color: #C0C0C0 " class="auto-style3"  >&nbsp;&nbsp; Наша сеть:</td>
        </tr>
        <tr >
            <td >
                
               Мы знаем: будущее России – в развитии ее регионов. Не случайно в 2004 году свой первый магазин мы открыли не в Москве или Санкт-Петербурге, 
                а в Самаре. А старт on-line продаж в 2017 году начался с городов Челябинск, Екатеринбург и Магнитогорск.
            </td>
        </tr>
        
            </table>
     <hr />     
    <footer >
            <div class ="container" >
               
               <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                
                <p>&copy;2021 Марам Аль-Саиди </p>
            </div>
               
                
           

        </footer>
</body>

    
</html>
