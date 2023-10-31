<%--@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Action</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
<%
    String n = request.getParameter("email");
    String p = request.getParameter("password");
      
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FVMS", "root", "Durga@123");
        ps = con.prepareStatement("SELECT * FROM voters WHERE email=? AND password=?");
        ps.setString(1, n);
        ps.setString(2, p);
        rs = ps.executeQuery();

        if (rs.next()) {
   
          
           ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        for (int i = 1; i <= columnCount; i++) {
            String columnName = metaData.getColumnName(i);
            String columnValue = rs.getString(columnName);
            session.setAttribute(columnName, columnValue);
        }
            
            
            
            String action = rs.getString("action"); // Assuming the action field name is "action"
        session.setAttribute("action", action);

        if (action.equals("Accepted")) { // Add this condition
            String successMessage = "Login Successfully";
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  iconHtml: '&#x1F44D',");
            out.println("  title: 'Success',");
            out.println("  text: '" + successMessage + "',");
            out.println("}).then(function() { window.location.href = 'user-election.jsp'; });");
            out.println("</script>");
        } else {
            String errorMessage = "Wait for admin action it will take an hour .";
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  iconHtml: '&#x1F641;',");
            out.println("  title: 'Error',");
            out.println("  text: '" + errorMessage + "',");
            out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
            out.println("</script>");
        }
            
            
            
     
            
            

        } else {
        
          
                    
                    
                    String successMessage = "Login Failed";
out.println("<script>");
out.println("Swal.fire({");
out.println("  iconHtml: '&#x1F641;',"); // Unicode character for crying emoji
out.println("  title: 'Error',");
out.println("  text: '" + successMessage + "',");
out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
out.println("</script>");
             
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
         out.println("<p>Error parsing file upload: " + e.getMessage() + "</p>");
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
</html>--%>









<%--


       
           /* String successMessage = "Login Successfully";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  iconHtml: '&#x1F44D',");
                    out.println("  title: 'Success',");
                    out.println("  text: '" + successMessage + "',");
                    out.println("}).then(function() { window.location.href = 'user-election.jsp'; });");
                    out.println("</script>");*/
                    //response.sendRedirect("user-election.jsp");
          /* String email = rs.getString("email"); // Get email from ResultSet
            session.setAttribute("email", email);
            String phone = rs.getString("phone"); // Get phone from ResultSet
            session.setAttribute("phone", phone);
            String name = rs.getString("name"); // Get name from ResultSet
            session.setAttribute("name", name);
            String voterid = rs.getString("voterid"); // Get voterid from ResultSet
            session.setAttribute("voterid", voterid);
            String voteghmc = rs.getString("voteghmc"); // Get vote from ResultSet
            session.setAttribute("voteghmc", voteghmc);
            String aadhar = rs.getString("aadhar"); // Get aadhar from ResultSet
            session.setAttribute("aadhar", aadhar);
             String votemla = rs.getString("votemla"); // Get vote from ResultSet
            session.setAttribute("votemla", votemla);
             String votemlc = rs.getString("votemlc"); // Get vote from ResultSet
            session.setAttribute("votemlc", votemlc);*/
              //response.sendRedirect("main-user.jsp");
            /* String successMessage = "Login Failed";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'error',");
                    out.println("  title: 'error',");
                    out.println("  text: '" + successMessage + "',");
                    out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
                    out.println("</script>");*/





--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Action</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
<%
    String n = request.getParameter("email");
    String p = request.getParameter("password");
    // Add this line to retrieve the 'id' parameter
out.println(n);
out.println(p);

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FVMS", "root", "Durga@123");
        ps = con.prepareStatement("SELECT * FROM voters WHERE email=? AND password=?");
        ps.setString(1, n);
        ps.setString(2, p);
        rs = ps.executeQuery();

        if (rs.next()) {
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            for (int i = 1; i <= columnCount; i++) {
                String columnName = metaData.getColumnName(i);
                String columnValue = rs.getString(columnName);
                session.setAttribute(columnName, columnValue);
                
                
            }
            
             String action = rs.getString("action");
                session.setAttribute("action", action);


            ps = con.prepareStatement("SELECT * FROM candidates");
          
            rs = ps.executeQuery();

            if (rs.next()) {
                metaData = rs.getMetaData();
                columnCount = metaData.getColumnCount();

                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    String columnValue = rs.getString(columnName);
                    session.setAttribute(columnName, columnValue);
                }
            }

            ps = con.prepareStatement("SELECT * FROM elections");
            
            rs = ps.executeQuery();

            if (rs.next()) {
                metaData = rs.getMetaData();
                columnCount = metaData.getColumnCount();

                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    String columnValue = rs.getString(columnName);
                    session.setAttribute(columnName, columnValue);
                }

               
                if (action.equals("Accepted")) {
                    String successMessage = "Login Successfully";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  iconHtml: '&#x1F44D',");
                    out.println("  title: 'Success',");
                    out.println("  text: '" + successMessage + "',");
                    out.println("}).then(function() { window.location.href = 'user-election.jsp'; });");
                    out.println("</script>");
                } else {
                    String errorMessage = "Wait for admin action. It will take an hour.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  iconHtml: '&#x1F641;',");
                    out.println("  title: 'Error',");
                    out.println("  text: '" + errorMessage + "',");
                    out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
                    out.println("</script>");
                }
            }
        } else {
            String errorMessage = "Login Failed";
            out.println("<script>");
            out.println("Swal.fire({");
            out.println("  iconHtml: '&#x1F641;',");
            out.println("  title: 'Error',");
            out.println("  text: '" + errorMessage + "',");
            out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
            out.println("</script>");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>Error parsing file upload: " + e.getMessage() + "</p>");
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
