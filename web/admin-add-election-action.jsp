<%-- 
    Document   : admin-add-election-action
    Created on : 05-Aug-2023, 4:31:05 pm
    Author     : manikanta
--%>


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

    String ename = "";
    String head = "";
    String date = "";
    String constituency = "";
    String area = "";
    String address = "";
    String city = "";
    String state = "";
    String pin = "";
    
   
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
              //  serverFilePath = "C:\\Users\\manikanta\\OneDrive\\Documents\\NetBeansProjects\\FVMS\\build\\web\\img\\voters\\" + uniqueFileName;
                String relativePath = "img/voters/" + uniqueFileName;
                serverFilePath = getServletContext().getRealPath(relativePath);
              item.write(new File(serverFilePath));
                fileName = uniqueFileName;
            } else {
                // Handle form fields
                String fieldName = item.getFieldName();
                String fieldValue = item.getString();
                if ("ename".equals(fieldName)) {
                    ename = fieldValue;
                } else if ("head".equals(fieldName)) {
                    head = fieldValue;
                }else if ("date".equals(fieldName)) {
                    date = fieldValue;
                } else if ("constituency".equals(fieldName)) {
                    constituency = fieldValue;
                } else if ("area".equals(fieldName)) {
                    area = fieldValue;
                }else if ("address".equals(fieldName)) {
                    address = fieldValue;
                } else if ("city".equals(fieldName)) {
                    city = fieldValue;
                }else if ("state".equals(fieldName)) {
                    state = fieldValue;
                }else if ("pin".equals(fieldName)) {
                    pin = fieldValue;
                }
            }
        }

     

        // Insert data into the database
        try (Connection connection = DriverManager.getConnection(dburl, dbusername, dbpassword)) {
     String sql = "INSERT INTO elections(ename, head, date, constituency, area, address, city, state, pin, image, imagename, results) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
try (PreparedStatement statement = connection.prepareStatement(sql)) {
    statement.setString(1, ename);
    statement.setString(2, head);
    statement.setString(3, date);
    statement.setString(4, constituency);
    statement.setString(5, area);
    statement.setString(6, address);
    statement.setString(7, city);
    statement.setString(8, state);
    statement.setString(9, pin);
    
    FileInputStream input = new FileInputStream(serverFilePath);
    statement.setBinaryStream(10, input);
    
    statement.setString(11, fileName);
    statement.setString(12, "Pending");
    
    // Execute the statement
    int rowsInserted = statement.executeUpdate();
    

                
                
            if (rowsInserted > 0) {
    //creates only file
         /* String dashboardURL2 = "user-election-result-graph-" + ename.toLowerCase().replace(" ", "-") + ".jsp";
           String fileContent2 = "This is the content of the new file.\n";
                    fileContent2 += "You can add more content here as needed.";

                    // Define the file path
                   // String filePath2 = getServletContext().getRealPath("/") + "C:\\Users\\manikanta\\OneDrive\\Documents\\NetBeansProjects\\FVMS\\web\\" + dashboardURL;
                   String filePath2= getServletContext().getRealPath("/") + "/" + dashboardURL2;

                    // Write the content to the file
                    try {
                        FileWriter writer = new FileWriter(filePath2);
                        writer.write(fileContent2);
                        writer.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
         
        
        // String sourceFilePath = "/user-ghmc-candidates.jsp"; // Specify the path to the source file
   // creates file with data
        String dashboardURL = "user-" + ename.toLowerCase().replace(" ", "-") + "-candidates.jsp";
    
    // Define the source file path
    String sourceFilePath = getServletContext().getRealPath("/") + "/user-ghmc-candidates.jsp"; // Replace with the actual source file path

    // Read the content from the source file
    StringBuilder fileContentBuilder = new StringBuilder();
    try (BufferedReader reader = new BufferedReader(new FileReader(sourceFilePath))) {
        String line;
        while ((line = reader.readLine()) != null) {
            fileContentBuilder.append(line).append("\n");
        }
    } catch (IOException e) {
        e.printStackTrace();
        out.println("Error reading source file: " + e.getMessage());
        return;
    }

    String fileContent = fileContentBuilder.toString();

    // Define the destination file path
    String destinationFilePath = getServletContext().getRealPath("/") + "/" + dashboardURL;

    // Write the content to the new file
    try {
        FileWriter writer = new FileWriter(destinationFilePath);
        writer.write(fileContent);
        writer.close();
        out.println("File created successfully at: " + destinationFilePath);
    } catch (IOException e) {
        e.printStackTrace();
        out.println("Error creating file: " + e.getMessage());
    }
    
    
    */
    
    
    
    
        
               String voteURL = "vote" + ename.toLowerCase().replace(" ", "");

            // Alter the table to add a new column with default value 'Pending'
            String alterSql = "ALTER TABLE voters ADD COLUMN " + voteURL + " VARCHAR(255) DEFAULT 'Pending'";
            try (PreparedStatement alterStatement = connection.prepareStatement(alterSql)) {
                alterStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
         
         
                String successMessage = "New election Added Successfully.";
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'success',");
                out.println("  title: 'Success',");
                out.println("  text: '" + successMessage + "',");
                out.println("}).then(function() { window.location.href = 'admin-manage-election.jsp'; });");
                out.println("</script>");
    } else {
      String successMessage = "New election Adding Failed.";
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'error',");
                out.println("  title: 'Failed',");
                out.println("  text: '" + successMessage + "',");
                out.println("}).then(function() { window.location.href = 'admin-add-election.jsp'; });");
                out.println("</script>");
        // Insertion failed
    }     

               
                
                
                
                
                
                
                
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p>Error executing database insert: " + e.getMessage() + "</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error connecting to database: " + e.getMessage() + "</p>");
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
