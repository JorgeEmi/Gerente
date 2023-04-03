<%-- 
    Document   : ActualizarIng
    Created on : 1/04/2023, 10:49:18 AM
    Author     : jorge
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection conn = null;
        String case_status = request.getParameter("case_statusM");
        String case_area = request.getParameter("case_areaM");
        Integer id_user = Integer.parseInt(request.getParameter("id_user"));        
        Integer id = Integer.parseInt(request.getParameter("id_case"));

        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;

        try {
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elet", "root", "n0m3l0");
          
          String query1 = "INSERT INTO tbl_case_admin (case_id, admin_id, case_admin_creation_date) VALUES (?, ?, ?)";
            stmt1 = conn.prepareStatement(query1);
            stmt1.setInt(1, id);
            stmt1.setInt(2, id_user);
            stmt1.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
            
            int rowsInserted = stmt1.executeUpdate();
          
          String query2 = "UPDATE tbl_cases SET case_status=?, case_area=?, case_last_update_date = ? WHERE id_case=?";
                stmt2 = conn.prepareStatement(query2);
                stmt2.setString(1, case_status);
                stmt2.setString(2, case_area);
                stmt2.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
                stmt2.setInt(4, id);
            int rowsUpdated = stmt2.executeUpdate();
            
             // Confirmar la transacción
        
          
        } catch (SQLException ex) {
          ex.printStackTrace();
        } finally {
          if (stmt1 != null) {
            stmt1.close();
          }
          if (stmt2 != null) {
            stmt2.close();
          }
          if (conn != null) {
            conn.close();
          }
        }
%>
        <h>El reporte ha sido asignado a un ingeniero correctamente</h>
        <a href="Soli_Rep.jsp" >El reporte ha sido asignado correctamente, regresar a la sección de reportes pendientes</a>
    </body>
</html>
