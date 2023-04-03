<%-- 
    Document   : Actualizar
    Created on : 1/04/2023, 12:23:28 AM
    Author     : jorge
--%>

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
        PreparedStatement stmt = null;
        String case_status = request.getParameter("case_statusM");
        String case_area = request.getParameter("case_areaM");
        String case_last_update_date = request.getParameter("case_last_update_date");
        Integer id = Integer.parseInt(request.getParameter("id_case"));

        try {
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elet", "root", "n0m3l0");

          String query = "UPDATE tbl_cases SET case_status=?, case_area=?, case_last_update_date WHERE id_case=?";
          stmt = conn.prepareStatement(query);
          stmt.setString(1, case_status);
          stmt.setString(2, case_area);
          stmt.setString(3, case_last_update_date);
          stmt.setInt(4, id);
          stmt.executeUpdate();
        } catch (SQLException ex) {
          ex.printStackTrace();
        } finally {
          if (stmt != null) {
            stmt.close();
          }
          if (conn != null) {
            conn.close();
          }
        }
%>
        <h>El reporte ha sido cambiado de departamento correctamente</h>
        <a href="Soli_Rep.jsp" >Regresar a la solicitud de reporte pendientes</a>
    </body>
    
</html>
