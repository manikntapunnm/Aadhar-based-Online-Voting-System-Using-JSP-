<%-- 
    Document   : user-profile
    Created on : 05-Aug-2023, 10:43:09 am
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ELECTIONS - Consulting HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner"
            class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://localhost:3306/fvms";
        String username = "root";
        String dbpassword = "Durga@123";
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, username, dbpassword);

        String aadhar = (String) session.getAttribute("aadhar");

        String query = "SELECT * FROM voters WHERE aadhar = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, aadhar);
        rs = ps.executeQuery();

        if (rs.next()) {
            String name = rs.getString("name");
            String phone = rs.getString("phone");
            String email = rs.getString("email");
            int age = rs.getInt("age");
            String address = rs.getString("address");
            String password = rs.getString("password");
          
//              out.println("Name: " + name);
//        out.println("Phone: " + phone);
//        out.println("Email: " + email);
//        out.println("Age: " + age);
//        out.println("Address: " + address);
         Blob imageBlob = rs.getBlob("image");
        byte[] imageData = null;
        if (imageBlob != null) {
            imageData = imageBlob.getBytes(1, (int) imageBlob.length());
        }
%>
            
        

        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="index.jsp" class="navbar-brand p-0">
                    <h1 class="m-0">iVote</h1>
                                        <style>
    .sub-menu {
        list-style: none;
        margin: 0;
        padding: 0;
        display: none; /* Hide the dropdown by default */
        position: absolute;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }
    .nav-item:hover .sub-menu {
        display: block; /* Show the dropdown on hover */
    }
    .sub-menu li {
        margin: 0;
        padding: 10px;
    }
</style>

<ul class="nav">
    <li class="nav-item">
        <a href="" class="nav-link"></a>
        <!-- Dropdown menu -->
        <ul class="sub-menu">
            <li>
                <p>Aadhar: <%= session.getAttribute("aadhar") %></p>
                <p>First Name: <%= session.getAttribute("name") %></p>
                <p>Email: <%= session.getAttribute("email") %></p>
                <p>Phone: <%= session.getAttribute("phone") %></p>
                
                <p>Voter ID: <%= session.getAttribute("voterid") %></p>
            </li>
        </ul>
    </li>
</ul>
      
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
               <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                       
                        <a href="user-dashboard.jsp" class="nav-item nav-link ">My Dashboard</a>
                        <a href="user-election.jsp" class="nav-item nav-link ">Elections</a>
                        <a href="user-election-result.jsp" class="nav-item nav-link ">Results</a>
                         <a href="user-profile.jsp" class="nav-item nav-link active">My Profile</a>
                        <a href="main-user.jsp" class="nav-item nav-link " style="text-decoration: underline;">Logout</a>
                    </div>
                </div>
            </nav>
            <div class="container-xxl bg-primary page-header">
            </div>
        </div>
        <!-- Navbar & Hero End -->
        
        
         

        

        <div class="text-center main-container col-12 d-flex flex-row justify-content-evenly">
           
                <div class="card image-container col-4 text-center mb-5" style="box-shadow: 1px 0px 10px 0px rgba(175, 240, 231, 0.9);margin-top: 10px;"><br>
    <form action="user-profile-action.jsp" method="post" enctype="multipart/form-data">
        <img style="border-radius: 50%; width:150px; height:150px;" class="m-auto" src="data:image/png;base64,<%= (imageData != null) ? Base64.getEncoder().encodeToString(imageData) : "" %>">
        <h5 style="font-size: 45px; font-family:'Courier New', Courier, monospace"><%= rs.getString("name") %></h5><br>
        <div class="col-6 m-auto">
            <label style="margin-left:-100px;">Upload Profile Pic: </label>
            <input type="file" name="image" class="form-control mb-2" required /><br>
            <input type="hidden" name="aadhar" value="<%= aadhar %>">
            <input type="submit" value="Upload" class="btn btn-primary mb-5" />
        </div>
    </form>
</div>

            <div class="form-container col-5 mb-5" style="margin-top:10px;">
               <form action="user-profile-action.jsp" method="post" enctype="multipart/form-data">
                    <div class="card" style="box-shadow: 1px 0px 10px 0px rgba(175, 240, 231, 0.9);">
                        <div class="row card-body">
                            <h1 class="h1 mt-3 mb-4"
                                style="font-family:Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;"><%= rs.getString("name") %>
                                Profile</h1>
                            <div class="">
                                <label class="d-flex text-left">User Name:</label>
                                <input class='form-control' type='text' value="<%= rs.getString("name") %>"  name="name"/><br>
                                <label class="d-flex text-left">Phone Number:</label>
                                <input type='text' class="form-control" value="<%= rs.getString("phone") %>" name="phone"/><br>
                                <label class="d-flex text-left">Email:</label>
                                <input type='email' class="form-control" value="<%= rs.getString("email") %>" name="email"/><br>
                                <label class="d-flex text-left">Age:</label>
                                <input type='number' class="form-control" value="<%= rs.getInt("age") %>" name="age"/><br>
                                <label class="d-flex text-left">Address:</label>
                                <input type='text' class="form-control"
                                    value="<%= rs.getString("address") %>"  name="address"/><br>
                                <label class="d-flex text-left">Password:</label>
                                <input type='text' class="form-control"
                                    value="<%= rs.getString("password") %>"  name="password"/><br>
                            </div>

                            <div class="btn-d">
                                <input type="submit" class="btn btn-warning mt-3 button" value="Edit">
                                <br>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred: " + e.getMessage());
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 wow fadeIn" data-wow-delay="0.1s"
            style="margin-top: 6rem;">
            <div class="d-flex flex-column container py-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-5 mx-5">
                        <h5 class="text-white mb-4">Get In Touch</h5>
                        <p><i class="fa fa-map-marker-alt me-3"></i>#2nd Floor, Siris Rd,
                            Near L.B Nagar Metro Station Pillar No A1662,
                            Snehapuri Colony,
                            Hyderabad, Telangana 500074 </p>
                        <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-5">
                        <h5 class="text-white mb-4">Quick Links</h5>
                        <a class="btn btn-link" href="index.jsp">Home</a>
                        <a class="btn btn-link" href="main-about.jsp">About Us</a>
                        <a class="btn btn-link" href="main-contact.jsp">Contact Us</a>
                    </div>
                </div>
            </div>
            
                                
    
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Codebook.in</a>, All Right Reserved.

                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>