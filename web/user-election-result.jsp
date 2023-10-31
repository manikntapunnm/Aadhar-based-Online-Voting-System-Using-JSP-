<%-- 
    Document   : user-election-result
    Created on : 05-Aug-2023, 10:42:29 am
    Author     : manikanta
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
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
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet"> 

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
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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
               <p>candidate: <%= session.getAttribute("cname") %></p>
                <p>head <%= session.getAttribute("head") %></p>
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
                        <a href="user-election-result.jsp" class="nav-item nav-link active">Results</a>
                         <a href="user-profile.jsp" class="nav-item nav-link">My Profile</a>
                        <a href="main-user.jsp" class="nav-item nav-link" style="text-decoration: underline;">Logout</a>
                    </div>
                </div>
            </nav>
            <div class="container-xxl bg-primary page-header">
            </div>
        </div>
        <!-- Navbar & Hero End -->
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


        <div class="col-9 mt-5  m-auto">
            <div class="row">
                <div class="col-md-12 tablebg">
                    <div class="card text-center">
                        <div class="table-responsive">
                            <table class="table table-striped project-orders-table" style="box-shadow: 1px 0px 8px 0px rgb(58, 97, 57);">
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
            //out.println(ename);
                        
                        String candidates = rs.getString("candidates");
                        String date = rs.getString("date");
                        
                       
                        //String party =rs.getString("pname");   //user-election-result-graph-mla.jsp
                        
                        // String dashboardURL = "user-election-result-graph-" + ename.toLowerCase().replace(" ", "-") + ".jsp";
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
                                           
                                                
                                            <a href="<% if (results.equalsIgnoreCase("Declared")) { %>user-election-result-graph.jsp?ename=<%= ename%><% } else { %>javascript:void(0);<% } %>" 
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
            window.location.href = 'user-election-result-graph.jsp';
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