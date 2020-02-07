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
            //******START*******Category_Add//
            $("#btn_category_add").click(function () {
                var Category_name = $("#Category_name").val();
                alert(Category_name);
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
            $("#sel_Edit_Category_name").change(function () {
                var sel_Edit_Category_name = $("#sel_Edit_Category_name").val();
                alert(sel_Edit_Category_name);
//                var check;
//                $.ajax({
//                    type: "POST",
//                    url: "ajax_process_jsp/db_process/db_insert.jsp",
//                    data: {Category_name: $("#Category_name").val(), mnu: "1"},
//                    dataType: 'text',
//                    success: function (data) {
//                        alert(data);
////                        console.log(data);
//                        totel_data = data.split("&");
//                        for (let i = 0; i < totel_data.length - 1; i++) {
//                            check = totel_data[i];
//                        }
//                        if (jQuery.trim(check) == "OK")
//                        {
//                            document.getElementById("category_add_alert").innerHTML = "Category Added Successfully ...!!!";
//                            $('#category_add_alert').css('color', 'green');
//                            document.getElementById("Category_name").value = "";
//                        } else {
//                            document.getElementById("category_add_alert").innerHTML = "Category Not Added...!!!";
//                            document.getElementById("Category_name").value = "";
//                            $('#category_add_alert').css('color', 'red');
//                        }
//                    }
//                })
            });
            //******END*******Category_Edit//



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

    <!-- ****START**1* Category ADD-->
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
                            <label for="Category_name">Category Name</label>
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
                            <select type="text" name="sel_Edit_Category_name"  required="" class="form-control" id="sel_Edit_Category_name">
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
                            <input type="text" name="Edit_Category_name"  required="" class="form-control" id="Edit_Category_name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="Submit" id="btn_edit_category" class="btn btn-success"></input>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ****END**1* Category ADD-->

    <%
        } catch (Exception ex) {
            out.print(ex);
        }%>
</html>
