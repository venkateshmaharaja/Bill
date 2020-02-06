<%-- 
    Document   : master_inpu
    Created on : 6 Feb, 2020, 12:31:10 PM
    Author     : AV-IT-PC408
--%>

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
        <style>
        </style>
    </head>

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
                            <input type="text" name="Category_name"  required="" class="form-control" id="Category_name">
                            <div class="modal-footer">
                                <input type="submit"  value="ADD" class="btn btn-success"></input>
                                <!--<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>-->
                            </div>
                        </div>
                    </div>
                    <div class="modal-header">
                        <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                        <h4 class="modal-title" align="center">Edit Category</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="Edit_Category_name">Category Name</label>
                            <select type="text" name="sel_Edit_Category_name"  required="" class="form-control" id="sel_Edit_Category_name">
                        </div>
                        <div class="form-group">
                            <label for="Edit_Category_name">Category Name</label>
                            <input type="text" name="Edit_Category_name"  required="" class="form-control" id="Edit_Category_name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="Submit" class="btn btn-success"></input>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ****END**1* Category ADD-->


</html>
