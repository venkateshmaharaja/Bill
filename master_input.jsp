<%-- 
    Document   : master_inpu
    Created on : 6 Feb, 2020, 12:31:10 PM
    Author     : AV-IT-PC408
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Master Input</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bill/Bootstrap files/3.4.1/css/cardstyle.css">
        <link rel="stylesheet" href="../bill/Bootstrap files/3.4.1/css/dropdown.css">
        <link rel="stylesheet" href="../bill/Bootstrap files/3.4.1/css/bootstrap.min.css">
        <script src="../bill/Bootstrap files/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="../bill/Bootstrap files/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <script>

        $(document).ready(function () {
            let totel_data = [], data, total = 0;

//for click close buttom restart window ***START***
            $(".close").click(function () {
                location.reload();
//                alert("close");
            });
            $(".btn-danger").click(function () {
                location.reload();
//                alert("close");
            });

//for click close buttom restart window ***END***



//####   START         OPERATION FOR MENU ** 1 CATEGORY **  ####
//            
//for clear the alert category ***START***
            $("#Category_name").keyup(function () {
                document.getElementById("category_add_alert").innerHTML = "";
            });
//for clear the alert category ***END***

            //****** START *******Category_Add//
            $("#btn_category_add").click(function () {
                var Category_name = $("#Category_name").val();
//                alert(Category_name);
                var check;
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/db_process/db_insert.jsp",
                    data: {Category_name: $("#Category_name").val(), mnu: "1"},
                    dataType: 'text',
                    success: function (data) {
//                        alert(data);
//                        console.log(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            check = totel_data[i];
                        }
                        if (jQuery.trim(check) == "OK")
                        {
                            document.getElementById("category_add_alert").innerHTML = "Category Added Successfully ...!!!";
                            $('#category_add_alert').css('color', 'green');
                            document.getElementById("Category_name").value = "";
                        } else {
                            document.getElementById("category_add_alert").innerHTML = "Category Not Added...!!!";
                            document.getElementById("Category_name").value = "";
                            $('#category_add_alert').css('color', 'red');
                        }
                    }
                })
            });
            //******END*******Category_Add//



            //******START*******Category_Edit//
//                                              select and put into editing text area **  START **
            $("#sel_Edit_Category_name").change(function () {
                var sel_Edit_Category_name = $("#sel_Edit_Category_name").val();
//                alert(sel_Edit_Category_name);
                document.getElementById("Edit_Category_name").value = sel_Edit_Category_name;
            });
//                                              select and put into editing text area **  END **


            $("#btn_edit_category_submit").click(function () {
                var sel_Edit_Category_name = $("#sel_Edit_Category_name").val();
                var Edit_Category_name = $("#Edit_Category_name").val();
                var check;
//                alert("selected = " + sel_Edit_Category_name + " editing =" + Edit_Category_name);
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/db_process/db_update.jsp",
                    data: {sel_Edit_Category_name: $("#sel_Edit_Category_name").val(), Edit_Category_name: $("#Edit_Category_name").val(), mnu: "1"},
                    dataType: 'text',
                    success: function (data) {
//                        alert(data);
//                        console.log(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            check = totel_data[i];
                        }
                        if (jQuery.trim(check) == "OK")
                        {
                            document.getElementById("category_edit_add_alert").innerHTML = "Category Updated Successfully ...!!!";
                            $('#category_edit_add_alert').css('color', 'green');
                            document.getElementById("category_edit_add_alert").value = "";
                        } else {
                            document.getElementById("category_edit_add_alert").innerHTML = "Category Not Updated...!!!";
                            document.getElementById("category_edit_add_alert").value = "";
                            $('#category_edit_add_alert').css('color', 'red');
                        }
                    }
                })
            });
//for clear the alert category ***START***
            $("#Edit_Category_name").keyup(function () {
                document.getElementById("category_edit_add_alert").innerHTML = "";
            });
//for clear the alert category ***END***

            //******END*******Category_Edit//

// ###     END      OPERATION FOR MENU ** 1 CATEGORY **   ####







///####   START         OPERATION FOR MENU **  BRAND **  ####
//            
//for clear the alert brand ***START***
            $("#Brand_name").keyup(function () {
                document.getElementById("brand_add_alert").innerHTML = "";
            });
//for clear the alert brand ***END***

            //****** START *******Brand_Add//
            $("#btn_brand_add").click(function () {
                var Category_name = $("#Brand_name").val();
//                alert(Category_name);
                var check;
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/db_process/db_insert.jsp",
                    data: {Brand_name: $("#Brand_name").val(), mnu: "2"},
                    dataType: 'text',
                    success: function (data) {
//                        alert(data);
//                        console.log(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            check = totel_data[i];
                        }
                        if (jQuery.trim(check) == "OK")
                        {
                            document.getElementById("brand_add_alert").innerHTML = "Brand Added Successfully ...!!!";
                            $('#brand_add_alert').css('color', 'green');
                            document.getElementById("Brand_name").value = "";
                        } else {
                            document.getElementById("brand_add_alert").innerHTML = "Brand Not Added...!!!";
                            document.getElementById("Brand_name").value = "";
                            $('#brand_add_alert').css('color', 'red');
                        }
                    }
                })
            });
            //******END*******Brand_add//



            //******START*******Brand Edit//
//                                              select and put into editing text area **  START **
            $("#sel_Edit_Brand_name").change(function () {
                var sel_Edit_Brand_name = $("#sel_Edit_Brand_name").val();
//                alert(sel_Edit_Brand_name);
                document.getElementById("Edit_Brand_name").value = sel_Edit_Brand_name;
            });
//                                              select and put into editing text area **  END **

            $("#btn_edit_Brand_submit").click(function () {
                var sel_Edit_Brand_name = $("#sel_Edit_Brand_name").val();
                var Edit_Brand_name = $("#Edit_Brand_name").val();
                var check;
//                alert("selected = " + sel_Edit_Brand_name + " editing =" + Edit_Brand_name);
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/db_process/db_update.jsp",
                    data: {sel_Edit_Brand_name: $("#sel_Edit_Brand_name").val(), Edit_Brand_name: $("#Edit_Brand_name").val(), mnu: "2"},
                    dataType: 'text',
                    success: function (data) {
//                        alert(data);
//                        console.log(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            check = totel_data[i];
                        }
                        if (jQuery.trim(check) == "OK")
                        {
                            document.getElementById("Brand_edit_add_alert").innerHTML = "Brand Updated Successfully ...!!!";
                            $('#Brand_edit_add_alert').css('color', 'green');
                            document.getElementById("Brand_edit_add_alert").value = "";
                        } else {
                            document.getElementById("Brand_edit_add_alert").innerHTML = "Brand Not Updated...!!!";
                            document.getElementById("Brand_edit_add_alert").value = "";
                            $('#Brand_edit_add_alert').css('color', 'red');
                        }
                    }
                })
            });
//for clear the alert Brand ***START***
            $("#Edit_Brand_name").keyup(function () {
                document.getElementById("Brand_edit_add_alert").innerHTML = "";
            });
//for clear the alert Brand ***END***

            //******END*******Brand_edit//

// ###     END      OPERATION FOR MENU ** 1 Brand **   ####       
        });
    </script>
    <%
        try {
            db_connection obj = new db_connection();
            Connection con = obj.getConnection();
            Statement st = con.createStatement();

            //        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            //        Date dateobj = new Date();
            //        String currDate = df.format(dateobj);
    %>

    <!-- ****START**1* Category Menu-->
    <div class="container">
        <!--<form action="db_operations/master_input_insert.jsp?mnu=1" method="post">-->
        <div class="modal fade" id="Category" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center">Add Category</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Category_name" >Category Name</label>
                            <input type="text" name="Category_name" style="font-weight: bolder;"  required="" class="form-control" id="Category_name">
                            <div class="modal-footer">
                                <input type="submit" id="btn_category_add"  value="ADD" class="btn btn-success"></input>
                                <!--<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>-->
                            </div>
                        </div>
                        <span id="category_add_alert" style="font-weight: bolder;"></span>
                    </div>
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title" align="center">Edit Category</h4>
                        <%ResultSet rs_category_edit = st.executeQuery("SELECT  `category_name`  FROM `category_master`");
                        %>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Edit_Category_name">Category Name</label>
                            <select type="text" name="sel_Edit_Category_name" style="font-weight: bolder;" required="" class="form-control" id="sel_Edit_Category_name">
                                <option></option>
                                <% while (rs_category_edit.next()) {
                                %>
                                <option value="<%=rs_category_edit.getString(1)%>"><%=rs_category_edit.getString(1)%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="Edit_Category_name">Category Name</label>
                            <input type="text" name="Edit_Category_name" style="font-weight: bolder;" required="" class="form-control" id="Edit_Category_name">
                        </div>
                    </div>
                    <span id="category_edit_add_alert" style="font-weight: bolder;"></span>
                    <div class="modal-footer">
                        <input type="submit" value="Submit" id="btn_edit_category_submit" class="btn btn-success"></input>
                        <button type="button" class="btn btn-danger" id="btn_close" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ****END**1* Category Menu-->




    <!-- ****START**2* Brand Menu-->
    <div class="container">
        <div class="modal fade" id="Brand" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center">Add Brand</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Brand_name">Brand Name</label>
                            <input type="text" name="Brand_name" style="font-weight: bolder;"  required="" class="form-control" id="Brand_name">
                            <div class="modal-footer">
                                <input type="submit" id="btn_brand_add"  value="ADD" class="btn btn-success"></input>
                                <!--<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>-->
                            </div>
                        </div>
                        <span id="brand_add_alert" style="font-weight: bolder;"></span>
                    </div>
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title" align="center">Edit Brand</h4>
                        <%ResultSet rs_brand_edit = st.executeQuery("SELECT  `brand_name`  FROM `brand_master`");
                        %>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Edit_Brand_name">Brand Name</label>
                            <select type="text" name="sel_Edit_Brand_name" style="font-weight: bolder;" required="" class="form-control" id="sel_Edit_Brand_name">
                                <option></option>
                                <% while (rs_brand_edit.next()) {
                                %>
                                <option value="<%=rs_brand_edit.getString(1)%>"><%=rs_brand_edit.getString(1)%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="Edit_Brand_name">Brand Name</label>
                            <input type="text" name="Edit_Brand_name" style="font-weight: bolder;" required="" class="form-control" id="Edit_Brand_name">
                        </div>
                    </div>
                    <span id="Brand_edit_add_alert" style="font-weight: bolder;"></span>
                    <div class="modal-footer">
                        <input type="submit" value="Submit" id="btn_edit_Brand_submit" class="btn btn-success"></input>
                        <button type="button" class="btn btn-danger" id="btn_close" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ****END**2* Brand Menu-->



    <!-- ****START**3* Product Menu-->

    <div class="container">
        <div class="modal fade" id="Product" role="dialog">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" align="center">Add Products</h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="Prod_Category_name">Category Name</label>
                                    <select type="text" name="Prod_Category_name" style="font-weight: bolder;"  required="" class="form-control" id="Prod_Category_name">
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="col-6">
                                        <label for="Prod_Brand_name">Brand Name</label>
                                        <select type="text" name="Prod_Brand_name" style="font-weight: bolder;"  required="" class="form-control" id="Prod_Brand_name">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <span id="brand_add_alert" style="font-weight: bolder;"></span>
                        </div>
                            <div class="modal-footer">
                                <input type="submit" value="Submit" id="btn_product_submit" class="btn btn-success"></input>
                            </div>
                        </div>
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Edit Brand</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="Edit_Brand_name">Brand Name</label>
                                <select type="text" name="sel_Edit_Brand_name" style="font-weight: bolder;" required="" class="form-control" id="sel_Edit_Brand_name">
                                    <option></option>

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Edit_Brand_name">Brand Name</label>
                                <input type="text" name="Edit_Brand_name" style="font-weight: bolder;" required="" class="form-control" id="Edit_Brand_name">
                            </div>
                        </div>
                        <span id="Brand_edit_add_alert" style="font-weight: bolder;"></span>
                        <div class="modal-footer">
                            <input type="submit" value="Submit" id="btn_edit_Brand_submit" class="btn btn-success"></input>
                            <button type="button" class="btn btn-danger" id="btn_close" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <!-- ****END**3* Product Menu-->


        <%
            } catch (Exception ex) {
                out.print(ex);
            }%>
</html>
