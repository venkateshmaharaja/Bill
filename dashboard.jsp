<%-- 
    Document   : dashboard
    Created on : 30 Jan, 2020, 9:26:07 AM
    Author     : AV-IT-PC408
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%--<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.db_connection"%>
<%@page import="java.sql.ResultSet"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="stylesheet" href="Bootstrap files/3.4.1/css/bootstrap.min.css">-->
        <script src="Bootstrap files/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="Bootstrap files/3.4.1/js/bootstrap.min.js"></script>
        <title>Dashboard</title>
        <style>
            body{
                background-color: #fff;
            }
        </style>
    </head>
    <body>
        <%@include file="menu.jsp"%>
        <%@include file="master_input.jsp"%>
        
         <!-- ****START**1* Category ADD-->
<!--        <div class="container">
            <form action="db_operations/master_input_insert.jsp?mnu=1" method="post">
            <form action="#" method="post">
                <div class="modal fade" id="Category" role="dialog">
                    <div class="modal-dialog modal-sm">
                         Modal content
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                <h4 class="modal-title" align="center">Add Category</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="Category_name">Category Name</label>
                                    <input type="text" name="Category_name"  required="" class="form-control" id="Category_name">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" value="Submit" class="btn btn-success"></input>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>-->
        <!-- ****END**1* Category ADD-->

    </body>
</html>
