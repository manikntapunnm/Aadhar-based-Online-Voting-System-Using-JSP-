<%-- 
    Document   : voter-verify-otp
    Created on : 05-Aug-2023, 10:44:08 am
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
     
  
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

<style>
    .update-password-input-wrapper {
        width: 240px;
        text-align: left;
        display: inline-block;
    }

    .update-password-input-wrapper input {
        padding: 0;
        width: 264px;
        font-size: 32px;
        font-weight: 600;
        color: #3e3e3e;
        background-color: transparent;
        border: 0;
        margin-left: 12px;
        letter-spacing: 48px;
        font-family: sans-serif !important;
    }

    .update-password-input-wrapper input:focus {
        box-shadow: none;
        outline: none;
    }

    .update-password-input-wrapper svg {
        position: relative;
        display: block;
        width: 240px;
        height: 2px;
    }
</style>

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

        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="index.jsp" class="navbar-brand p-0">
                    <h1 class="m-0">iVote</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="user-profile.jsp" class="nav-item nav-link">My Profile</a>
                        <a href="user-dashboard.jsp" class="nav-item nav-link">My Dashboard</a>
                        <a href="user-election.jsp" class="nav-item nav-link active">Elections</a>
                        <a href="user-election-result.jsp" class="nav-item nav-link ">Results</a>
                        <a href="main-user.jsp" class="nav-item nav-link">Logout</a>
                    </div>
                </div>
            </nav>

            <div class="container-xxl bg-primary page-header">
            </div>
        </div>
        <!-- Navbar & Hero End -->

        <!-- Update Password Form Start -->
        <!-- Update Password Form Start -->
        
                  <% HttpSession esession = request.getSession(false);
        String email = (String) esession.getAttribute("email"); 
                String password = (String) esession.getAttribute("password"); 
                %>
                
        <div class="col-4 card d-flex flex-column justify-content-start card-container m-auto"
            style="height: 280px;box-shadow: 1px 0px 8px 0px rgb(55, 83, 83);">
            <div class="card-body align-items-center text-center"><br>
                <div class="update-password-input-wrapper">
                    <form action="update-password-action.jsp" method="post" id="update-password-form">
                        <h6>Enter New Password</h6>
                        <input type="text" name="password" id="new-password" maxlength="20" autocomplete="off">
                        <input type="hidden" name="email" value="<%= email %>">
                        <button type="submit" class="btn btn-primary d-flex m-auto">Update Password</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Update Password Form End -->

        <!-- Update Password Form End -->

        <!-- Footer Start -->
      <div class="container-fluid bg-dark text-light footer pt-5 wow fadeIn" data-wow-delay="0.1s" style="margin-top: 6rem;">
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