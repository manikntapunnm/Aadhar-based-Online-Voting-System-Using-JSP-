<%-- 
    Document   : user-ghmc-canditates-action
    Created on : 08-Aug-2023, 10:36:42 pm
    Author     : manikanta
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Check Vote Status and Display Alert</title>
    <!-- Include SweetAlert CSS and JavaScript -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.6/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.15.6/dist/sweetalert2.all.min.js"></script>
</head>
<body>

<%
    String electionName = request.getParameter("elections"); // Retrieve election name from request parameter
    String aadhar = request.getParameter("aadhar");
    out.println(electionName);
    out.println(aadhar);
    HttpSession esession = request.getSession();
    session.setAttribute("electionName", electionName);
    session.setAttribute("aadhar", aadhar);

    Connection con = null;
    PreparedStatement ps = null;
    String errorMessage = null;

    try {
        String url = "jdbc:mysql://localhost:3306/fvms";
        String username = "root";
        String dbpassword = "Durga@123";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, username, dbpassword);

        // Logic to retrieve vote status from the elections table
        String voteStatusQuery = "SELECT vote FROM elections WHERE aadhar = ?";
        ps = con.prepareStatement(voteStatusQuery);
        ps.setString(1, aadhar);
        ResultSet resultSet = ps.executeQuery();

        String voteghmc = "Pending"; // Default value
        if (resultSet.next()) {
            String retrievedVote = resultSet.getString("voteghmc");
            if (retrievedVote != null) {
                voteghmc = retrievedVote;
            }
        }

        resultSet.close();
        ps.close();
        con.close();

        if (voteghmc.equals("Pending")) {
            errorMessage = "You are allowed to vote in " + electionName + " election.";
        } else if (voteghmc.equals("Voted")) {
            errorMessage = "You have already voted.";
        } else {
            errorMessage = "Voter is invalid.";
        }
    } catch ( SQLException e) {
        // Handle any database-related errors here and display an error message using getMessage()
        String errorMessage2 = e.getMessage();
        out.println("Error: " + errorMessage2);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        errorMessage = "Error: Class not found. Please contact the administrator.";
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errorMessage = "Error: Database connection closure failed.";
        }
    }

    // Display SweetAlert based on errorMessage
    if (errorMessage != null) {
%>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Oops',
            text: '<%= errorMessage %>',
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'user-ghmc-canditates.jsp';
            }
        });
    </script>
<%
    }
%>

</body>
</html>
