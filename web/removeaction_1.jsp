

<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    
    try {
        String url = "jdbc:mysql://localhost:3306/fvms";
        String username = "root";
        String dbpassword = "Durga@123";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, dbpassword);
        Statement st = con.createStatement();
        
        int rowsAffected = st.executeUpdate("DELETE FROM elections WHERE id='" + id + "'");
        
        if (rowsAffected > 0) {
            request.getSession().setAttribute("removeSuccessMessage", "ID removed successfully.");
        } else {
            request.getSession().setAttribute("removeSuccessMessage", "Failed to remove ID.");
        }
        response.sendRedirect("admin-manage-election.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("");
    }
%>
