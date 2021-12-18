<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="Online_Store.MyOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>--%>
    <link href="css/Bag.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:HiddenField ID="hdCartAmount" runat="server" />
    <asp:HiddenField ID="hdPidColorID" runat="server" />
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="container">
                <br />
                <br />
                   <%-- <button id="btnCart2" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnCart2_ServerClick" type="button">
                       Корзина <span id="CartBadge" runat="server" class="badge">0</span>
                    </button>--%>
                    <div style="padding-top: 50px">
                        <div class="col-md-9">
                            <h4 class="proNameViewCart" runat="server" id="h4NoItems"></h4>
                            <div id="divQtyError" runat="server" class="alert alert-success alert-dismissible fade in h4">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close"> &times;</a>
                                <strong>Ой! </strong>Количество не может быть меньше 1.
                            </div>
                            <asp:Repeater ID="RptrCartProducts" OnItemCommand="RptrCartProducts_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <%--Show cart details start--%>
                                    <div class="media" style="border: 1px solid black;">
                                        <div class="media-left">
                                            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" target="_blank">
                                                <img class="media-object" width="100px" src="Image/ProductImage/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Image/Noimg.png'" />
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading proNameViewCart"><%# Eval("Products") %></h4>
                                             
                                            <span class="proPrice">Цена.&nbsp <%# Eval("PPrice") %></span> <br />
                                            
                                           <p class="proPrice" style="color: #FF00FF">Количество.&nbsp <%# Eval("Quantity") %> </p>

                                          

                                            
                                           <%-- <div class="pull-right form-inline">
                                                <asp:Label ID="lblQty" runat="server" Text="Qty:" Font-Size="Large"></asp:Label>
                                                <asp:Button ID="BtnMinus" CommandArgument='<%# Eval("PID") %>' CommandName="DoMinus" Font-Size="Large" runat="server" Text="-" />&nbsp
                                    <asp:TextBox ID="txtQty" runat="server" Width="40" Font-Size="Large" TextMode="SingleLine" Style="text-align: center" Text='<%# Eval("Qty") %>'></asp:TextBox>&nbsp
                                     <asp:Button ID="BtnPlus" CommandArgument='<%# Eval("PID") %>' CommandName="DoPlus" runat="server" Text="+" Font-Size="Large" />&nbsp&nbsp&nbsp                                          
                                            </div>--%>
                                           
                                            <p>
                                                <%--<asp:Button CommandArgument='<%#Eval("CartID") %>' CommandName="RemoveThisCart" ID="btnRemoveCart" CssClass="RemoveButton1" runat="server" Text="Удалить" />--%>
                                                
                                                <span class="proNameViewCart pull-right">Итог: &nbsp <%# Eval("SubPAmount") %> Руб</span>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%--Show cart details Ending--%>
                        </div>

                        <%--<div class="col-md-3" runat="server" id="divAmountSect">
                            <div>
                                <h5 class=" proNameViewCart">Детали цены</h5>
                                <div>
                                    <label class=" ">Итого</label>
                                    <span class="pull-right priceGray" runat="server" id="spanCartTotal"></span>
                                </div>
                                
                                    <div>
                                        <asp:Button ID="btnBuyNow"  CssClass="buyNowbtn" runat="server" OnClick="btnBuyNow_Click" Text="формирования заказа" />
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
