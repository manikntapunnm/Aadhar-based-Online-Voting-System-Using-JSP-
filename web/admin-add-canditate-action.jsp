<%-- 
    Document   : admin-add-canditate-action
    Created on : 05-Aug-2023, 8:12:57 pm
    Author     : manikanta




<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Example using CDN link -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
<%
try {
    // Database connection parameters
    String dburl = "jdbc:mysql://localhost:3306/fvms";
    String dbusername = "root";
    String dbpassword = "Durga@123";

    Class.forName("com.mysql.cj.jdbc.Driver");

    String cname = "";
    String ename = "";
    String pname = "";

    
   
    String serverFilePath = "";
    String fileName = "";

    // Check if the request contains multipart data
    if (ServletFileUpload.isMultipartContent(request)) {
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set the maximum allowed file size (in bytes)
        upload.setSizeMax(5600456); // Adjust the size limit as needed

        List<FileItem> items = upload.parseRequest(request);

        for (FileItem item : items) {
            if (!item.isFormField()) {
                // Handle file upload
                String originalFileName = new File(item.getName()).getName();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                String timeStamp = dateFormat.format(new Date());
                String truncatedTimeStamp = timeStamp.substring(8, 13); // Extract 5 digits from the timestamp
                String uniqueFileName = truncatedTimeStamp + "_" + originalFileName;
                serverFilePath = "C:\\Users\\manikanta\\OneDrive\\Documents\\NetBeansProjects\\FVMS\\build\\web\\img\\voters\\" + uniqueFileName;
                item.write(new File(serverFilePath));
                fileName = uniqueFileName;
            } else {
                // Handle form fields
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                if ("cname".equals(fieldName)) {
                    cname = fieldValue;
                } else if ("ename".equals(fieldName)) {
                    ename = fieldValue;
                }else if ("pname".equals(fieldName)) {
                    pname = fieldValue;
                } 
            }
        }
//out.println(ename);
     

        // Get the current count of candidates in the candidates table
     // Get the current count of candidates for a specific ename in the candidates table




            // Insert data into the database
            String sql = "INSERT INTO candidates(cname, ename, pname, image, imagename) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, cname);
                statement.setString(2, ename);
                statement.setString(3, pname);
                FileInputStream input = new FileInputStream(serverFilePath);
                statement.setBinaryStream(4, input);
                statement.setString(5, fileName);

                // Execute the statement
                int rowsInserted = statement.executeUpdate();

                if (rowsInserted > 0) {
                    // Insertion was successful

                    // Update the number of candidates in the elections table
                    String updateElectionQuery = "UPDATE elections SET candidates = ?  WHERE ename = ?";
                    try (PreparedStatement updateStatement = connection.prepareStatement(updateElectionQuery)) {
                        updateStatement.setInt(1, currentCandidatesCount + 1);
                        updateStatement.setString(2, ename);
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
                            out.println("}).then(function() { window.location.href = 'admin-manage-candidate.jsp'; });");
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
                            out.println("}).then(function() { window.location.href = 'admin-add-candidate.jsp'; });");
                            out.println("</script>");
                        }
                    }
                } else {
                    // Insertion failed
                    // Display error message and redirect
                    String errorMessage = "New Candidate Adding Failed.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'error',");
                    out.println("  title: 'Failed',");
                    out.println("  text: '" + errorMessage + "',");
                    out.println("}).then(function() { window.location.href = 'admin-add-candidate.jsp'; });");
                    out.println("</script>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error executing database insert: " + e.getMessage() + "</p>");
        }
    }
} catch (FileUploadException e) {
    e.printStackTrace();
    out.println("<p>Error parsing file upload: " + e.getMessage() + "</p>");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>Unexpected error: " + e.getMessage() + "</p>");
}
%>
</body>
</html>--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Example using CDN link -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
<%
try {
    // Database connection parameters
    String dburl = "jdbc:mysql://localhost:3306/fvms";
    String dbusername = "root";
    String dbpassword = "Durga@123";

    Class.forName("com.mysql.cj.jdbc.Driver");

    String cname = "";
    String ename = "";
    String pname = "";

    String serverFilePath = "";
    String fileName = "";

    // Check if the request contains multipart data
    if (ServletFileUpload.isMultipartContent(request)) {
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set the maximum allowed file size (in bytes)
        upload.setSizeMax(5600456); // Adjust the size limit as needed

        List<FileItem> items = upload.parseRequest(request);

        for (FileItem item : items) {
            if (!item.isFormField()) {
                // Handle file upload
                String originalFileName = new File(item.getName()).getName();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                String timeStamp = dateFormat.format(new Date());
                String truncatedTimeStamp = timeStamp.substring(8, 13); // Extract 5 digits from the timestamp
                String uniqueFileName = truncatedTimeStamp + "_" + originalFileName;
                serverFilePath = "C:\\Users\\manikanta\\OneDrive\\Documents\\NetBeansProjects\\FVMS\\build\\web\\img\\voters\\" + uniqueFileName;
                item.write(new File(serverFilePath));
                fileName = uniqueFileName;
            } else {
                // Handle form fields
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                if ("cname".equals(fieldName)) {
                    cname = fieldValue;
                } else if ("ename".equals(fieldName)) {
                    ename = fieldValue;
                } else if ("pname".equals(fieldName)) {
                    pname = fieldValue;
                } 
            }
        }

        // Insert data into the database
        String sql = "INSERT INTO candidates(cname, ename, pname, image, imagename) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(dburl, dbusername, dbpassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, cname);
            statement.setString(2, ename);
            statement.setString(3, pname);
            FileInputStream input = new FileInputStream(serverFilePath);
            statement.setBinaryStream(4, input);
            statement.setString(5, fileName);

            // Execute the statement
            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                // Update the number of candidates in the elections table
                int currentCandidatesCount = 0;
                String enameToCount = ename; // Use the ename of the candidate being inserted
                String countQuery = "SELECT COUNT(*) AS candidate_count FROM candidates WHERE ename = ?";
                try (PreparedStatement countStatement = connection.prepareStatement(countQuery)) {
                    countStatement.setString(1, enameToCount);
                    try (ResultSet resultSet = countStatement.executeQuery()) {
                        if (resultSet.next()) {
                            currentCandidatesCount = resultSet.getInt("candidate_count");
                        }
                    }
                }

                String updateElectionQuery = "UPDATE elections SET candidates = ? WHERE ename = ?";
                try (PreparedStatement updateStatement = connection.prepareStatement(updateElectionQuery)) {
                    updateStatement.setInt(1, currentCandidatesCount);
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
                        out.println("}).then(function() { window.location.href = 'admin-manage-candidate.jsp'; });");
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
                        out.println("}).then(function() { window.location.href = 'admin-add-candidate.jsp'; });");
                        out.println("</script>");
                    }
                }
            } else {
                // Insertion failed
                // Display error message and redirect
                String errorMessage = "New Candidate Adding Failed.";
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'error',");
                out.println("  title: 'Failed',");
                out.println("  text: '" + errorMessage + "',");
                out.println("}).then(function() { window.location.href = 'admin-add-candidate.jsp'; });");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error executing database insert: " + e.getMessage() + "</p>");
        }
    }
} catch (FileUploadException e) {
    e.printStackTrace();
    out.println("<p>Error parsing file upload: " + e.getMessage() + "</p>");
} catch (Exception e) {
    e.printStackTrace();
    out.println("<p>Unexpected error: " + e.getMessage() + "</p>");
}
%>
</body>
</html>
