<%-- 
    Document   : update-password-action
    Created on : 02-Aug-2023, 4:22:12 pm
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<%
    // Get the new password from the request parameters
    String password = request.getParameter("password");
out.println(password);
    // Validate the password if necessary
    // (e.g., check for length, complexity, etc.)
    // You can add your own validation rules here.

    // Get the user's email and source from the session or request parameters
    String email = (String) session.getAttribute("email");
     // Assuming you pass the "source" parameter from the previous page

    String url = "jdbc:mysql://localhost:3306/fvms";
    String username = "root";
    String dbpassword = "Durga@123";

    // JDBC objects
    Connection connection = null;
    PreparedStatement statement = null;

    try {
        // Update the password in the relevant table based on the source
        String updatePasswordQuery;
        
            updatePasswordQuery = "UPDATE voters SET password=? WHERE email=?";
 
     
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, username, dbpassword);
        statement = connection.prepareStatement(updatePasswordQuery);
        statement.setString(1, password);
        statement.setString(2, email);
        statement.executeUpdate();

        // Redirect to the appropriate success page based on the source
      
//            response.sendRedirect("main-user.jsp");
       // Perform the password update logic

// Display a success SweetAlert2 alert
out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js'></script>");
out.println("<script>");
out.println("Swal.fire({");
out.println("  icon: 'success',");
out.println("  title: 'Success',");
out.println("  text: 'Password updated successfully!',");
out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
out.println("</script>");


    } catch (Exception e) {
        // Handle exceptions here (e.g., show error message, redirect to an error page, etc.)
        e.printStackTrace();
        String errorMessage = e.getMessage();
        out.println("Error: " + errorMessage);
    } finally {
        // Close the database resources
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
             String errorMessage = e.getMessage();
    out.println("Error: " + errorMessage);
        }
    }

    // Function to hash the password using SHA-256 algorithm

%>
