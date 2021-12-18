<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Online_Store.Index" %>

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
    <script type="text/javascript">
   
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
                        
                                <li style="color: #000000; font-family: Arial"><a style="color: #000000; font-family: Arial" href="Index.aspx">Главная</a> </li>
                                <li style="color: #000000; font-family: Arial"><a style="color: #000000; font-family: Arial" href="About.aspx">О компании</a> </li>
                       
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="Cataloge.aspx" >Каталог</a></li >
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="Products.aspx" >Все продукты</a></li >
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="MyData.aspx" >Личный Кабинет</a></li >
                                <li>
                              <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Корзина <span class="badge " id="pCount" runat="server"></span>
                               </button>
                               </li>
                               <li style="color: #000000; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #000000; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li style="color: #000000; font-family: Arial" id="btnSignIN" runat="server"><a style="color: #000000; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
                               <li>
                            <asp:Button ID="btnlogout" CssClass="btn btn-defult navbar-btn " runat="server"
                                  Text="Sign Out" OnClick="btnlogout_Click" />
                              </li>
                                 <li>
                        <asp:Button ID="Button1" CssClass ="btn btn-link navbar-btn " runat="server" Text=""  />
                        </li>
                          </ul>
                 </div>
            </div>
        </div>
             <br />
             <br />
             <br />
      <!---image slider---->
          <!---image slider---->
        <div class="container">
            
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="ImgSlider/2.jfif"  style="width: 100%;">
                        
                    </div>
                    <div class="item">
                        <img src="ImgSlider/11.png"  style="width: 100%; height:64ex;">
                        
                    </div>
                    <div class="item">
                        <img src="ImgSlider/4.jpg"  style="width: 100%; height:64ex;">
                        
                    </div>
                </div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left">
                </span><span class="sr-only">Previous</span> </a><a class="right carousel-control"
                    href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                    </span><span class="sr-only">Next</span> </a>
            </div>
        </div>
        <!---image slider End---->
   
       
            
       
      <br />
             <br />
             <br />
            <div class="container center ">
        <div class="row ">
            
            <div class="col-lg-4">
                <img src="icons/man.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown"  style="color: #0000FF; font-family: Arial"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Мужчинам <b
                    class="caret"></b>
                   
                     <ul class="dropdown-menu" style="text-align:center; background-color: #99CCFF;" >
                                <li style="float:none; text-align:center; " ><a href="BusinessBag.aspx">Деловые Сумки</a></li>
                                
                                <li style="float:none; text-align:center; " ><a href="ManPants.aspx">Клачи</a></li>
                                
                           </ul>
                </h2>
               
            </div>
            <div class="col-lg-4">
                 <img src="icons/women.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial"><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #FF00FF"> Женщинам <b
                    class="caret"></b>
                    <ul class="dropdown-menu" style="text-align:center; background-color: #FFCCFF;" >
                                <li style="float:none; text-align:center; " ><a href="Products.aspx">Классические Сумки</a></li>
                                <li style="float:none; text-align:center; "  ><a href="ManShirt.aspx">Рюкзаки</a></li>
                               
                                
                           </ul>
                   </h2>
                
            </div>
            <div class="col-lg-4">
                 <img src="icons/kid.jfif" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial"><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #000000">  Детям <b
                    class="caret"></b>
                    <ul class="dropdown-menu" style="text-align:center; background-color: #CCCCFF;" >
                                <li style="float:none; text-align:center; " ><a href="Products.aspx">Детские сумочки</a></li>
                                <li style="float:none; text-align:center; "  ><a href="ManShirt.aspx">Школьный ассортимент</a></li>
                                
                                
                           </ul>
                   </h2>
               
            </div>
          </div>

     </div>
    </div>
             <div class="panel panel-primary">
            <div class="panel-heading">
               </div>
            <div class="panel-body"  >
                <div class="row" style="padding-top: 50px ">
                    <asp:Repeater ID="rptrProducts" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-3 col-md-3"  style="width:20% ">
                                <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration: none;">
                                    <div class="thumbnail" >
                                        <img src="Image/ProductImage/<%# Eval("PID")  %>/<%# Eval("ImageName") %><%# Eval("Extention") %>"
                                            alt="<%# Eval("ImageName") %>" width="50%"  />
                                        <div class="caption">
                                           
                                            <div class="proNameView">
                                                <%# Eval ("PName") %>
                                            </div>
                                            <hr />
                                            <div class="proPrice">
                                                <span class="proPrice">
                                                    <%# Eval ("PPrice") %>
                                                </span>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            </div>
        <br />
         <br />
         <br />
         <br />
         <br />
        
         <br />
         <br />
        <hr />
    <footer>
            <div class ="container" >
               
               <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                
                <p>&copy;2021 Марам Аль-Саиди </p>
            </div>
               
                
           

        </footer>
    <!---Footer COntents End---->
    </form>
</body>
</html>

