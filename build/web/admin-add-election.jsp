<%-- 
    Document   : admin-add-election
    Created on : 05-Aug-2023, 10:38:11 am
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
   
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.js"></script>

    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- fontawesome -->
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css"
        integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous">
    <!-- Favicon -->
    <link href="img2/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib2/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib2/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css2/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css2/style.css" rel="stylesheet">
</head>
<script>
    function showAlert() {
        var myText = "New Election was Created";
        alert(myText);
    }
</script>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner"
            class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3" style="width:298px;">
            <nav class="navbar bg-light navbar-light">
                <div class="d-flex align-items-center ms-4 mb-4 m-auto mt-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img2/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">Administrator</h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav" style="width:420px;">
                    <a href="index.jsp" class="nav-item nav-link active"><i
                            class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="fa fa-bank me-2"></i>Election Management</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="admin-add-election.jsp" class="dropdown-item" style="margin-left: 48px;">Add
                                Election</a>
                            <a href="admin-manage-election.jsp" class="dropdown-item" style="margin-left: 48px;">Manage
                                Election</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="fa fa-male me-2"></i>Candidate Management</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="admin-add-canditate.jsp" class="dropdown-item" style="margin-left: 48px;">Add
                                Candidate</a>
                            <a href="admin-manage-candidate.jsp" class="dropdown-item"
                                style="margin-left: 48px;">Manage Candidate</a>
                        </div>
                    </div>
                <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="fa fa-users me-2"></i>Voter Management</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="eligible-voters.jsp" class="dropdown-item"
                                style="margin-left: 48px;">Eligible Voters</a>
                            <a href="admin-newly-registered-voters.jsp" class="dropdown-item" style="margin-left: 48px;">   Newly Registered Voters </a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="fa fa-bar-chart me-2"></i>Results Management</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="admin-view-election-results.jsp" class="dropdown-item"
                                style="margin-left: 48px;">View Election Results</a>
                            <a href="admin-graph-analysis.jsp" class="dropdown-item" style="margin-left: 48px;">Graph
                                Analysis</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.jsp" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" Search">
                </form>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="main-admin.jsp"
                            class="nav-link ">
                            <button class="d-none d-lg-inline-flex btn btn-primary">Logout</button>
                        </a>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->


            <!-- add election start -->
            
            


            <div class="container">
                <div class="col-12">
                    <div class="row">
                        <form action="admin-add-election-action.jsp" method="post" enctype="multipart/form-data" required >
                            <div class="card my-5" style='box-shadow: 1px 0px 8px 0px rgb(55, 83, 83);'>
                                <h2 class="text-center mt-4">Election Registration Form</h2>
                                <div class="col-12">
                                    <div class="d-flex">
                                        <div class="col-5 mx-5 my-5">
                                        <div class="d-flex flex-column">
                                              <label>Election Name:</label>
                                              <input class="form-control" type="text" 
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);'  name="ename" required />
                                          
                                            </div>
                                            <br>
                                            <label>Constituency:</label> 
                                            <input class="form-control" type="text" 
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);'  name="constituency" required />
                            <label class="mt-3">Election Picture:</label>
                                            <input class="form-control mb-3" type="file"
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);' name="image" required />
                                            
                                   </div>
                                        <div class="col-5 mx-3 my-5">
                                            <label>Head of Election:</label>
                                            <input class="form-control mb-3" type="text" 
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);' name="head" required />
                                            <label>Election Date:</label>
                                            
                                            
                                           <input class="form-control mb-3" type="date"
                              style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);' name="date" id="dateInput" required />
                                                       
<script>
    // Get today's date
    const today = new Date();

    // Set the time to midnight
    today.setHours(0, 0, 0, 0);

    // Calculate tomorrow's date by adding one day to today's date
    const tomorrow = new Date(today);
    tomorrow.setDate(tomorrow.getDate() + 1);

    // Format the dates as YYYY-MM-DD (required by the input type="date")
    const formattedToday = today.toISOString().split('T')[0];
    const formattedTomorrow = tomorrow.toISOString().split('T')[0];

    // Get the date input element
    const dateInput = document.getElementById('dateInput');

    // Set the min attribute to either today or tomorrow
    dateInput.setAttribute('min', formattedTomorrow);

    // Add an event listener to validate the selected date
    dateInput.addEventListener('input', function() {
        const selectedDate = new Date(this.value);
        if (selectedDate < tomorrow) {
            this.setCustomValidity('Please select a date from tomorrow or later.');
        } else {
            this.setCustomValidity('');
        }
    });
</script>
                         <label>Area to Conduct Election:</label>
                                            <input class="form-control" type="text" 
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);' name="area" required />
                                        </div>
                                    </div>
                                    <div class="col-11 d-flex flex-column mx-5">
                                        <label>Address: (Exact)</label>
                                        <input class="form-control mb-3" type="text" 
                                            style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);'  name="address" required />
                                    </div>
                                    <div class="d-flex mb-4 mx-5">
                                        <div class="col-4" style="margin-right: 20px;">
                                            <label>City:</label>
                                            <input class="form-control" type="text" 
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);'  name="city" required />
                                        </div>
                                        <div class="col-3" style="margin-right: 20px;">
                                            <label>State:</label>
                                            <input class="form-control" type="text" 
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);' name="state" required />
                                        </div>
                                        <div class="col-3">
                                            <label>Pin Code:</label>
                                            <input class="form-control" type="number"
                                                style='box-shadow: 1px 0px 8px 0px rgb(173, 212, 212);' name="pin" required />
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-primary d-flex m-auto mb-5" 
                                        value="Create New Election" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <!-- add election End -->

            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Codebook.in</a>, All Right Reserved.
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a href="https://htmlcodex.com">Codebook.in</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>