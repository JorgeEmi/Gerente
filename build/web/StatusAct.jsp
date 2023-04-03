<%-- 
    Document   : Status
    Created on : 31/03/2023, 10:53:29 PM
    Author     : jorge
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        Integer id = Integer.parseInt(request.getParameter("id_case"));

        try {
          Class.forName("com.mysql.jdbc.Driver");
          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/elet", "root", "n0m3l0");

          String query = "UPDATE tbl_cases SET case_status=? WHERE id_case=?";
          stmt = conn.prepareStatement(query);
          stmt.setString(1, case_status);
          stmt.setInt(2, id);
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
        <h>El estatus ha sido actualizado correctamente</h>
        <a href="ReporteVyA.jsp?id_case=<%= id %>" >Regresar al Análisis del reporte</a>
        
    </body>
</html>
