<%-- 
    Document   : user-register
    Created on : 05-Aug-2023, 10:43:19 am
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
    <link href="css/user-register.css" rel="stylesheet">
    <script src="js/user-register.js"></script>
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


        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0 col-12"
                style="background-color: #00B98E;">
                <a href="index.jsp" class="navbar-brand p-0">
                    <h1 class="m-0">CODEBOOK.IN</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="index.jsp" class="nav-item nav-link">Home</a>
                        <a href="main-user.jsp" class="nav-item nav-link active">User</a>
                        <a href="main-admin.jsp" class="nav-item nav-link">Admin</a>
                        <a href="main-adout.jsp" class="nav-item nav-link">About</a>
                        <a href="main-contact.jsp" class="nav-item nav-link">Contact</a>
                    </div>
                </div>
            </nav>
        </div>
       <script>
    function validateForm() {
        var name = document.getElementById("name").value;
        var age = document.getElementById("age").value;
        var email = document.getElementById("email").value;
        var phone = document.getElementById("phone").value;
        var address = document.getElementById("address").value;
        var password = document.getElementById("password").value;
        var image = document.getElementById("image").value;
        var voterid = document.getElementById("voterid").value;
        
        if (name === "" || age === "" || email === "" || phone === "" || address === "" || password === "" || image === "" || voterid === "") {
            alert("Please fill out all the required fields.");
            return false;
        }
        
        return true;
    }
</script> 
        <div class="d-flex justify-content-center pt-5">
            <div class="col-5" style="margin-top: 100px;">
                <div>
                    <img src="img/6310507.jpg" style="width:500px; height:500px;" />
                </div>
            </div>

            <div class="card col-6 " style="box-shadow: 1px 0px 8px 0px rgb(94, 230, 89); margin-top:100px;">
                <!--form  action="user-register-action.jsp" name='myForm' onsubmit="return submitForm();" method="post" enctype="multipart/form-data">
                    <div class=" container11">
                        <div class="row">
                            <h1 class="h1 mt-3 mb-4">SignUP</h1>
                            <div class="con d-flex justify-content-">
                                <div class="con-1 col-3 text-left">
                                    <label for="name" style="margin-left: -10px;">Name:</label>
                                    <input class='form-control input-field name1' name='name' id="name"
                                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);" type='text'
                                        placeholder="User Name" required /><br>
                                    <label for="age" style="margin-left: -19px;">Age:</label>
                                    <input type='number' placeholder="Type your Age" name="age" id="age"
                                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                                        class="form-control input-field name1" /><br>
                                    <label for="email" style="margin-left: -10px;">Email:</label>
                                    <input type='email'  class="form-control input-field name1"
                                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);" name="email" id="email"
                                        placeholder="Type your Email-id" required /><br>
                                </div>
                                <div class="con-2 col-3 text-left">
                                    <label  for="phone" class="number1 text-left">Phone:</label>
                                    <input type='text'  placeholder="Type your Number" name="phone" id="phone"
                                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                                        class="form-control input-field number1" required /><br>
                                    <label for="address" class="number1">Address:</label>
                                    <input type='text' placeholder="Type your adress" name="address" id="address"
                                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                                        class="form-control input-field number1" /><br>
                                    <label for ="password" class="number1">Password:</label>
                                    <input type='text' placeholder="Create Password" name='password' id="password" 
                                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                                        class=" form-control input-field number1" required /><br>
                                </div>
                            </div>
                            <div class="col-4">
                                <label  for="image" style="margin-left: 40px;">Upload Profle Pic: </label>
                                <input type="file" class="form-control mb-2" name="image" id="image"
                                    style="margin-left: 58px; box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                                    required />
                            </div>
                            <div class="para col-7" style='margin-left:50px;'>
                                <ol class="text-left ml-auto">
                                    <li>Password length must be atleast 8 characters.</li>
                                    <li>Password must contain one uppercase character. </li>
                                    <li>Password must contain atleast one number.</li>
                                    <li>Password must contain at least 1 special character.</li>
                                </ol>
                            </div>
                            <div>
                               
                                    <button class="btn btn-primary">Submit</button>
                                 
                                <br>
                                <p class="pt-3">Already Have an Account?
                                    <a href="main-user.jsp" class="btn btn-primary">Login</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </form-->
                
         <form action="user-register-action.jsp" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
    <div class="container11">
        <div class="row">
            <h1 class="h1 mt-3 mb-4">Sign Up</h1>
            <div class="con d-flex justify-content-">
                <div class="con-1 col-3 text-left">
                    <label for="name" style="margin-left: -10px;">Name:</label>
                    <input class='form-control input-field name1' name='name' id="name"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);" type='text'
                        placeholder="User Name" required /><br>
                    <label for="age" style="margin-left: -19px;">Age:</label>
                    <input type='number' placeholder="Type your Age" name="age" id="age"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                        class="form-control input-field name1" /><br>
                    <label for="email" style="margin-left: -10px;">Email:</label>
                    <input type='email' class="form-control input-field name1"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);" name="email" id="email"
                        placeholder="Type your Email-id" required /><br>
                     <label for="email" style="margin-left: -10px;">Voterid</label>
                    <input type='text' class="form-control input-field name1"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);" name="voterid" id="voterid"
                        placeholder="Type your Voter-id" required /><br>
                </div>
                <div class="con-2 col-3 text-left">
                    <label for="phone" class="number1 text-left">Phone:</label>
                    <input type='text' placeholder="Type your Number" name="phone" id="phone"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                        class="form-control input-field number1" required /><br>
                    <label for="address" class="number1">Address:</label>
                    <input type='text' placeholder="Type your address" name="address" id="address"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                        class="form-control input-field number1" /><br>
                       <label for="aadhar" class="number1">Aadhaar:</label>
                    <input type='text' placeholder="Type your aadhar" name="aadhar" id="aadhar"
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                        class="form-control input-field number1" /><br>
                   
                    <label for="password" class="number1">Password:</label>
                    <input type='password' placeholder="Create Password" name='password' id="password" 
                        style="box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                        class="form-control input-field number1" required /><br>
                </div>
            </div>
            <div class="col-4">
                <label for="image" style="margin-left: 40px;">Upload Profile Pic: </label>
                <input type="file" class="form-control mb-2" name="image" id="image"
                    style="margin-left: 58px; box-shadow: 1px 0px 8px 0px rgb(183, 241, 181);"
                    required />
            </div>
            <div class="para col-7" style='margin-left:50px;'>
                <ol class="text-left ml-auto">
                    <li>Password length must be at least 8 characters.</li>
                    <li>Password must contain one uppercase character. </li>
                    <li>Password must contain at least one number.</li>
                    <li>Password must contain at least 1 special character.</li>
                </ol>
            </div>
            <div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <br>
                <p class="pt-3">Already Have an Account?
                    <a href="main-user.jsp" class="btn btn-primary">Login</a>
                </p>
            </div>
        </div>
    </div>
</form>

    </div>
        </div>
        <!-- Navbar & Hero End -->
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