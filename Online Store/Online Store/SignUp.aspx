<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Online_Store.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Регистрация</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <link href="css/Bag.css" rel="stylesheet" />
   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
                                <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="SignUp.aspx" >Все продукты</a></li >
                                <li>
                              <button id="btnCart" class="btn btn-primary navbar-btn " type="button">
                                Корзина <span class="badge " id="pCount" runat="server"></span>
                               </button>
                               </li>
                               <li class ="active" style="color: #000000; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #000000; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
                               <li>
                          
                              </li>
                          </ul>
                 </div>
            </div>
                
        </div>
          
      </div>
    
        <h2 style=" font-weight: bold; font-size: 41px;height:700px;width :300px;
    
    position :absolute;
    top :-40px;
    bottom :0;
    left :0;
    right :600px;
    margin :auto" >Регистрация</h2>
    
       
        <!---signup page--->
        <div class ="center-page">
            
            <label class="col-xs-12">Логин:</label>
            <div class="col-xs-12">
            <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Введите имя пользователя"></asp:TextBox>
            </div>


            <label class="col-xs-12">Пароль:</label>
            <div class="col-xs-12">
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" placeholder="Введите ваш пароль"></asp:TextBox>
            </div>


            <label class="col-xs-12">Подтверждение пароля::</label>
            <div class="col-xs-12">
            <asp:TextBox ID="txtCPass" runat="server" TextMode="Password" Class="form-control" placeholder="Введите Ваш Подтвержденный пароль"></asp:TextBox>
            </div>

            <label class="col-xs-12">Имя:</label>
            <div class="col-xs-12">
            <asp:TextBox ID="txtName" runat="server" Class="form-control" placeholder="Введите ваше имя"></asp:TextBox>
            </div>


            <label class="col-xs-12">Email:</label>
            <div class="col-xs-12">
            <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Введите адрес электронной почты"></asp:TextBox>
            </div>
            <label class="col-xs-12"></label>
             <div class="col-xs-12">
                 <asp:Button ID="txtsignup" Class="btn btn-success" runat="server" Text="Зарегистрироваться" OnClick="txtsignup_Click" />
            &nbsp;<asp:Label ID="lblMsg" runat="server" ></asp:Label>
            </div>
           </div>
         
        

        <hr />
    <footer class="footer-pos">
            <div class ="container" >
               
               <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                
                <p>&copy;2021 Марам Аль-Саиди </p>
            </div>
               
                
           

        </footer>
        


    
    
    <!---Footer COntents End---->
    <!---Footer COntents End---->
    </form>
</body>
</html>
