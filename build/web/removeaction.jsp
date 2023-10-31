<%-- 
    Document   : removeaction
    Created on : 28-Jul-2023, 2:35:36?pm
    Author     : manikanta

w/o alert  confirmation

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    Statement st = null;

    String id = request.getParameter("id");
    
    try {
        String url = "jdbc:mysql://localhost:3306/onlineevent";
        String username = "root";
        String dbpassword = "Durga@123";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, username, dbpassword);
        st = con.createStatement();
        
        int rowsAffected = st.executeUpdate("DELETE FROM student WHERE id='" + id + "'");
        
        if (rowsAffected > 0) {
        
        request.getSession().setAttribute("removeSuccessMessage", " ID removed successfully.");
            response.sendRedirect("manage-student.jsp");
        } else {
            response.sendRedirect("manage-student.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("");
    } finally {
        // Close the resources in the reverse order of their creation
        if (st != null) {
            st.close();
        }
        if (con != null) {
            con.close();
        }
    }
%>
--%>

<%--@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    
    try {
        String url = "jdbc:mysql://localhost:3306/fvms";
        String username = "root";
        String dbpassword = "Durga@123";
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, username, dbpassword);
        Statement st = con.createStatement();
        
        int rowsAffected = st.executeUpdate("DELETE FROM candidates WHERE id='" + id + "'");
        
        if (rowsAffected > 0) {
            request.getSession().setAttribute("removeSuccessMessage", "ID removed successfully.");
        } else {
            request.getSession().setAttribute("removeSuccessMessage", "Failed to remove ID.");
        }
        response.sendRedirect("admin-manage-candidate.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("");
    }
--%>

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
        
        // Get the ename of the candidate being deleted
        String enameToDelete = "";
        try (PreparedStatement selectStatement = con.prepareStatement("SELECT ename FROM candidates WHERE id=?")) {
            selectStatement.setString(1, id);
            try (ResultSet resultSet = selectStatement.executeQuery()) {
                if (resultSet.next()) {
                    enameToDelete = resultSet.getString("ename");
                }
            }
        }
        
        // Delete the candidate
        int rowsAffected = st.executeUpdate("DELETE FROM candidates WHERE id='" + id + "'");
        
        if (rowsAffected > 0) {
            // Update the candidate count in the elections table
            int currentCandidatesCount = 0;
            String countQuery = "SELECT COUNT(*) AS candidate_count FROM candidates WHERE ename = ?";
            try (PreparedStatement countStatement = con.prepareStatement(countQuery)) {
                countStatement.setString(1, enameToDelete);
                try (ResultSet resultSet = countStatement.executeQuery()) {
                    if (resultSet.next()) {
                        currentCandidatesCount = resultSet.getInt("candidate_count");
                    }
                }
            }

            String updateElectionQuery = "UPDATE elections SET candidates = ? WHERE ename = ?";
            try (PreparedStatement updateStatement = con.prepareStatement(updateElectionQuery)) {
                updateStatement.setInt(1, currentCandidatesCount);
                updateStatement.setString(2, enameToDelete);
                int rowsUpdated = updateStatement.executeUpdate();

                if (rowsUpdated > 0) {
                    request.getSession().setAttribute("removeSuccessMessage", "Candidate removed successfully.");
                } else {
                    request.getSession().setAttribute("removeSuccessMessage", "Failed to update candidate count.");
                }
            }
        } else {
            request.getSession().setAttribute("removeSuccessMessage", "Failed to remove candidate.");
        }
        response.sendRedirect("admin-manage-candidate.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("");
    }
%>

