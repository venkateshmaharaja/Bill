<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.db_connection"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DB_INSERT</title>
    </head>
    <body>-->
<%
    String result = "";
    String Result1 = "";
    try {
        db_connection obj = new db_connection();
        Connection con = obj.getConnection();
        Statement st = con.createStatement();

        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date dateobj = new Date();
        String currDate = df.format(dateobj);
//                out.print(currDate);

        String mnu = request.getParameter("mnu");
        int mnu_no = Integer.parseInt(mnu);
        int result_pop = 0;

        switch (mnu_no) {
            case 1: {
                String Category_name = request.getParameter("Category_name");
                if (!Category_name.equals("")) {
                    PreparedStatement ps = con.prepareStatement("INSERT INTO `category_master`(`category_name`, `added_date`) VALUES (?,?)");
                    ps.setString(1, Category_name.toUpperCase());
                    ps.setString(2, currDate);
                    try {
                        result_pop = ps.executeUpdate();
                    } catch (SQLException sq) {
                        response.setContentType("text/plain");
                        result = "SQL Error.....";
                        response.getWriter().write(result);
                    }
                }
                break;

            }

            case 2: {
                String Brand_name = request.getParameter("Brand_name");
                if (!Brand_name.equals("")) {
                    PreparedStatement ps = con.prepareStatement("INSERT INTO `brand_master`(`brand_name`, `added_date`) VALUES (?,?)");
                    ps.setString(1, Brand_name.toUpperCase());
                    ps.setString(2, currDate);
                    try {
                        result_pop = ps.executeUpdate();
                    } catch (SQLException sq) {
                        response.setContentType("text/plain");
                        result = "SQL Error.....";
                        response.getWriter().write(result);
                    }
                }
                break;
            }

            default:
                out.println("<script type=\"text/javascript\">");
                out.println("alert('No Menu added');");
//                        out.write("setTimeout(function(){window.location.href='/RCTS/master_input.jsp'},1);");
                out.println("</script>");
        }
        if (result_pop > 0) {
            response.setContentType("text/plain;charset=UTF-8");
            result = "OK" + '&';
            response.getWriter().write(result);
        }

    } catch (Exception ex) {
        response.setContentType("text/plain");
        result = "Error.....";
        response.getWriter().write(result);
    }
%>
<!--</body>-->
<!--</html>-->
