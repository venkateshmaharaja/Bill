<%-- 
    Document   : master_input
    Created on : 21 Jan, 2020, 12:32:32 PM
    Author     : AV-IT-PC560
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
        <title>RCTS</title>
        <!DOCTYPE html>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="Bootstrap files/3.4.1/css/bootstrap.min.css">
    <script src="Bootstrap files/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="Bootstrap files/3.4.1/js/bootstrap.min.js"></script>

    <!--<script src="js/jquery_3.4.1.min.js"></script>-->
    <script>

        $(document).ready(function () {
            //******START*******plant filter angainst operation selection//
            let totel_data = [], data, total = 0;
            $("#add_operation_plant_key").change(function () {
//                alert("hi");
                var add_operation_plant_key = $("#add_operation_plant_key").val();
                var a, b;
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/select_filter/filter_master_input.jsp",
                    data: {plant_key: $("#add_operation_plant_key").val(),mnu:"3"},
                    success: function (data) {
//                        alert(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            a += "<option value='" + totel_data[i] + "'>" + totel_data[i] + '</option>'
                        }
                        b = "<option value=''></option>"
                        document.getElementById("sel_station").innerHTML = b + a;
//                        alert(a);
                    }
                })
            });
            //******END*******plant filter  angainst operation selection//

            //******START*******plant filter angainst user selection//
            $("#add_user_plant_key").change(function () {
//                alert("hi");
                var add_user_plant_key = $("#add_user_plant_key").val();
                var a, b;
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/select_filter/filter_master_input.jsp",
                    data: {plant_key: $("#add_user_plant_key").val(),mnu:"4"},
                    success: function (data) {
//                        alert(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            a += "<option value='" + totel_data[i] + "'>" + totel_data[i] + '</option>'
                        }
                        b = "<option value=''></option>"
                        document.getElementById("sel_station_id_add_user").innerHTML = b + a;
//                        alert(a);
                    }
                })
            });
            //******END*******plant filter  angainst operation selection//


            //******START*******operation filter angainst plant selection//
            $("#add_process_key_plant_key").change(function () {
//                alert("hi");
                var add_process_key_plant_key = $("#add_process_key_plant_key").val();
                var a, b;
                $.ajax({
                    type: "POST",
                    url: "ajax_process_jsp/select_filter/filter_master_input.jsp",
                    data: {plant_key: $("#add_process_key_plant_key").val(),mnu:"8"},
                    success: function (data) {
//                        alert(data);
                        totel_data = data.split("&");
                        for (let i = 0; i < totel_data.length - 1; i++) {
                            a += "<option value='" + totel_data[i] + "'>" + totel_data[i] + '</option>'
                        }
                        b = "<option value=''></option>"
                        document.getElementById("sel_Operation_id").innerHTML = b + a;
//                        alert(a);
                    }
                })
            });
            //******END*******operation filter  angainst plant selection//



        });
    </script>

</head>
<body>
    <%
        try {
            db_connection obj = new db_connection();
            Connection con = obj.getConnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();

            String name = "venkat";
            session.setAttribute("name", name);
    %>


    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"></a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">ATS</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">MASTER <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#plants">ADD PLANT</a></li>
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#station">ADD STATION</a></li>
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#operations">ADD OPERATIONS</a></li>
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#user_master">ADD USER MASTER</a></li>
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#users">ADD USERS</a></li>
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#users_operation">ADD USER OPERATION</a></li> 
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#conditions">ADD CONDITIONS</a></li>
                        <li><a href="#" style="color:green"  data-toggle="modal" data-target="#process_key_master">ADD PROCESS KEY MASTER	</a></li>
                    </ul>
                </li>
                <!--                <li><a href="#">Page 2</a></li>
                                <li><a href="#">Page 3</a></li>-->
            </ul>
        </div>
    </nav>

    <div class="container">
        <h3></h3>
        <p></p>
    </div>


    <!-- ****START**1* PLANT ADD-->

    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=1" method="post">
            <div class="modal fade" id="plants" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add Plants</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="plant_key">Plant Key</label>
                                <input type="text" name="plant_key"  required="" class="form-control" id="plant_key">
                            </div>
                            <div class="form-group">
                                <label for="plant_name">Plant Name</label>
                                <input type="text" name="plant_name" required="" class="form-control" id="plant_name">
                            </div>
                            <div class="form-group">
                                <label for="company_name">Company Name</label>
                                <input type="text" name="company_name" required="" class="form-control" id="company_name">
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
    </div>
    <!-- ****END*** PLANT ADD-->

    <%
        ResultSet rs_plantkey = st.executeQuery("SELECT  `plant_key`  FROM `plant_master`");

    %>
    <!-- ****START**2* STATION ADD-->

    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=2" method="post">
            <div class="modal fade" id="station" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add Station</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="plant_key">Plant Key</label>
                                <select type="text" name="plant_key" required="" class="form-control" id="plant_key">
                                    <option></option>
                                    <% while (rs_plantkey.next()) {
                                    %>
                                    <option value="<%=rs_plantkey.getString(1)%>" ><%=rs_plantkey.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="station_id">Station ID</label>
                                <input type="text" name="station_id" required="" class="form-control" id="station_name">
                            </div>
                            <div class="form-group">
                                <label for="station_name">Station Name</label>
                                <input type="text" name="station_name" required="" class="form-control" id="station_name">
                            </div>
                            <div class="form-group">
                                <label for="incharge">Incharge Name</label>
                                <input type="text" name="incharge" required="" class="form-control" id="incharge">
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
    </div>

    <!-- ****END*** STATION ADD-->
    <%
        ResultSet rs_plantkey1 = st.executeQuery("SELECT  `plant_key`  FROM `plant_master`");
        ResultSet rs_station = st1.executeQuery("SELECT  `station_id`  FROM `station`");
    %>
    <!-- ****START**3* operations ADD-->
    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=3" method="post">
            <div class="modal fade" id="operations" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add Operations</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="plant_key">Plant Key</label>
                                <select type="text" name="plant_key" required="" class="form-control" id="add_operation_plant_key">
                                    <option></option>
                                    <% while (rs_plantkey1.next()) {
                                    %>
                                    <option value="<%=rs_plantkey1.getString(1)%>" ><%=rs_plantkey1.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="station_id">Station ID</label>
                                <select type="text" class="form-control" required=""  name="station_id" id="sel_station">

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="operation_id">Operations ID</label>
                                <input type="text" name="operation_id"class="form-control" required="" id="operation_id">
                            </div>
                            <div class="form-group">
                                <label for="operation_name">Operations Name</label>
                                <input type="text" name="operation_name"class="form-control" required="" id="operation_name">
                            </div>
                                 <div class="form-group">
                                <label for="operation_name">Process Key</label>
                                <input type="text" name="process_key"class="form-control" required="" maxlength="2" id="process_key">
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
    </div>

    <!-- ****END*** operations ADD-->
    <%
        ResultSet rs_plantkey2 = st.executeQuery("SELECT  `plant_key`  FROM `plant_master`");
        ResultSet rs_station2 = st1.executeQuery("SELECT  `station_id`  FROM `station`");
    %>

    <!-- ****START**4* user_master ADD-->
    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=4" method="post">
            <div class="modal fade" id="user_master" role="dialog">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add User Master</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="plant_key">Plant Key</label>
                                <select type="text" name="plant_key" required="" class="form-control" id="add_user_plant_key">
                                    <option></option>
                                    <% while (rs_plantkey2.next()) {
                                    %>
                                    <option value="<%=rs_plantkey2.getString(1)%>" ><%=rs_plantkey2.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="station_id">Station ID</label>
                                <select type="text" name="station_id" required="" class="form-control" id="sel_station_id_add_user">

                                </select>
                            </div>
                            <div class="form-group">
                                <label for="user_id">User Id</label>
                                <input type="text" name="user_id" class="form-control" required="" id="user_id">
                            </div>
                            <div class="form-group">
                                <label for="line">Line</label>
                                <input type="text" name="line"class="form-control" required="" id="line_name">
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
    </div>

    <!-- ****END*** user_master ADD-->
    <%
        ResultSet rs_user_master = st.executeQuery("SELECT  `user_id`  FROM `user_master`");
    %>
    <!-- ****START**5* users ADD-->
    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=5" method="post">
            <div class="modal fade" id="users" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add Users</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="user_id">User_id</label>
                                <select type="text" name="user_id" required="" class="form-control" required="" id="user_id">
                                    <option></option>
                                    <%while (rs_user_master.next()) {
                                    %>
                                    <option value="<%=rs_user_master.getString(1)%>" ><%=rs_user_master.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" class="form-control" required="" id="username">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" class="form-control" required="" id="password">
                            </div>
                            <div class="form-group">
                                <label for="user_access">Access</label>
                                <input type="text" name="user_access"class="form-control" required="" id="user_access">
                            </div>
                            <div class="form-group">
                                <label for="ipconfig">IP ADDRESS</label>
                                <input type="text" name="ipconfig"class="form-control" required="" id="ipconfig">
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
    </div>
    <!-- ****END*** users ADD-->
    <%
        ResultSet rs_users_id = st.executeQuery("SELECT  `user_id`  FROM `user_master`");
        ResultSet rs_operation_id = st1.executeQuery("SELECT  `operation_id`  FROM `operations`");
    %>

    <!-- ****START**6* users_operation ADD-->
    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=6" method="post">
            <div class="modal fade" id="users_operation" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add User Operations</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="user_id">User Id</label>
                                <select type="text" name="user_id" required="" class="form-control" id="user_id">
                                    <option></option>
                                    <%while (rs_users_id.next()) {
                                    %>
                                    <option value="<%=rs_users_id.getString(1)%>" ><%=rs_users_id.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>


                            <div class="form-group">
                                <label for="Operation_id">Operation Id</label>
                                <select type="text" name="Operation_id" required="" class="form-control" id="Operation_id">
                                    <option></option>
                                    <%while (rs_operation_id.next()) {
                                    %>
                                    <option value="<%=rs_operation_id.getString(1)%>" ><%=rs_operation_id.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
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
    </div>
    <!-- ****END*** users_operation ADD-->
    <%
        ResultSet rs_plantkey3 = st.executeQuery("SELECT  `plant_key`  FROM `plant_master`");
    %>


    <!-- ****START**7* conditions ADD-->
    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=7" method="post">
            <div class="modal fade" id="conditions" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add Conditions</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="plant_key">Plant Key</label>
                                <select type="text" name="plant_key" required="" class="form-control" id="plant_key">
                                    <option></option>
                                    <% while (rs_plantkey3.next()) {
                                    %>
                                    <option value="<%=rs_plantkey3.getString(1)%>" ><%=rs_plantkey3.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="condition_id">Conditions Id</label>
                                <input type="text" name="condition_id"  required="" class="form-control" id="condition_id">
                            </div>

                            <div class="form-group">
                                <label for="Conditions_name">Conditions Name</label>
                                <input type="text" name="Conditions_name" required="" class="form-control" id="Conditions_name">
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
    </div>
    <!-- ****END*** conditions ADD-->


    <%
        ResultSet rs_plantkey4 = st.executeQuery("SELECT  `plant_key`  FROM `plant_master`");
        ResultSet rs_operation_id2 = st1.executeQuery("SELECT  `operation_id`  FROM `operations`");
    %>

    <!-- ****START**8* process_key_master ADD-->
    <div class="container">
        <form action="db_operations/master_input_insert.jsp?mnu=8" method="post">
            <div class="modal fade" id="process_key_master" role="dialog">
                <div class="modal-dialog modal-sm">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <!--<button type="button" class="close" data-dismiss="modal">&times;</button>-->
                            <h4 class="modal-title" align="center">Add Process Key Master</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="plant_key">Plant Key</label>
                                <select type="text" name="plant_key" required="" class="form-control" id="add_process_key_plant_key">
                                    <option></option>
                                    <% while (rs_plantkey4.next()) {
                                    %>
                                    <option value="<%=rs_plantkey4.getString(1)%>" ><%=rs_plantkey4.getString(1)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="Operation_id">Operation Id</label>
                                <select type="text" name="Operation_id" required="" class="form-control" id="sel_Operation_id">
                                    <!--<option></option>-->
                                    <%//while (rs_operation_id2.next()) {
                                        //%>
                                    <!--<option value="<%//=rs_operation_id2.getString(1)%>" ><%//=rs_operation_id2.getString(1)%></option>-->
                                    <%
//                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="process_key">Process Key</label>
                                <input type="text" name="process_key" class="form-control" required="" id="process_key">
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
    </div>
    <!-- ****END*** users_operation ADD-->

    <%} catch (Exception ex) {
            out.print(ex);
        }
    %>
</body>
</html>
</body>
</html>



