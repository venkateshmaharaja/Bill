<%-- 
    Document   : master_input_insert
    Created on : 23 Jan, 2020, 12:47:38 PM
    Author     : AV-IT-PC345
--%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.tools.ws.wsdl.framework.DuplicateEntityException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.db_connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Master Input Operations</title>
    </head>
    <body>
        <%

            try {

                String user_name = (String) session.getAttribute("name");

                db_connection obj = new db_connection();
                Connection con = obj.getConnection();
                Statement st = con.createStatement();

                DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Date dateobj = new Date();
                String currDate = df.format(dateobj);
                out.print(currDate);

                String mnu = request.getParameter("mnu");
                int result_pop = 0;
                int result_pop1 = 0;
                int result_pop2 = 0;
                int result_pop3 = 0;
                int result_pop4 = 0;
                int result_pop5 = 0;
                int result_pop6 = 0;
//                String user_name = request.getParameter("name");
//                out.print(mnu);
//                out.print(user_name);
                int mnu_no = Integer.parseInt(mnu);

                switch (mnu_no) {
                    case 1: {
//                        out.print("Plant");
                        String Plant_key = request.getParameter("plant_key");
                        String Plant_name = request.getParameter("plant_name");
                        String Comp_name = request.getParameter("company_name");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `plant_master`(`plant_key`, `plant_name`, `company_name`, `added_by`, `added_date`) VALUES (?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, Plant_name.toUpperCase());
                        ps.setString(3, Comp_name.toUpperCase());
                        ps.setString(4, user_name.toUpperCase());
                        ps.setString(5, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;

                    }

                    case 2: {
//                        out.print("station");
                        String station_id = request.getParameter("station_id");
                        String station_name = request.getParameter("station_name");
                        String incharge = request.getParameter("incharge");
                        String plant_key = request.getParameter("plant_key");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `station`(`plant_key`, `station_id`, `station_name`, `incharge`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, station_id.toUpperCase());
                        ps.setString(3, station_name.toUpperCase());
                        ps.setString(4, incharge.toUpperCase());
                        ps.setString(5, user_name.toUpperCase());
                        ps.setString(6, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;
                    }

                    case 3: {
//                        out.print("operation");
                        String plant_key = request.getParameter("plant_key");
                        String station_id = request.getParameter("station_id");
                        String operation_id = request.getParameter("operation_id");
                        String operation_name = request.getParameter("operation_name");
                        String process_key = request.getParameter("process_key");
//operation insert (1)
                        PreparedStatement ps = con.prepareStatement("INSERT INTO `operations`(`plant_key`, `operation_id`, `operation_name`, `station_id`, `added_by`, `added_date`)  VALUES (?,?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, operation_id.toUpperCase());
                        ps.setString(3, operation_name.toUpperCase());
                        ps.setString(4, station_id.toUpperCase());
                        ps.setString(5, user_name.toUpperCase());
                        ps.setString(6, currDate);

//operation insert (rework)  (1)
                        PreparedStatement psw1 = con.prepareStatement("INSERT INTO `operations`(`plant_key`, `operation_id`, `operation_name`, `station_id`, `added_by`, `added_date`)  VALUES (?,?,?,?,?,?)");
                        psw1.setString(1, plant_key.toUpperCase());
                        psw1.setString(2, operation_id.toUpperCase().concat(" REWORK"));
                        psw1.setString(3, operation_name.toUpperCase().concat(" REWORK"));
                        psw1.setString(4, station_id.toUpperCase());
                        psw1.setString(5, user_name.toUpperCase());
                        psw1.setString(6, currDate);

//operation (process_key_master)insert (2)
                        PreparedStatement ps1 = con.prepareStatement("INSERT INTO `process_key_master`(`operation_id`, `process_key`, `plant_key`, `added_by`, `added_date`)  VALUES (?,?,?,?,?)");
                        ps1.setString(1, operation_id.toUpperCase());
                        ps1.setString(2, process_key.toUpperCase());
                        ps1.setString(3, plant_key.toUpperCase());
                        ps1.setString(4, user_name.toUpperCase());
                        ps1.setString(5, currDate);

//operation (operation_rework)-1 insert (3)
                        PreparedStatement ps3_1 = con.prepareStatement("INSERT INTO `operation_rework`(`operation_id`, `condition_id`, `rework_operation`, `added_by`, `added_date`)  VALUES (?,?,?,?,?)");
                        ps3_1.setString(1, operation_id.toUpperCase());
                        ps3_1.setString(2, "FAIL");
                        ps3_1.setString(3, operation_name.toUpperCase().concat(" REWORK"));
                        ps3_1.setString(4, user_name.toUpperCase());
                        ps3_1.setString(5, currDate);

//operation (operation_rework)-2 insert (3)
                        PreparedStatement ps3_2 = con.prepareStatement("INSERT INTO `operation_rework`(`operation_id`, `condition_id`, `rework_operation`, `added_by`, `added_date`)  VALUES (?,?,?,?,?)");
                        ps3_2.setString(1, operation_id.toUpperCase().concat(" REWORK"));
                        ps3_2.setString(2, "PASS");
                        ps3_2.setString(3, operation_name.toUpperCase());
                        ps3_2.setString(4, user_name.toUpperCase());
                        ps3_2.setString(5, currDate);

//operation (operation_rework)-3 insert (3)
                        PreparedStatement ps3_3 = con.prepareStatement("INSERT INTO `operation_rework`(`operation_id`, `condition_id`, `rework_operation`, `added_by`, `added_date`)  VALUES (?,?,?,?,?)");
                        ps3_3.setString(1, operation_id.toUpperCase().concat(" REWORK"));
                        ps3_3.setString(2, "FAIL");
                        ps3_3.setString(3, operation_name.toUpperCase().concat(" REWORK"));
                        ps3_3.setString(4, user_name.toUpperCase());
                        ps3_3.setString(5, currDate);

//operation (operation_rework)-4 insert (3)
                        PreparedStatement ps3_4 = con.prepareStatement("INSERT INTO `operation_rework`(`operation_id`, `condition_id`, `rework_operation`, `added_by`, `added_date`)  VALUES (?,?,?,?,?)");
                        ps3_4.setString(1, operation_id.toUpperCase().concat(" REWORK"));
                        ps3_4.setString(2, "SCRAP");
                        ps3_4.setString(3, "SCRAP");
                        ps3_4.setString(4, user_name.toUpperCase());
                        ps3_4.setString(5, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                            result_pop1 = psw1.executeUpdate();
                            result_pop2 = ps1.executeUpdate();
                            result_pop3 = ps3_1.executeUpdate();
                            result_pop4 = ps3_2.executeUpdate();
                            result_pop5 = ps3_3.executeUpdate();
                            result_pop6 = ps3_4.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }

                        break;
                    }

                    case 4: {
//                        out.print("");
                        String plant_key = request.getParameter("plant_key");
                        String station_id = request.getParameter("station_id");
                        String user_id = request.getParameter("user_id");
                        String line = request.getParameter("line");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `user_master`(`user_id`, `plant_key`, `station_id`, `line`, `added_by`, `added_date`)  VALUES (?,?,?,?,?,?)");
                        ps.setString(1, user_id.toUpperCase());
                        ps.setString(2, plant_key.toUpperCase());
                        ps.setString(3, station_id.toUpperCase());
                        ps.setString(4, line.toUpperCase());
                        ps.setString(5, user_name.toUpperCase());
                        ps.setString(6, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;
                    }

                    case 5: {
//                        out.print("users");
                        String user_id = request.getParameter("user_id");
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        String user_access = request.getParameter("user_access");
                        String ipconfig = request.getParameter("ipconfig");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `users`(`user_name`, `password`, `user_id`, `user_access`, `ip_config`, `added_by`, `added_date`)  VALUES (?,?,?,?,?,?,?)");
                        ps.setString(1, username.toUpperCase());
                        ps.setString(2, password.toUpperCase());
                        ps.setString(3, user_id.toUpperCase());
                        ps.setString(4, user_access.toUpperCase());
                        ps.setString(5, user_access.toUpperCase());
                        ps.setString(6, ipconfig);
                        ps.setString(7, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;
                    }

                    case 6: {
//                        out.print("users");
                        String user_id = request.getParameter("user_id");
                        String Operation_id = request.getParameter("Operation_id");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `user_operations`(`user_id`, `operation_id`, `added_by`, `added_date`)  VALUES (?,?,?,?)");
                        ps.setString(1, user_id.toUpperCase());
                        ps.setString(2, Operation_id.toUpperCase());
                        ps.setString(3, user_name.toUpperCase());
                        ps.setString(4, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;
                    }

                    case 7: {
//                        out.print("users");
                        String plant_key = request.getParameter("plant_key");
                        String condition_id = request.getParameter("condition_id");
                        String Conditions_name = request.getParameter("Conditions_name");
                        String user_access = request.getParameter("user_access");
                        String ipconfig = request.getParameter("ipconfig");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `conditions`(`plant_key`, `condition_id`, `condition_name`, `added_by`, `added_date`)   VALUES (?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, condition_id.toUpperCase());
                        ps.setString(3, Conditions_name.toUpperCase());
                        ps.setString(4, user_name.toUpperCase());
                        ps.setString(5, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;
                    }

                    case 8: {
//                        out.print("users");
                        String plant_key = request.getParameter("plant_key");
                        String Operation_id = request.getParameter("Operation_id");
                        String process_key = request.getParameter("process_key");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `process_key_master`(`operation_id`, `process_key`, `plant_key`, `added_by`, `added_date`)VALUES (?,?,?,?,?)");
                        ps.setString(1, Operation_id.toUpperCase());
                        ps.setString(2, process_key.toUpperCase());
                        ps.setString(3, plant_key.toUpperCase());
                        ps.setString(4, user_name.toUpperCase());
                        ps.setString(5, currDate);
                        try {
                            result_pop = ps.executeUpdate();
                        } catch (SQLException sq) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('SQL ERROR');");
                            out.write("setTimeout(function(){window.location.href='../RCTS/master_input.jsp'},1);");
                            out.println("</script>");
                        }
                        break;
                    }

                    default:
                        out.print("Menu not available");
                }

//                insert msg 
                if (result_pop > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sucessfully inserted');");
                    out.write("setTimeout(function(){window.location.href='/RCTS/master_input.jsp'},1);");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Error');");
                    out.write("setTimeout(function(){window.location.href='/RCTS/master_input.jsp'},1);");
                    out.println("</script>");
                }

            } catch (Exception ex) {
                out.print(ex);

            }
        %>
    </body>
</html>
