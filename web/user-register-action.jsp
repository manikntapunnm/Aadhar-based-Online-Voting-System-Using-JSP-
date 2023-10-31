<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
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

        String name = "";
        String age = "";
        String phone = "";
        String email = "";
        String aadhar = "";
        String voterid = "";

        String address = "";
        String password = "";

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
                    if ("name".equals(fieldName)) {
                        name = fieldValue;
                    } else if ("age".equals(fieldName)) {
                        age = fieldValue;
                    } else if ("email".equals(fieldName)) {
                        email = fieldValue;
                    } else if ("phone".equals(fieldName)) {
                        phone = fieldValue;
                    } else if ("address".equals(fieldName)) {
                        address = fieldValue;
                    } else if ("password".equals(fieldName)) {
                        password = fieldValue;
                    } else if ("aadhar".equals(fieldName)) {
                        aadhar = fieldValue;
                    } else if ("voterid".equals(fieldName)) {
                        voterid = fieldValue;
                    }
                }
            }

            String characters = "123456789";
            int otpLength = 4;
            StringBuilder otpBuilder = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < otpLength; i++) {
                int index = random.nextInt(characters.length());
                otpBuilder.append(characters.charAt(index));
            }

            String otp = otpBuilder.toString();

            try (Connection connection = DriverManager.getConnection(dburl, dbusername, dbpassword)) {
                // Check if Aadhar or Voter ID already exists
                String checkSql = "SELECT COUNT(*) FROM voters WHERE aadhar = ? OR voterid = ?";
                try (PreparedStatement checkStatement = connection.prepareStatement(checkSql)) {
                    checkStatement.setString(1, aadhar);
                    checkStatement.setString(2, voterid);
                    try (ResultSet resultSet = checkStatement.executeQuery()) {
                        if (resultSet.next()) {
                            int count = resultSet.getInt(1);
                            if (count > 0) {
                                // Display a message indicating that the user already exists
                                String errorMessage = "User with the provided Aadhar or Voter ID already exists.";
                                out.println("<script>");
                                out.println("Swal.fire({");
                                out.println("  icon: 'error',");
                                out.println("  title: 'Error',");
                                out.println("  text: '" + errorMessage + "',");
                                out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
                                out.println("</script>");
                            } else {
                                // Insert data into the database
                                String sql = "INSERT INTO voters (name, age, email, phone, address, password, image, imagename, otp,aadhar,voterid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                                    statement.setString(1, name);
                                    statement.setString(2, age);
                                    statement.setString(3, email);
                                    statement.setString(4, phone);
                                    statement.setString(5, address);
                                    statement.setString(6, password);
                                    FileInputStream input = new FileInputStream(serverFilePath);
                                    statement.setBinaryStream(7, input);
                                    statement.setString(8, fileName);
                                    statement.setString(9, otp);
                                    statement.setString(10, aadhar);
                                    statement.setString(11, voterid);

                                    // Execute the insert statement
                                    statement.executeUpdate();

                                    // Send email and display success message
                                    final String senderEmail = "projects@codebook.in";
                                    final String senderPassword = "frwqvhawrnsxetyk";

                                    Properties props = new Properties();
                                    props.put("mail.smtp.host", "smtp.gmail.com");
                                    props.put("mail.smtp.port", "587");
                                    props.put("mail.smtp.auth", "true");
                                    props.put("mail.smtp.starttls.enable", "true");
                                    props.put("mail.debug", "true");

                                    try {
                                        Session esession = Session.getInstance(props, new javax.mail.Authenticator() {
                                            protected PasswordAuthentication getPasswordAuthentication() {
                                                return new PasswordAuthentication(senderEmail, senderPassword);
                                            }
                                        });

                                        MimeMessage message = new MimeMessage(esession);
                                        message.setFrom(new InternetAddress(senderEmail));
                                        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // Set the recipient's email address
                                        message.setSubject("Registration Successful");
                                        message.setText("Dear " + name + ",\n\nThank you for registering. Your account details are:\nPassword: " + password + "\nOTP:  " + otp);
                                        Transport.send(message);

                                        // Display success message
                                        String successMessage = "Registration Successful. An email has been sent to your registered email.";
                                        out.println("<script>");
                                        out.println("Swal.fire({");
                                        out.println("  icon: 'success',");
                                        out.println("  title: 'Success',");
                                        out.println("  text: '" + successMessage + "',");
                                        out.println("}).then(function() { window.location.href = 'main-user.jsp'; });");
                                        out.println("</script>");
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        out.println("<p>Error sending email: " + e.getMessage() + "</p>");
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                    out.println("<p>Error executing database insert: " + e.getMessage() + "</p>");
                                }
                            }
                        }
                    }
                }
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


<%--

            final String senderEmail = "projects@codebook.in";
                final String senderPassword = "frwqvhawrnsxetyk";
             // Change to your sender email password

                 Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        try {
            Session esession = Session.getInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(senderEmail, senderPassword);
                }
            });

            MimeMessage message = new MimeMessage(esession);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email)); // Set the recipient's email address
            message.setSubject("Registration Successful");
            message.setText("Dear " + name + ",\n\nThank you for registering. Your account details are:\nPassword: " + password + "\nOTP:  " + otp);
            Transport.send(message);

            
            
--%>   


<%--@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
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

String name = "";
String age = "";
String phone = "";
String address = "";
String email = "";
String password = "";
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
                if ("name".equals(fieldName)) {
                    name = fieldValue;
                } else if ("age".equals(fieldName)) {
                    age = fieldValue;
                } else if ("phone".equals(fieldName)) {
                    phone = fieldValue;
                } else if ("address".equals(fieldName)) {
                    address = fieldValue;
                } else if ("email".equals(fieldName)) {
                    email = fieldValue;
                } else if ("password".equals(fieldName)) {
                    password = fieldValue;
                }
            }
        }

        String characters = "123456789";
        int otpLength = 4;
        StringBuilder otpBuilder = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < otpLength; i++) {
            int index = random.nextInt(characters.length());
            otpBuilder.append(characters.charAt(index));
        }

        String otp = otpBuilder.toString();

        // Insert data into the database
        try (Connection connection = DriverManager.getConnection(dburl, dbusername, dbpassword)) {
            String sql = "INSERT INTO voters (name, age, phone, address, email, password, image, imagename, otp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, age);
                statement.setString(3, phone);
                statement.setString(4, address);
                statement.setString(5, email);
                statement.setString(6, password);
                FileInputStream input = new FileInputStream(serverFilePath);
                statement.setBinaryStream(7, input);
                statement.setString(8, fileName);
                statement.setString(9, otp);

                // Execute the insert statement
                statement.executeUpdate();

                // Send email
                final String senderEmail = "projects@codebook.in";
                final String senderPassword = "frwqvhawrnsxetyk";

                Properties props = new Properties();
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.debug", "true");

                try {
                    Session esession = Session.getInstance(props, new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(senderEmail, senderPassword);
                        }
                    });

                    MimeMessage message = new MimeMessage(esession);
                    message.setFrom(new InternetAddress(senderEmail));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                    message.setSubject("Registration Successful");
                    message.setText("Dear " + name + ",\n\nThank you for registering. Your account details are:\nPassword: " + password + "\nOTP:  " + otp);
                    Transport.send(message);

                    // Display success message using SweetAlert2
                    String successMessage = "Registration Successful. An email has been sent to your registered email address.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'success',");
                    out.println("  title: 'Success',");
                    out.println("  text: '" + successMessage + "',");
                    out.println("}).then(function() { window.location.href = 'user-register.jsp'; });");
                    out.println("</script>");
                } catch (MessagingException e) {
                    e.printStackTrace();
                    out.println("<p>Error sending email: " + e.getMessage() + "</p>");
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
</html>--%>

<%--@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    String name = "";
    String age = "";
    String phone = "";
    String email = "";
    String address = "";
    String password = "";
   
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
                if ("name".equals(fieldName)) {
                    name = fieldValue;
                } else if ("age".equals(fieldName)) {
                    age = fieldValue;
                }else if ("email".equals(fieldName)) {
                    email = fieldValue;
                } else if ("phone".equals(fieldName)) {
                    phone = fieldValue;
                } else if ("address".equals(fieldName)) {
                    address = fieldValue;
                } else if ("password".equals(fieldName)) {
                    password = fieldValue;
                }
            }
        }

        String characters = "123456789";
        int otpLength = 4;
        StringBuilder otpBuilder = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < otpLength; i++) {
            int index = random.nextInt(characters.length());
            otpBuilder.append(characters.charAt(index));
        }

        String otp = otpBuilder.toString();

        // Insert data into the database
        try (Connection connection = DriverManager.getConnection(dburl, dbusername, dbpassword)) {
       String sql = "INSERT INTO voters (name, age, email, phone, address, password, image, imagename, otp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
try (PreparedStatement statement = connection.prepareStatement(sql)) {
    statement.setString(1, name);
    statement.setString(2, age);
    statement.setString(3, email); // Changed from "phone"
    statement.setString(4, phone); // Changed from "address"
    statement.setString(5, address); // Changed from "password"
    statement.setString(6, password); // Properly set the password parameter
    FileInputStream input = new FileInputStream(serverFilePath);
    statement.setBinaryStream(7, input);
    statement.setString(8, fileName);
    statement.setString(9, otp);

                // Execute the insert statement
                statement.executeUpdate();
                
                
                
                
                
                
                
                
                
                
                
                
                
                

                // Display success message using SweetAlert2
                String successMessage = "Registration Successful.";
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'success',");
                out.println("  title: 'Success',");
                out.println("  text: '" + successMessage + "',");
                out.println("}).then(function() { window.location.href = 'user-register.jsp'; });");
                out.println("</script>");
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
</html>--%>




