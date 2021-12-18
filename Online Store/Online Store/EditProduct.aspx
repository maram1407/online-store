<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Online_Store.EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
  <h2></h2>  
  <br /><br /><br /><br />
    <div class="panel panel-primary">
      <div class="panel-heading">Редактировать продукты</div>
      <div class="panel-body">
          <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                       <label> Введите ID:</label>
                       <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true"  ontextchanged="txtID_TextChanged"></asp:TextBox>
                  </div>

                  <div class="form-group">
                       <label> Введите Название продукта </label>
                       <asp:TextBox ID="txtSize" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
                     <div class ="form-group">
                         <label> Введите Цена</label>
               
              
                   <asp:TextBox ID="txtPrice" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
        
                 

                  <div class="form-group">
                       <label> Выберите категорию</label>
                        <asp:DropDownList ID="ddlCategory" CssClass ="form-control" runat="server"  AutoPostBack="true" ></asp:DropDownList>
                  </div>

                 

                  <div class="form-group">
                       <label> Выберите тип</label>
                       <asp:DropDownList ID="ddlType" CssClass ="form-control" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                  </div>
                    <div class ="form-group">
                        <label> Цвет</label>
              
                   <asp:CheckBoxList ID="cblColor" CssClass ="form-control" RepeatDirection="Horizontal"  runat="server"></asp:CheckBoxList>
               </div>
          
                    <div class ="form-group">
                        <label> Выберите Количество</label>
               
                   <asp:TextBox ID="txtQuantity" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
         <%-- <div class ="form-group">
               <label> Upload Image</label>
                   <asp:FileUpload ID="fuImg01" CssClass ="form-control" runat="server" />
               </div>
          


                    <div class ="form-group">
                        <label> Upload Image</label>
              
                   <asp:FileUpload ID="fuImg02" CssClass ="form-control" runat="server" />
               </div>
          

           <div class ="form-group">
               <label> Upload Image</label>
                   <asp:FileUpload ID="fuImg03" CssClass ="form-control" runat="server" />
               </div>
          

           <div class ="form-group">
               <label> Upload Image</label>
                   <asp:FileUpload ID="fuImg04" CssClass ="form-control" runat="server" />
               </div>
          



            <div class ="form-group">
               <label> Upload Image</label>
                   <asp:FileUpload ID="fuImg05" CssClass ="form-control" runat="server" />
               </div>
         --%>

                  <div class="form-group">
                  <asp:Button ID="btnUpdateSubCategory" CssClass="btn btn-primary" runat="server" Text="ОБНОВИТЬ" onclick="btnUpdateSubCategory_Click" />
                  </div>

               
               </div>

               <div class="col-sm-6">

                <div class="row">
                <div class="col-md-12">
                <h4 class="alert-info text-center"> Все Продукте</h4>
                <br />
                 <asp:TextBox ID="txtFilterGrid1Record" style="border:2px solid blue" CssClass="form-control" runat="server" placeholder="Поиск...." onkeyup="Search_Gridview(this)"></asp:TextBox>
                <hr />
                   <%--<div class="table table-responsive">
                       <asp:GridView ID="GridView1" CssClass="table table-condensed table-hover" runat="server" EmptyDataText="Record not found...">
                         
                       </asp:GridView>
                   </div>--%>
                    <div class="table table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                    <Columns>  
                        <asp:BoundField DataField="PID" HeaderText="S.No." />  
                        <asp:BoundField DataField="PName" HeaderText="Название продукта" />  
                        <asp:BoundField DataField="PPrice" HeaderText="Цена" />  
                       
                      <asp:BoundField DataField="Type" HeaderText="Тип" />  
                        <asp:BoundField DataField="CatName" HeaderText="Категория" />  
                       

                       
                        <asp:BoundField DataField="ColorName" HeaderText="Цвет" />  
                        <asp:BoundField DataField="Quantity" HeaderText="Количество" />
                        </Columns>

                        </asp:GridView>
                </div>
             </div>
               
               </div>
          
          </div>

      </div>
      <div class="panel-footer">Panel Footer</div>
    </div>
    
</div>




<script type="text/javascript">
    function Search_Gridview(strKey) {
        var strData = strKey.value.toLowerCase().split(" ");
        var tblData = document.getElementById("<%=GridView1.ClientID %>");
        var rowData;
        for (var i = 1; i < tblData.rows.length; i++) {
            rowData = tblData.rows[i].innerHTML;
            var styleDisplay = 'none';
            for (var j = 0; j < strData.length; j++) {
                if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                    styleDisplay = '';
                else {
                    styleDisplay = 'none';
                    break;
                }
            }
            tblData.rows[i].style.display = styleDisplay;
        }
    }  
</script>

</asp:Content>
