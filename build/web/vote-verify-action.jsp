<%--@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.net.*, java.io.*, java.util.Random" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Action</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
<%
    String phone = request.getParameter("phone");
    String aadhar = request.getParameter("aadhar");
    String voterid = request.getParameter("voterid");        
    Connection con = null;
    PreparedStatement psSelect = null;
    PreparedStatement psUpdate = null;
    
    String characters2 = "123456789";
    int otpLength = 4;
    StringBuilder otpBuilder = new StringBuilder();
    Random random = new Random();
    for (int i = 0; i < otpLength; i++) {
        int index = random.nextInt(characters2.length());
        otpBuilder.append(characters2.charAt(index));
    }
    String otp = otpBuilder.toString();
            
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fvms", "root", "Durga@123");
        
        // Check if the voters table contains the 'vote' column
        DatabaseMetaData metadata = con.getMetaData();
        ResultSet columns = metadata.getColumns(null, null, "voters", "vote");
        
        if (columns.next()) {
            // Check if the user exists in the voters table
            psSelect = con.prepareStatement("SELECT * FROM voters WHERE phone=? AND aadhar=? AND voterid=?  ");
            psSelect.setString(1, phone);
            psSelect.setString(2, aadhar);
            psSelect.setString(3, voterid);
            ResultSet rs = psSelect.executeQuery();
                
            if (rs.next()) {
                // Check the value of the 'vote' column
                String voteStatus = rs.getString("vote");
                if ("Pending".equals(voteStatus)) {
                    // Update the OTP for the user
                    psUpdate = con.prepareStatement("UPDATE voters SET otp=? WHERE aadhar=?");
                    psUpdate.setString(1, otp);
                    psUpdate.setString(2, aadhar);
                    psUpdate.executeUpdate();
                    
                    
                     String senderid = "CODEBK";
            String username = "Codebook";
            String apikey = "56dbbdc9cea86b276f6c";
            String mobile = phone;
            String message = "Hello " + aadhar + ", your OTP for Vote is " + otp + ". This message is generated from https://www.codebook.in server. Thank you";
            out.println(message);
            
           
            

            try {
                String data = URLEncoder.encode("username", "UTF-8") + "=" + URLEncoder.encode(username, "UTF-8");
                data += "&" + URLEncoder.encode("apikey", "UTF-8") + "=" + URLEncoder.encode(apikey, "UTF-8");
                data += "&" + URLEncoder.encode("mobile", "UTF-8") + "=" + URLEncoder.encode(mobile, "UTF-8");
                data += "&" + URLEncoder.encode("senderid", "UTF-8") + "=" + URLEncoder.encode(senderid, "UTF-8");
                data += "&" + URLEncoder.encode("message", "UTF-8") + "=" + URLEncoder.encode(message, "UTF-8");

                URL url = new URL("https://smslogin.co/v3/api.php");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);

                OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
                wr.write(data);
                wr.flush();

                BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             //   StringBuilder response = new StringBuilder();
             StringBuilder responseBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    //response.append(line);
                     responseBuilder.append(line);
                }
                wr.close();
                reader.close();
                conn.disconnect();

                //out.println("SMS Sent Successfully: " + response.toString());
            } catch (Exception e) {
                e.printStackTrace();
                out.println("Error sending SMS");
            }
            
                    
                    
                    
                    
                    
                    
                    
                    
                    // Redirect to OTP verification page
                    session.setAttribute("phone", phone);
                   // response.sendRedirect("voter-verify-otp.jsp");
                    String successMessage = "Verified successfully.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'success',");
                    out.println("  title: 'Success',");
                    out.println("  text: '" + successMessage + "',");
                    out.println("}).then(function() { window.location.href = 'voter-verify-otp.jsp'; });");
                    out.println("</script>");
                } else {
                    //out.println("Voting has already been completed.");
                    
                       String errorMessage = " Voting has already been completed provided aadhar.";
                    out.println("<script>");
                    out.println("Swal.fire({");
                    out.println("  icon: 'error',");
                    out.println("  title: 'Error',");
                    out.println("  text: '" + errorMessage + "',");
                    out.println("}).then(function() { window.location.href = 'voter-verify.jsp'; });");
                    out.println("</script>");
                }
            } else {
                // Redirect back to the verification page
                response.sendRedirect("vote-verify.jsp");
            }
        } else {
            out.println("Vote column not found in the voters table.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Database Error: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("Class Not Found Error: " + e.getMessage());
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Unknown Error: " + e.getMessage());
    } finally {
        try {
            if (psSelect != null) {
                psSelect.close();
            }
            if (psUpdate != null) {
                psUpdate.close();
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



String senderid = "CODEBK";
            String username = "Codebook";
            String apikey = "56dbbdc9cea86b276f6c";
            String mobile = phone;
            String message = "Hello " + firstname + ", your OTP for account activation is " + otp + ". This message is generated from https://www.codebook.in server. Thank you";
            out.println(message);
            
           
            

            try {
                String data = URLEncoder.encode("username", "UTF-8") + "=" + URLEncoder.encode(username, "UTF-8");
                data += "&" + URLEncoder.encode("apikey", "UTF-8") + "=" + URLEncoder.encode(apikey, "UTF-8");
                data += "&" + URLEncoder.encode("mobile", "UTF-8") + "=" + URLEncoder.encode(mobile, "UTF-8");
                data += "&" + URLEncoder.encode("senderid", "UTF-8") + "=" + URLEncoder.encode(senderid, "UTF-8");
                data += "&" + URLEncoder.encode("message", "UTF-8") + "=" + URLEncoder.encode(message, "UTF-8");

                URL url = new URL("https://smslogin.co/v3/api.php");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("POST");
                conn.setDoOutput(true);

                OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
                wr.write(data);
                wr.flush();

                BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
             //   StringBuilder response = new StringBuilder();
             StringBuilder responseBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    //response.append(line);
                     responseBuilder.append(line);
                }
                wr.close();
                reader.close();
                conn.disconnect();
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, java.net.*, java.io.*, java.util.Random" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Action</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <%--
String ename = request.getParameter("ename");
out.println(ename);
String voteURL2 = "vote" + ename.toLowerCase().replace(" ", "");
out.println(voteURL2);
%>
<%
String voteURL = request.getParameter("voteURL");
out.println(voteURL);
%>
   <%
String sessionVoteURL = request.getParameter("sessionVoteURL");
out.println(sessionVoteURL);
--%>

<%
String pname = request.getParameter("pname");
out.println(pname);
%>
<%
String cname = request.getParameter("cname");
out.println(cname);
%>

<%
    String phone = request.getParameter("phone");
    String aadhar = request.getParameter("aadhar");
    String voterid = request.getParameter("voterid");  
    
    Connection con = null;
    PreparedStatement psSelect = null;
    PreparedStatement psUpdate = null;
    
    String characters2 = "123456789";
    int otpLength = 4;
    StringBuilder otpBuilder = new StringBuilder();
    Random random = new Random();
    for (int i = 0; i < otpLength; i++) {
        int index = random.nextInt(characters2.length());
        otpBuilder.append(characters2.charAt(index));
    }
    String otp = otpBuilder.toString();
            
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fvms", "root", "Durga@123");

        // Check if the user exists in the voters table
        psSelect = con.prepareStatement("SELECT * FROM voters WHERE phone=? AND aadhar=? AND voterid=?");
        psSelect.setString(1, phone);
        psSelect.setString(2, aadhar);
        psSelect.setString(3, voterid);
        ResultSet rs = psSelect.executeQuery();
                
        if (rs.next()) {
            // Check the value of the 'vote' column
            
            String ename = request.getParameter("ename");
            out.println(ename);
            String voteURL = "vote" + ename.toLowerCase().replace(" ", "");
            out.println(voteURL);
            String voteStatus = rs.getString(voteURL);
            if ("Pending".equals(voteStatus)) {
                // Update the OTP for the user
                psUpdate = con.prepareStatement("UPDATE voters SET otp=? WHERE aadhar=?");
                psUpdate.setString(1, otp);
                psUpdate.setString(2, aadhar);
                psUpdate.executeUpdate();
             
                String senderid = "CODEBK";
                String username = "Codebook";
                String apikey = "56dbbdc9cea86b276f6c";
                String mobile = phone;
                String message = "Hello " + aadhar + ", your OTP for Vote is " + otp + ". This message is generated from https://www.codebook.in server. Thank you";
                out.println(message);

                try {
                    String data = URLEncoder.encode("username", "UTF-8") + "=" + URLEncoder.encode(username, "UTF-8");
                    data += "&" + URLEncoder.encode("apikey", "UTF-8") + "=" + URLEncoder.encode(apikey, "UTF-8");
                    data += "&" + URLEncoder.encode("mobile", "UTF-8") + "=" + URLEncoder.encode(mobile, "UTF-8");
                    data += "&" + URLEncoder.encode("senderid", "UTF-8") + "=" + URLEncoder.encode(senderid, "UTF-8");
                    data += "&" + URLEncoder.encode("message", "UTF-8") + "=" + URLEncoder.encode(message, "UTF-8");

                    URL url = new URL("https://smslogin.co/v3/api.php");
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("POST");
                    conn.setDoOutput(true);

                    OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
                    wr.write(data);
                    wr.flush();

                    BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    StringBuilder responseBuilder = new StringBuilder();
                    String line;
                    while ((line = reader.readLine()) != null) {
                        responseBuilder.append(line);
                    }
                    wr.close();
                    reader.close();
                    conn.disconnect();
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error sending SMS");
                }
                    
                // Redirect to OTP verification page
                session.setAttribute("phone", phone);
                session.setAttribute("ename", ename);
                 session.setAttribute("cname", cname);
                  session.setAttribute("pname", pname);
                  
                  
                  
                String successMessage = "Verified successfully.";
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'success',");
                out.println("  title: 'Success',");
                out.println("  text: '" + successMessage + "',");
                out.println("}).then(function() { window.location.href = 'voter-verify-otp.jsp'; });");
                out.println("</script>");
                
                
                //response.sendRedirect("vote-verify-otp.jsp");
                
                
            } else {
                String errorMessage = "Voting has already been completed or invalid credentials.";
                out.println("<script>");
                out.println("Swal.fire({");
                out.println("  icon: 'error',");
                out.println("  title: 'Error',");
                out.println("  text: '" + errorMessage + "',");
                out.println("}).then(function() { window.location.href = 'voter-verify.jsp'; });");
                out.println("</script>");
            }
        } else {
            // Redirect back to the verification page
            response.sendRedirect("vote-verify.jsp");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        try {
            if (psUpdate != null) {
                psUpdate.close();
            }
            if (psSelect != null) {
                psSelect.close();
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
