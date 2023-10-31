<%-- 
    Document   : otp-validate
    Created on : 08-Aug-2023, 5:37:55 pm
    Author     : manikanta
--%>

<%--@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>OTP Validation</title>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    

<%
    // Retrieve entered OTP from the form submission
    String enteredOTP = request.getParameter("otp-input");
    String phone = (String) session.getAttribute("phone");
    String pname = request.getParameter("pname");
    String cname = request.getParameter("cname");
    String ename = request.getParameter("ename");

    // Establish a database connection (make sure to replace these values with your actual database configuration)
    String jdbcUrl = "jdbc:mysql://localhost:3306/fvms";
    String dbUser = "root";
    String dbPassword = "Durga@123";

    try {
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        // Query the database for the actual OTP associated with the voter's mobile number
        PreparedStatement statement = connection.prepareStatement("SELECT otp FROM voters WHERE phone = ?");
        statement.setString(1, phone); // Replace with actual mobile number
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String actualOTP = resultSet.getString("otp");

            if (actualOTP.equals(enteredOTP)) {
                // Update voter's vote status from "Pending" to "Voted"
                String voteURL = "vote" + ename.toLowerCase().replace(" ", "");
                PreparedStatement updateStatement = connection.prepareStatement("UPDATE voters SET " + voteURL + " = ? WHERE phone = ?");
                updateStatement.setString(1, "Voted");
                updateStatement.setString(2, phone);
                updateStatement.executeUpdate();
                
                
                   int currentVotes = 0;
                String enameToCount = ename; // Use the ename of the candidate being inserted
                String countQuery = "SELECT COUNT(*) AS votecount FROM voters WHERE phone=?";
                try (PreparedStatement countStatement = connection.prepareStatement(countQuery)) {
                    countStatement.setString(1, enameToCount);
                    try (ResultSet resultSet2 = countStatement.executeQuery()) {
                        if (resultSet.next()) {
                            currentVotes = resultSet.getInt("votecount");
                        }
                    }
                }

                String updateElectionQuery = "UPDATE candidates SET votes = ? WHERE ename = ?AND pname=? And cname?";
                try (PreparedStatement updateStatement2 = connection.prepareStatement(updateElectionQuery)) {
                    updateStatement.setInt(1, currentVotes);
                    updateStatement.setString(2, enameToCount);
                    int rowsUpdated = updateStatement.executeUpdate();

                    if (rowsUpdated > 0) {
                        // Election update was successful
                        // Display success message using SweetAlert2
                        String successMessage = "New Candidate Added Successfully.";
                        out.println("<script>");
                        out.println("Swal.fire({");
                        out.println("  icon: 'success',");
                        out.println("  title: 'Success',");
                        out.println("  text: '" + successMessage + "',");
                        out.println("}).then(function() { window.location.href = 'user-election.jsp'; });");
                        out.println("</script>");
                    } else {
                        // Election update failed
                        // Display error message and redirect
                        String errorMessage = "Failed to update the number of candidates for the election.";
                        out.println("<script>");
                        out.println("Swal.fire({");
                        out.println("  icon: 'error',");
                        out.println("  title: 'Failed',");
                        out.println("  text: '" + errorMessage + "',");
                        out.println("}).then(function() { window.location.href = 'voter-verify-otp.jsp'; });");
                        out.println("</script>");
                    }
                }
                    
                    
                    
                    
                          String successMessage = "Voted successfully.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'success',");
                    out.println("  title: 'Success',");
                    out.println("  text: '" + successMessage + "',");
                    out.println("}).then(function() { window.location.href = 'user-election.jsp'; });");
                    out.println("</script>");
                    
                    //response.sendRedirect("user-election.jsp"); // Redirect to a thank-you page
                } else {
                
                       String errorMessage = " Voting has already been completed provided aadhar.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'error',");
                    out.println("  title: 'Error',");
                    out.println("  text: '" + errorMessage + "',");
                    out.println("}).then(function() { window.location.href = 'voter-verify-otp.jsp'; });");
                    out.println("</script>");
                  //  response.sendRedirect("voter-verify-otp.jsp"); // Redirect back to the OTP form with an error message
                }
            } else {
                response.sendRedirect("index.jsp"); // Redirect back to the OTP form with an error message
            }
        
            resultSet.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors appropriately
        }
    %>
</body>
</html>--%>


<%--@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>OTP Validation</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>

<%
    // Retrieve entered OTP from the form submission
    String enteredOTP = request.getParameter("otp-input");
    String phone = (String) session.getAttribute("phone");
     String pname = (String) session.getAttribute("pname");
      String cname = (String) session.getAttribute("cname");
       String ename = (String) session.getAttribute("ename");
    
    
    out.println(ename);
    out.println(cname);
    out.println(pname);

    // Establish a database connection (make sure to replace these values with your actual database configuration)
    String jdbcUrl = "jdbc:mysql://localhost:3306/fvms";
    String dbUser = "root";
    String dbPassword = "Durga@123";

    try {
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        // Query the database for the actual OTP associated with the voter's mobile number
        PreparedStatement statement = connection.prepareStatement("SELECT otp FROM voters WHERE phone = ?");
        statement.setString(1, phone); // Replace with actual mobile number
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String actualOTP = resultSet.getString("otp");

            if (actualOTP.equals(enteredOTP)) {
                // Update voter's vote status from "Pending" to "Voted"
                String voteURL = "vote" + ename.toLowerCase().replace(" ", "");
                PreparedStatement updateStatement = connection.prepareStatement("UPDATE voters SET " + voteURL + " = ? WHERE phone = ?");
                updateStatement.setString(1, "Voted");
                updateStatement.setString(2, phone);
                updateStatement.executeUpdate();
                
                // Update vote count for the candidate in the candidates table
                int currentVotes = 0;
                String enameToCount = ename; // Use the ename of the candidate being inserted
                String countQuery = "SELECT COUNT(*) AS votecount FROM voters WHERE " + voteURL + " = ?";
                try (PreparedStatement countStatement = connection.prepareStatement(countQuery)) {
                    countStatement.setString(1, "Voted");
                    try (ResultSet resultSet2 = countStatement.executeQuery()) {
                        if (resultSet2.next()) {
                            currentVotes = resultSet2.getInt("votecount");
                        }
                    }
                }

                String updateElectionQuery = "UPDATE candidates SET votes = ? WHERE ename = ? AND pname = ? AND cname = ?";
                try (PreparedStatement updateStatement2 = connection.prepareStatement(updateElectionQuery)) {
                    updateStatement2.setInt(1, currentVotes);
                    updateStatement2.setString(2, enameToCount);
                    updateStatement2.setString(3, pname);
                    updateStatement2.setString(4, cname);
                    int rowsUpdated = updateStatement2.executeUpdate();

                    if (rowsUpdated > 0) {
                    
                    
                    
                    
                    
                        // Election update was successful
                        // Display success message using SweetAlert2
                        String successMessage = "Vote Count Updated Successfully.";
                        out.println("<script>");
                        out.println("Swal.fire({");
                        out.println("  icon: 'success',");
                        out.println("  title: 'Success',");
                        out.println("  text: '" + successMessage + "',");
                        out.println("}).then(function() { window.location.href = 'user-election.jsp'; });");
                        out.println("</script>");
                    }
                }
            } else {
                // Display error message
                out.println("<script>Swal.fire('Error', 'Invalid OTP', 'error');</script>");
            }
        } else {
            // Display error message
            out.println("<script>Swal.fire('Error', 'Phone number not found', 'error');</script>");
        }

        resultSet.close();
        statement.close();
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
        // Display error message
        out.println("<script>Swal.fire('Error', 'An error occurred', 'error');</script>");
    }
%>

</body>
</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>OTP Validation</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>

<%
    // Retrieve entered OTP from the form submission
    String enteredOTP = request.getParameter("otp-input");
    String phone = (String) session.getAttribute("phone");
    String pname = (String) session.getAttribute("pname");
    String cname = (String) session.getAttribute("cname");
    String ename = (String) session.getAttribute("ename");
    String results = (String) session.getAttribute("results");
    out.println(ename);
    out.println(cname);
    out.println(pname);

    // Establish a database connection (make sure to replace these values with your actual database configuration)
    String jdbcUrl = "jdbc:mysql://localhost:3306/fvms";
    String dbUser = "root";
    String dbPassword = "Durga@123";

    try {
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        // Query the database for the actual OTP associated with the voter's mobile number
        PreparedStatement statement = connection.prepareStatement("SELECT otp FROM voters WHERE phone = ?");
        statement.setString(1, phone); // Replace with actual mobile number
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String actualOTP = resultSet.getString("otp");

            if (actualOTP.equals(enteredOTP)) {
                // Update voter's vote status from "Pending" to "Voted"
                String voteURL = "vote" + ename.toLowerCase().replace(" ", "");
                PreparedStatement updateStatement = connection.prepareStatement("UPDATE voters SET " + voteURL + " = ? WHERE phone = ?");
                updateStatement.setString(1, "Voted");
                updateStatement.setString(2, phone);
                updateStatement.executeUpdate();
                
                // Update vote count for the candidate in the candidates table
                int currentVotes = 0;
                String enameToCount = ename; // Use the ename of the candidate being inserted
                String countQuery = "SELECT COUNT(*) AS votecount FROM voters WHERE " + voteURL + " = ?";
                try (PreparedStatement countStatement = connection.prepareStatement(countQuery)) {
                    countStatement.setString(1, "Voted");
                    try (ResultSet resultSet2 = countStatement.executeQuery()) {
                        if (resultSet2.next()) {
                            currentVotes = resultSet2.getInt("votecount");
                        }
                    }
                }

                String updateElectionQuery = "UPDATE candidates SET votes = ? WHERE ename = ? AND pname = ? AND cname = ?";
                try (PreparedStatement updateStatement2 = connection.prepareStatement(updateElectionQuery)) {
                    updateStatement2.setInt(1, currentVotes);
                    updateStatement2.setString(2, enameToCount);
                    updateStatement2.setString(3, pname);
                    updateStatement2.setString(4, cname);
                    int rowsUpdated = updateStatement2.executeUpdate();

                    if (rowsUpdated > 0) {
                        // Check if all voters have voted for this candidate
                        String votersCountQuery = "SELECT COUNT(*) AS votersCount FROM voters WHERE " + voteURL + " = ?";
                        try (PreparedStatement countVotersStatement = connection.prepareStatement(votersCountQuery)) {
                            countVotersStatement.setString(1, "Voted");
                            try (ResultSet votersCountResult = countVotersStatement.executeQuery()) {
                                if (votersCountResult.next()) {
                                    int votersCount = votersCountResult.getInt("votersCount");
                                    
                                    if (currentVotes == votersCount) {
                                        // Update results in candidates table
                                        String updateResultsQuery = "UPDATE elections SET results = ? WHERE ename = ?";
                                        try (PreparedStatement updateResultsStatement = connection.prepareStatement(updateResultsQuery)) {
                                            updateResultsStatement.setString(1, "Pending");
                                            updateResultsStatement.setString(2, enameToCount);
                                            int resultsUpdated = updateResultsStatement.executeUpdate();
                                            
                                            if (resultsUpdated > 0) {
                                                // Results update was successful
                                                // Display success message using SweetAlert2
                                                String successMessage = "Vote Count and Results Updated Successfully.";
                                                out.println("<script>");
                                                out.println("Swal.fire({");
                                                out.println("  icon: 'success',");
                                                out.println("  title: 'Success',");
                                                out.println("  text: '" + successMessage + "',");
                                                out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
                                                out.println("</script>");
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                // Display error message
                out.println("<script>Swal.fire('Error', 'Invalid OTP', 'error');</script>");
            }
        } else {
            // Display error message
            out.println("<script>Swal.fire('Error', 'Phone number not found', 'error');</script>");
        }

        resultSet.close();
        statement.close();
        connection.close();

    } catch (Exception e) {
        e.printStackTrace();
        // Display error message
       // out.println("<script>Swal.fire('Error', 'An error occurred', 'error');</script>");
        String errorMessage = e.getMessage();
    out.println("Error: " + errorMessage);
    }
%>

</body>
</html>


