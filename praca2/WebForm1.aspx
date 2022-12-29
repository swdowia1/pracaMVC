<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="praca2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <script type="text/javascript"> 
             function deleteRow(id) {
                
                 $.ajax({
                     type: "POST",
                     url: "DaneSerwis.asmx/UsunPracownik",

                     data: JSON.stringify({ 'id': id }),
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (r) {
                         console.log(r.responseText);
                         loadData();
                     },
                     error: function (r) {
                         console.log(r.responseText);
                         alert(r.responseText);
                     },
                     failure: function (r) {
                         console.log(r.responseText);
                         alert(r.responseText);
                     }
                 });
             }
             function processForm() {
              
                
                 // public static string NowyPracownik(string imie,string nazwisko,string adres)
               
                 //============
                 var imie = $("#txtImie").val();
                 var nazwisko = $("#txtNazwisko").val();
                 var adres = $("#txtAdres").val();
                 $.ajax({
                     type: "POST",
                     url: "DaneSerwis.asmx/NowyPracownik",

                     data: JSON.stringify({ 'imie': imie, 'nazwisko': nazwisko, 'adres': adres }),
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (r) {
                         console.log(r.responseText);
                         loadData();
                     },
                     error: function (r) {
                         console.log(r.responseText);
                         alert(r.responseText);
                     },
                     failure: function (r) {
                         console.log(r.responseText);
                         alert(r.responseText);
                     }
                 });
                 return false;
                 //========
                
             }
             function loadData() {
                 $(document).ready(function () {

                     $.ajax({
                         url: 'DaneSerwis.asmx/GetAllEmployee',
                         dataType: "json",
                         method: 'post',
                         success: function (data) {
                             var employeeTable = $('#tblEmployee tbody');
                             employeeTable.empty();
                             $(data).each(function (index, emp) {
                                 console.table(emp);
                                 employeeTable.append('<tr><td>' + emp.id + '</td><td>'
                                     + emp.imie + '</td><td>' + emp.nazwisko + '</td><td>' + emp.adres + '</td><td><button class=\"btn\" type=\"button\" onclick=\"deleteRow(' + emp.id + ')\">Usuń</button></td></tr > ');
                             });
                         },
                         error: function (err) {
                             console.log(err);
                             alert(err);
                         }
                     });
                 });
             }

             loadData();
         </script>
        <table id="tblEmployee" class="table table-bordered">  
                <thead class="bg-primary text-white">  
                    <tr>  
                        <th>ID</th>  
                        <th>Imie</th>  
                        <th>nazwisko</th>  
                        <th>Adres</th>  
                         <th></th>
                    </tr>  
                </thead>  
                <tbody></tbody>  
            </table>  
      

       <div>

             <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                Imie:
                            </td>
                            <td>
                                <asp:TextBox ID="txtImie"  runat="server" />
                            </td>
                            <td>
                                Nazwisko:
                            </td>
                            <td>
                                <asp:TextBox ID="txtNazwisko" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Adres:
                            </td>
                            <td>
                                <asp:TextBox ID="txtAdres" runat="server" />
                            </td>
                            <td>
                                <button id="btnSave" tabindex="5" class="btn" type="button" onclick="processForm()">Send</button>
  
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
       </div>
    </form>
</body>
</html>
