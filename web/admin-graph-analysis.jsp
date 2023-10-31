<%-- 
    Document   : admin-graph-analysis
    Created on : 05-Aug-2023, 10:38:32 am
    Author     : manikanta
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
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
    <!-- Graph -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>

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
                    <input class="form-control border-0" type="search" placeholder="Search">
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

            <%
String DB_URL = "jdbc:mysql://localhost:3306/fvms";
String DB_USER = "root";
String DB_PASSWORD = "Durga@123";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    // Retrieve the image from the appropriate table
    String sql = "SELECT * FROM elections ";
    PreparedStatement statement = connection.prepareStatement(sql);
    ResultSet rs = statement.executeQuery();
%>
            <!-- result start-->

            <div class="col-12 mt-5  m-auto">
                <div class="row">
                    <div class="col tablebg">
                        <div class="card text-center">
                            <div class="table-responsive">
                                <table class="table table-striped project-orders-table"
                                    style="box-shadow: 1px 0px 8px 0px rgb(58, 97, 57);">
                                    <thead>
                                        <tr>
                                            <th style="text-align:center;">S.No</th>
                                            <th style="text-align:center;">Election Name</th>
                                            <th style="text-align:center;">Constituency</th>
                                            <th style="text-align:center;">Date</th>
                                            <th style="text-align:center;">Results</th>
                                            <th style="text-align:center;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                                                                            <%
    int sNo = 1;
    while (rs.next()) {
    
    
      String results = rs.getString(13);
      

            String ename = rs.getString("ename");
            session.setAttribute("ename", ename);
                        
                        String candidates = rs.getString("candidates");
                        String date = rs.getString("date");
                        
                       
                        //String party =rs.getString("pname");   //user-election-result-graph-mla.jsp
                        
                         String dashboardURL = "user-election-result-graph-" + ename.toLowerCase().replace(" ", "-") + ".jsp";
                        String voteURL = "vote" + ename.toLowerCase().replace(" ", "");
                        String sessionVoteURL = (String) session.getAttribute(voteURL);
                        
     
    
        %>
                                                                            <tr>
                                        <td><%= sNo++ %></td>
                                         <td><%= rs.getString("ename") %></td>
                                        <td><%= rs.getString("constituency") %></td>
                                        <td><%= rs.getString("date") %></td>
                                        <td style="color:
  <% String status = rs.getString("results");
    if (status.equalsIgnoreCase("Pending")) {
      out.print("orange");
    } else if (status.equalsIgnoreCase("Declared")) {
      out.print("green");
    } else if (status.equalsIgnoreCase("Suspended")) {
      out.print("red");
    } else {
      out.print("black"); // Default color if status doesn't match any condition
    }
  %>
  ">
  <%= results %>
</td>
                                        <td>
                                           
                                                
                                            <a href="<% if (results.equalsIgnoreCase("Declared")) { %><%= dashboardURL %><% } else { %>javascript:void(0);<% } %>" 
   <% if (!results.equalsIgnoreCase("Declared")) { %>onclick="showErrorAlert();"<% } else { %><% } %>>
   <button class="btn btn-primary">View Result</button>
</a>

<script>
    function showErrorAlert() {
        Swal.fire({
            icon: 'error',
            title: 'Results Not Declared',
            text: 'The election results have not been declared yet.',
        });
    }
    
function showSuccessAlert() {
    Swal.fire({
        icon: 'success',
        title: 'Results Declared',
        text: 'The election results have been declared. Click OK to continue.',
        showCancelButton: false,
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK',
    }).then(function(result) {
        if (result.isConfirmed) {
            <%-- Set a session attribute here --%>
            <% session.setAttribute("alertMessage", "Election results have been declared successfully."); %>
            window.location.href = '<%= dashboardURL %>';
        }
    });
}


</script>
 
                                        </td>
                                    </tr>
                                    
                                                          
                                                              <%
                                                                  }

    // Close resources
    rs.close();
    statement.close();
    connection.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>
                                        </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- result End -->

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