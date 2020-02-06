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
//                int result_pop7 = 0;
           
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

                    case 9: {
//                        out.print("users");
                        String plant_key = request.getParameter("add_processess_plant_key");
                        String Process_id = request.getParameter("Process_id");
                        String Process_Description = request.getParameter("Process_Description");
                        String Starting_operation = request.getParameter("Starting_operation");
                        String Next_step_status = request.getParameter("Next_step_status");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `processes`(`plant_key`, `process_id`, `process_desc`, `starting_operation`, `next_step_status`, `added_by`, `added_date`)VALUES (?,?,?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, Process_id.toUpperCase());
                        ps.setString(3, Process_Description.toUpperCase());
                        ps.setString(4, Starting_operation.toUpperCase());
                        ps.setString(5, Next_step_status.toUpperCase());
                        ps.setString(6, user_name.toUpperCase());
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

                    case 10: {
//                        out.print("users");
                        String Process_id = request.getParameter("Process_id");
                        String Plant_key = request.getParameter("Plant_key");
                        String Operation_id = request.getParameter("Operation_id");
                        String Condition_id = request.getParameter("Condition_id");
                        String Next_operation_type = request.getParameter("Next_operation_type");
                        String Next_operation = request.getParameter("Next_operation");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `next_step`(`plant_key`, `process_id`, `operation_id`, `condition_id`, `next_operation_type`, `next_operation`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, Process_id.toUpperCase());
                        ps.setString(3, Operation_id.toUpperCase());
                        ps.setString(4, Condition_id.toUpperCase());
                        ps.setString(5, Next_operation_type.toUpperCase());
                        ps.setString(6, Next_operation.toUpperCase());
                        ps.setString(7, user_name.toUpperCase());
                        ps.setString(8, currDate);
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

                    case 11: {
//                        out.print("users");
                        String plant_key = request.getParameter("Plant_key");
                        String Defect_id = request.getParameter("Defect_id");
                        String Defect_description = request.getParameter("Defect_description");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `defects`(`plant_key`, `defect_id`, `defect_desc`, `added_by`, `added_date`)VALUES (?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, Defect_id.toUpperCase());
                        ps.setString(3, Defect_description.toUpperCase());
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
                    
                       case 12: {
//                        out.print("users");
                        String plant_key = request.getParameter("Plant_key");
                        String Operation_id = request.getParameter("Operation_id");
                        String Defect_id = request.getParameter("Defect_id");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `operation_defect`(`plant_key`, `operation_id`, `defect_id`, `added_by`, `added_date`)VALUES (?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, Operation_id.toUpperCase());
                        ps.setString(3, Defect_id.toUpperCase());
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

                    case 13: {
//                        out.print("users");
                        String plant_key = request.getParameter("Plant_key");
                        String Customer_name = request.getParameter("Customer_name");
                        String Customer_code = request.getParameter("Customer_code");
                        String Customer_location = request.getParameter("Customer_location");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `customer_master`(`plant_key`, `customer_name`, `customer_code`, `customer_location`, `added_by`, `added_date`)VALUES (?,?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, Customer_name.toUpperCase());
                        ps.setString(3, Customer_code.toUpperCase());
                        ps.setString(4, Customer_location.toUpperCase());
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
                    
                    case 14: {
//                        out.print("users");
                        String plant_key = request.getParameter("Plant_key");
                        String Customer_code = request.getParameter("Customer_code");
                        String Customer_part_no = request.getParameter("Customer_part_no");
                        String SAP_part_no = request.getParameter("SAP_part_no");
                        String Type_of_part = request.getParameter("Type_of_part");
                        String Serial_pattern_status = request.getParameter("Serial_pattern_status");
                        String Serial_pattern_type = request.getParameter("Serial_pattern_type");
                        String Customer_group = request.getParameter("Customer_group");
                        String Description = request.getParameter("Description");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `product_master`(`plant_key`, `customer_code`, `customer_part_no`, `sap_part_no`, `type_of_part`, `serial_pattern_status`, `serial_pattern_type`, `customer_group`, `description`, `added_by`, `added_date`)VALUES (?,?,?,?,?,?,?,?,?,?,?)");
                        ps.setString(1, plant_key.toUpperCase());
                        ps.setString(2, Customer_code.toUpperCase());
                        ps.setString(3, Customer_part_no.toUpperCase());
                        ps.setString(4, SAP_part_no.toUpperCase());
                        ps.setString(5, Type_of_part.toUpperCase());
                        ps.setString(6, Serial_pattern_status.toUpperCase());
                        ps.setString(7, Serial_pattern_type.toUpperCase());
                        ps.setString(8, Customer_group.toUpperCase());
                        ps.setString(9, Description.toUpperCase());
                        ps.setString(10, user_name.toUpperCase());
                        ps.setString(11, currDate);
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
                    
                     case 15: {
//                        out.print("users");
                        String Plant_key = request.getParameter("Plant_key");
                        String Part_no = request.getParameter("Part_no");
                        String Type = request.getParameter("Type");
                        String Symbol = request.getParameter("Symbol");
                        String Digit = request.getParameter("Digit");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `serial_pattern_master`(`plant_key`, `part_no`, `type`, `symbol`, `digit`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, Part_no.toUpperCase());
                        ps.setString(3, Type.toUpperCase());
                        ps.setString(4, Symbol.toUpperCase());
                        ps.setString(5, Digit.toUpperCase());
                        ps.setString(6, user_name.toUpperCase());
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
                     
                     case 16: {
//                        out.print("users");
                        String Plant_key = request.getParameter("Plant_key");
                        String Top_level = request.getParameter("Top_level");
                        String Sub_level = request.getParameter("Sub_level");
                        String Type = request.getParameter("Type");
                        String Assembling_operation = request.getParameter("Assembling_operation");
                        String Quantity = request.getParameter("Quantity");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `linked_part_master`(`plant_key`, `top_level`, `sub_level`, `type`, `assembling_operation`, `quantity`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, Top_level.toUpperCase());
                        ps.setString(3, Sub_level.toUpperCase());
                        ps.setString(4, Type.toUpperCase());
                        ps.setString(5, Assembling_operation.toUpperCase());
                        ps.setString(6, Quantity.toUpperCase());
                        ps.setString(7, user_name.toUpperCase());
                        ps.setString(8, currDate);
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
                          case 17: {
//                        out.print("users");
                        String Plant_key = request.getParameter("Plant_key");
                        String part_config_Part_no = request.getParameter("part_config_Part_no");
                        String Starting_lot = request.getParameter("Starting_lot");
                        String Serial_no_pattern = request.getParameter("Serial_no_pattern");
                        String Process_id = request.getParameter("Process_id");
                        String Revision = request.getParameter("Revision");
                        String Raw_master = request.getParameter("Raw_master");
                        

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `part_no_config`(`plant_key`, `part_no`, `starting_lot`, `serial_no_pattern`, `process_id`, `revision`, `raw_material`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, part_config_Part_no.toUpperCase());
                        ps.setString(3, Starting_lot.toUpperCase());
                        ps.setString(4, Serial_no_pattern.toUpperCase());
                        ps.setString(5, Process_id.toUpperCase());
                        ps.setString(6, Revision.toUpperCase());
                        ps.setString(7, Raw_master.toUpperCase());
                        ps.setString(8, user_name.toUpperCase());
                        ps.setString(9, currDate);
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
                          case 18: {
//                        out.print("users");
                        String Plant_key = request.getParameter("Plant_key");
                        String Part_no = request.getParameter("Part_no");
                        String Lot_no = request.getParameter("Lot_no");
                        String Production_order1 = request.getParameter("Production_order1");
                        String Production_order2 = request.getParameter("Production_order2");
                        String Production_order3 = request.getParameter("Production_order3");
                        String Production_order4 = request.getParameter("Production_order4");
                        String Production_order5 = request.getParameter("Production_order5");
                        String Reservation_no1 = request.getParameter("Reservation_no1");
                        String Reservation_no2 = request.getParameter("Reservation_no2");
                        String Reservation_no3 = request.getParameter("Reservation_no3");
                        String Reservation_no4 = request.getParameter("Reservation_no4");
                        String Reservation_no5 = request.getParameter("Reservation_no5");
                        String Batch_no = request.getParameter("Batch_no");
                        String Quantity = request.getParameter("Quantity");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `planning`(`plant_key`, `part_no`, `lot_no`, `production_order_1`, `production_order_2`, `production_order_3`, `production_order_4`, `production_order_5`, `reservation_no_1`, `reservation_no_2`, `reservation_no_3`, `reservation_no_4`, `reservation_no_5`, `batch_no`, `quantity`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, Part_no.toUpperCase());
                        ps.setString(3, Lot_no.toUpperCase());
                        ps.setString(4, Production_order1.toUpperCase());
                        ps.setString(5, Production_order2.toUpperCase());
                        ps.setString(6, Production_order3.toUpperCase());
                        ps.setString(7, Production_order4.toUpperCase());
                        ps.setString(8, Production_order5.toUpperCase());
                        ps.setString(9, Reservation_no1.toUpperCase());
                        ps.setString(10, Reservation_no2.toUpperCase());
                        ps.setString(11, Reservation_no3.toUpperCase());
                        ps.setString(12, Reservation_no4.toUpperCase());
                        ps.setString(13, Reservation_no5.toUpperCase());
                        ps.setString(14, Batch_no.toUpperCase());
                        ps.setString(15, Quantity.toUpperCase());
                        ps.setString(16, user_name.toUpperCase());
                        ps.setString(17, currDate);
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
                          case 19: {
//                        out.print("users");
                        String Plant_key = request.getParameter("Plant_key");
                        String Ref_id = request.getParameter("Ref_id");
                        String Part_no = request.getParameter("Part_no");
                        String Kit_status = request.getParameter("Kit_status");
                        String date = request.getParameter("date");
                        String Production_order_status = request.getParameter("Production_order_status");
                        String Remarks = request.getParameter("Remarks");

                        PreparedStatement ps = con.prepareStatement("INSERT INTO `planning_process`(`plant_key`, `ref_if`, `part_no`, `kit_status`, `kit_date`, `production_order_status`, `remark`, `added_by`, `added_date`) VALUES (?,?,?,?,?,?,?,?,?)");
                        ps.setString(1, Plant_key.toUpperCase());
                        ps.setString(2, Ref_id.toUpperCase());
                        ps.setString(3, Part_no.toUpperCase());
                        ps.setString(4, Kit_status.toUpperCase());
                        ps.setString(5, date);
                        ps.setString(6, Production_order_status.toUpperCase());
                        ps.setString(7, Remarks.toUpperCase());
                        ps.setString(8, user_name.toUpperCase());
                        ps.setString(9, currDate);
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
