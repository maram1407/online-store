<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Karta.aspx.cs" Inherits="Online_Store.Karta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Bag.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hdCartAmount" runat="server" />
   

    <br />
     <br />
    <br />
    <br />
    <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                       Корзина <span id="CartBadge" runat="server" class="badge">0</span>
                    </button>
    
    <div class="row" style="padding-top: 20px;">
     <div class="col-sm-12">
             <div class="form-horizontal">
               
                 <img src="icons\karta.png"  style="position: relative; top : 35px; left: 700px;
    text-align: center; padding-bottom: 50px;"   /> 
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server"   class ="col-xs-1 control-label" Text="Card Number"></asp:Label>
                    <div class ="col-md-6 ">


                        <asp:TextBox ID="txtName1" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="Это поле обязательно к заполнению !" ControlToValidate="txtName1"></asp:RequiredFieldValidator>
               
                        </div>

              </div>
                
                          
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server"  class ="col-xs-2 control-label" Text="Data"></asp:Label>
                     
                    <div class ="col-xs-2 ">
                    <asp:TextBox ID="txtAddress1"  CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Это поле обязательно к заполнению !" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                
                        </div>
                   <asp:Label ID="Label2" runat="server"  class ="col-xs-1 control-label" Text="CVV"></asp:Label>
                    <div class ="col-xs-2 ">
                    <asp:TextBox ID="txtMobileNumber1"  CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Это поле обязательно к заполнению !" ControlToValidate="txtMobileNumber1"></asp:RequiredFieldValidator>
                
                    </div>
                    </div>
         
                

          <div class="form-group">
                    <asp:Label ID="Label3" runat="server"   class ="col-xs-1 control-label" Text="Имя"></asp:Label>
                    <div class ="col-xs-9 ">

                        <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Это поле обязательно к заполнению !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </div>
              </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server"  class ="col-xs-1 control-label" Text="Адрес"></asp:Label>
                    <div class ="col-xs-9 ">
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine"  CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="Это поле обязательно к заполнению !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
              
                       </div>
            </div>              
         <div class="form-group">
                    <asp:Label ID="Label6" runat="server"  class ="col-xs-1 control-label" Text="Номер телефона"></asp:Label>
                    <div class ="col-xs-9 ">
                    <asp:TextBox ID="txtMobileNumber"  CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="Это поле обязательно к заполнению !" ControlToValidate="txtMobileNumber"></asp:RequiredFieldValidator>
                </div>
                    </div>
                 </div>

         <div>
                                <asp:GridView ID="gvProducts" runat="server" CssClass="col-md-12"  AutoGenerateColumns="false" Visible="false" CellPadding="6"
                                    ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <EditRowStyle BackColor="#7C6F57" />
                                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#E3EAEB" />
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    <Columns>
                                        <asp:BoundField DataField="PID" HeaderText="Продукт ID" />
                                        <asp:BoundField DataField="PName" HeaderText="название продукта" />
                                        <asp:BoundField DataField="Qty" HeaderText="Количество" />
                                    </Columns>
                                </asp:GridView>                                
                            </div>
        </div>

     <div class="col-md-6" runat="server" id="divPriceDetails">
             <div >
                <h5 class="proNameViewCart">Детали цены</h5>
                <div>
                    <label>Итого</label>
                    <span class="float-right priceGray" id="spanCartTotal" runat="server"></span>
                </div>
               
            </div>
        </div>
        
         
     <div class="col-md-12">
         <br /> <br /> 
         <div class="tab-content"  style="text-align:center">
                                <div id="PlaceNPay" class="tab-pane fade in active">
                                     <asp:Button ID="btnBuyNow"  CssClass=" btn btn-info" Font-Size="Large" runat="server" OnClick="btnBuyNow_Click" Text="Оплатить"  />
                                   
                                    <asp:Button ID="BtnPlaceNPay" CssClass=" btn btn-info" Font-Size="Large" ValidationGroup="PaymentPage" runat="server" OnClick="BtnPlaceNPay_Click" Text="Проверить &raquo;" />
                                </div>
                               </div>
                
            </div>
    </div>
        
   

    
   
</asp:Content>
