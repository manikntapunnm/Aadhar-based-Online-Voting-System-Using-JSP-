<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Action</title>
</head>
<body>
<%
    String n = request.getParameter("username");
    String p = request.getParameter("password");
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FVMS", "root", "Durga@123");
        ps = con.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
        ps.setString(1, n);
        ps.setString(2, p);
        rs = ps.executeQuery();

        if (rs.next()) {
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("main-admin.jsp");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // Handle the error gracefully, show an error page, or log the error
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
