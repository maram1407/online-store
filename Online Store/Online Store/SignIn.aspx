<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Online_Store.SignIn" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Вход</title>
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
                               <li  style="color: #000000; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #000000; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li class ="active" style="color: #000000; font-family: Arial" ><a style="color: #000000; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
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
    margin :auto" >Вход</h2>
    
       
        <!---signin page--->
       <div style="width :300px;
    height :500px;
    position :absolute;
    top :-40px;
    bottom :0;
    left :0;
    right :500px;
    margin :auto ;">
            <div class ="form-horizontal ">
                
                <div class ="form-group" style="font-size: 20px;font-weight: 500;">
                    <asp:Label ID="Label1" Class ="col-xs-3 control-label " runat="server" Text="Логин:" ></asp:Label>
                    <div class ="col-xs-11 ">

                        <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" CssClass ="text-danger " ErrorMessage="*пожалуйста, введите имя пользователя" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class ="form-group" style="font-size: 20px;font-weight: 500;">
                    <asp:Label ID="Label2"  Class ="col-xs-3 control-label " runat="server" Text="Пароль:"></asp:Label>
                    <div class ="col-xs-11 ">

                        <asp:TextBox ID="txtPass" Class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="*поле пароля обязательно" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" CssClass =" control-label " runat="server" Text="Запомнить меня"></asp:Label>
                    </div>
                </div>


                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnLogin" CssClass ="btn btn-success " runat="server" Text="Вход&raquo;" OnClick="btnLogin_Click" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SignUp.aspx">Зарегистрироваться</asp:HyperLink>
                    </div>
                </div>
                
              <%--  for forgot password--%>
                 <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">
                        <asp:HyperLink ID="HyForgotPass" runat="server" NavigateUrl="~/ForgotPassword.aspx">Забыл пароль</asp:HyperLink>
                       
                    </div>
                </div>



                 <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Label ID="lblError" CssClass ="text-danger " runat="server" ></asp:Label>
                    </div>
                </div>


            </div>
            

        </div>
        <!----singin form End--->
        <!----singin form End--->
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
