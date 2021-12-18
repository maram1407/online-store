<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cataloge.aspx.cs" Inherits="Online_Store.Cataloge" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Каталог</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
             <br />
             <br />
    <br />
             <br />

             <div class="container center ">
        <div class="row ">
            
            <div class="col-lg-4">
                <img src="icons/man.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown"  style="color: #0000FF; font-family: Arial"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Мужчинам </a>
                </h2>


     
            </div>
            <div class="col-lg-4">
                 <img src="icons/women.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial ; color: #FF00FF"> Женщинам 
                   </h2>
                
            </div>
             <div class="col-lg-4">
                 <img src="icons/kid.jfif" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial ; color: #000000">  Детям 
                    
                   </h2>
               
            </div>

             <div class="col-lg-4">
                <img src="icons/деловы.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown"  style="color: #0000FF; font-family: Arial"> <a href="BusinessBag.aspx" > Деловые  </a>
                </h2>
     
            </div>

             <div class="col-lg-4">
                 <img src="icons/класс.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial"><a href="ClassicalBags.aspx" style=" color: #FF00FF" > Классические </a>
                   </h2>
                
            </div>

             <div class="col-lg-4">
                 <img src="icons/сумч.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial ; color: #000000"><a href="HandBags.aspx" style=" color: #000000" >   Сумочки </a>
                    
                   </h2>
               
            </div>

             <div class="col-lg-4">
                <img src="icons/клач.png" alt="thumb" width="140" height="140" />
                <h2 class="drodown"  style="color: #0000FF; font-family: Arial"> <a href="Purse.aspx" > Клачи </a>
                </h2>


     
            </div>

            <div class="col-lg-4">
                 <img src="icons/рюкз.jpg" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial"><a href="Backpacks.aspx" style=" color: #FF00FF"> Рюкзаки </a>
                   </h2>
                
            </div>

             <div class="col-lg-4">
                 <img src="icons/школ.jpeg" alt="thumb" width="140" height="140" />
                <h2 class="drodown" style="font-family: Arial ; color: #000000"><a href="SchoolBags.aspx"  style=" color: #000000">  Школьные</a>
                    
                   </h2>
               
            </div>
          
        
        </div>

     </div>
</asp:Content>
