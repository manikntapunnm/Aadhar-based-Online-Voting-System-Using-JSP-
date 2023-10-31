<%-- 
    Document   : eligible-voters
    Created on : 05-Aug-2023, 10:39:37 am
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
    /* Your existing CSS styles... */

    /* Primary color style for the pagination numbers */
    .pagination {
        margin-top: 10px;
        display: inline-block;
        justify-content: center;
         /* Replace with your primary color */
        /* Optional: Add some padding for better visual appearance */
    }
    .pagination a{
        background-color:  #f2f2f2;
    }
    

    .pagination a,
    .pagination span {
        display: inline-block;
        padding: 5px 10px;
        margin-right: 5px;
        text-align: center;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-decoration: none;
        color: #333;
    }

    .pagination a:hover {
        background-color: #007bff;
    }

    .current-page {
        background-color: #007bff;
        color: #fff;
        border-color: #007bff; /* Add border-color property for active page */
    }

    .disabled {
        pointer-events: none;
        opacity: 0.6;
    }

    /* Style for small buttons used as page numbers */
    button.small-button {
        margin: 5px;
        padding: 5px 10px;
        text-decoration: none;
        border: 1px solid #ccc;
        color: #333;
        border-radius: 3px;
        background-color: transparent; /* Set background to transparent to avoid border overlapping */
    }

    /* Style for active small buttons used as active page number */
    button.small-button.active-box {
        background-color: #000;
        color: #fff;
        border-color: #007bff;
    }
</style>
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


            <!-- result start-->

                        <!-- Navbar End -->
                        <%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
            <%
String DB_URL = "jdbc:mysql://localhost:3306/fvms";
String DB_USER = "root";
String DB_PASSWORD = "Durga@123";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    int totalcandidates = 0;
    int requestsPerPage = 5;
    int totalPages = 0;
    int currentPage = 1;
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
        if (currentPage < 1) {
            currentPage = 1;
        }
    }
    int startIndex = (currentPage - 1) * requestsPerPage;
String countQuery = "SELECT COUNT(*) AS total FROM voters where action='Accepted'";

    Statement countStatement = connection.createStatement();
    ResultSet countResult = countStatement.executeQuery(countQuery);
    if (countResult.next()) {
        totalcandidates = countResult.getInt("total");
    }
    countResult.close();
    countStatement.close();
    totalPages = (int) Math.ceil((double) totalcandidates / requestsPerPage);

    // Retrieve the image from the appropriate table
    String sql = "SELECT * FROM voters  where action='Accepted' LIMIT ?, ?";

    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, startIndex);
    statement.setInt(2, requestsPerPage);

    ResultSet resultSet = statement.executeQuery();
%>

            <!-- result start-->

            <div class="col-sm-12 col-xl-12 mt-5 text-center">
                <div class="bg-light rounded h-100 p-4">
                    <h5 class="mb-4">Eligible Voters:</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">S.No</th>
                                <th>Voter Image</th>
                                <th scope="col">Full Name</th>
                                <th>Age</th>
                                <th scope="col">Email</th>
                                <th scope="col">Voter Id</th>
                                <th>Adhaar </th>
                                <th>Action</th>
                                
                                
                                
                            </tr>
                        </thead>
                        <tbody>
                                                              <%
                    int sNo = (currentPage - 1) * requestsPerPage + 1;
                    while (resultSet.next()) {
                     Blob imageBlob = resultSet.getBlob("image");
        byte[] imageData = null;
        if (imageBlob != null) {
            imageData = imageBlob.getBytes(1, (int) imageBlob.length());
        }
                       
                     
                    %>

                            <tr>
                                <th scope="row"><%= sNo++ %></th>
                               <td>     <img style="width:50px; height:50px;" class="img-account-profile rounded-circle mb-2"
                src="data:image/png;base64,<%= (imageData != null) ? Base64.getEncoder().encodeToString(imageData) : "" %>"
                alt=""></td>
                                <td><%= resultSet.getString("name") %></td>
                                <td><%= resultSet.getString("age") %></td>
                                <td><%= resultSet.getString("email") %></td>
                                <td><%= resultSet.getString("voterid") %></td>
                                <td><%= resultSet.getString("aadhar") %></td>
                             
                               <td style="color:
  <% String status = resultSet.getString("action");
    if (status.equalsIgnoreCase("Pending")) {
      out.print("orange");
    } else if (status.equalsIgnoreCase("Accepted")) {
      out.print("green");
    } else if (status.equalsIgnoreCase("Blocked")) {
      out.print("red");
    } else {
      out.print("black"); // Default color if status doesn't match any condition
    }
  %>
  ">
 <%= resultSet.getString("action") %>
</td>
                              
                              
                              
                                                                        </tr>
                            
                            <%}%>
                        </tbody>
                    </table>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                                               
                                  
<div class="pagination " >
    <% if (currentPage > 1) { %>
        <a href="?page=1">First</a>
        <a href="?page=<%= currentPage - 1 %>"><</a>
    <% } %>

    <% if (currentPage > 1) { %>
        <button class="small-button" onclick="window.location.href='?page=1'">1</button>
    <% } %>
    
    <% if (currentPage > 4) { %>
        <span class="ellipsis">...</span>
    <% } %>
    
    <% int startPage = Math.max(currentPage - 2, 2);
       int endPage = Math.min(currentPage + 2, totalPages - 1);
       
       for (int i = startPage; i <= endPage; i++) {
           if (i == currentPage) { %>
               <button class="small-button active-box"><%= i %></button>
           <% } else { %>
               <button class="small-button" onclick="window.location.href='?page=<%= i %>'"><%= i %></button>
           <% }
       }
       
       if (endPage < totalPages - 1) { %>
           <span class="ellipsis">...</span>
       <% } %>

    <% if (totalPages > 1) { %>
        <button class="small-button" onclick="window.location.href='?page=<%= totalPages %>'"><%= totalPages %></button>
    <% } %>

    <% if (currentPage < totalPages) { %>
        <a href="?page=<%= currentPage + 1 %>">></a>
        <a href="?page=<%= totalPages %>">Last</a>
    <% } else { %>
        <span class="disabled">></span>
        <span class="disabled">Last</span>
    <% } %>
</div>
      <form id="page-form" action="" method="get">
                            <input type="number" name="page" id="page-input" min="1" max="<%= totalPages %>" value="<%= currentPage %>">
                            <button type="submit" class="page-box">Go</button>
                        </form>
                </div>
            </div>
                           
                   <%
                
    // Close resources
    resultSet.close();
    statement.close();
    connection.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>
                 

         <%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
            <%
String DB_URL2 = "jdbc:mysql://localhost:3306/fvms";
String DB_USER2 = "root";
String DB_PASSWORD2 = "Durga@123";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(DB_URL2, DB_USER2, DB_PASSWORD2);
    int totalcandidates = 0;
    int requestsPerPage = 5;
    int totalPages = 0;
    int currentPage = 1;
    String pageParam = request.getParameter("page");
    if (pageParam != null) {
        currentPage = Integer.parseInt(pageParam);
        if (currentPage < 1) {
            currentPage = 1;
        }
    }
    int startIndex = (currentPage - 1) * requestsPerPage;
String countQuery = "SELECT COUNT(*) AS total FROM voters where action='Blocked'";

    Statement countStatement = connection.createStatement();
    ResultSet countResult = countStatement.executeQuery(countQuery);
    if (countResult.next()) {
        totalcandidates = countResult.getInt("total");
    }
    countResult.close();
    countStatement.close();
    totalPages = (int) Math.ceil((double) totalcandidates / requestsPerPage);

    // Retrieve the image from the appropriate table
    String sql = "SELECT * FROM voters  where action='Blocked' LIMIT ?, ?";

    PreparedStatement statement = connection.prepareStatement(sql);
    statement.setInt(1, startIndex);
    statement.setInt(2, requestsPerPage);

    ResultSet resultSet = statement.executeQuery();
%>

            <!-- result start-->

            <div class="col-sm-12 col-xl-12 mt-5 text-center">
                <div class="bg-light rounded h-100 p-4">
                    <h5 class="mb-4">Not Eligible Voters:</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">S.No</th>
                                <th>Voter Image</th>
                                <th scope="col">Full Name</th>
                                <th>Age</th>
                                <th scope="col">Email</th>
                                <th scope="col">Voter Id</th>
                                <th>Adhaar </th>
                                <th>Action</th>
                                
                                
                                
                            </tr>
                        </thead>
                        <tbody>
                                                              <%
                    int sNo = (currentPage - 1) * requestsPerPage + 1;
                    while (resultSet.next()) {
                     Blob imageBlob = resultSet.getBlob("image");
        byte[] imageData = null;
        if (imageBlob != null) {
            imageData = imageBlob.getBytes(1, (int) imageBlob.length());
        }
                       
                     
                    %>

                            <tr>
                                <th scope="row"><%= sNo++ %></th>
                               <td>     <img style="width:50px; height:50px;" class="img-account-profile rounded-circle mb-2"
                src="data:image/png;base64,<%= (imageData != null) ? Base64.getEncoder().encodeToString(imageData) : "" %>"
                alt=""></td>
                                <td><%= resultSet.getString("name") %></td>
                                <td><%= resultSet.getString("age") %></td>
                                <td><%= resultSet.getString("email") %></td>
                                <td><%= resultSet.getString("voterid") %></td>
                                <td><%= resultSet.getString("aadhar") %></td>
                             
                               <td style="color:
  <% String status = resultSet.getString("action");
    if (status.equalsIgnoreCase("Pending")) {
      out.print("orange");
    } else if (status.equalsIgnoreCase("Accepted")) {
      out.print("green");
    } else if (status.equalsIgnoreCase("Blocked")) {
      out.print("red");
    } else {
      out.print("black"); // Default color if status doesn't match any condition
    }
  %>
  ">
 <%= resultSet.getString("action") %>
</td>
                              
                              
                              
                                                                        </tr>
                            
                            <%}%>
                        </tbody>
                    </table>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                                               
                                  
<div class="pagination " >
    <% if (currentPage > 1) { %>
        <a href="?page=1">First</a>
        <a href="?page=<%= currentPage - 1 %>"><</a>
    <% } %>

    <% if (currentPage > 1) { %>
        <button class="small-button" onclick="window.location.href='?page=1'">1</button>
    <% } %>
    
    <% if (currentPage > 4) { %>
        <span class="ellipsis">...</span>
    <% } %>
    
    <% int startPage = Math.max(currentPage - 2, 2);
       int endPage = Math.min(currentPage + 2, totalPages - 1);
       
       for (int i = startPage; i <= endPage; i++) {
           if (i == currentPage) { %>
               <button class="small-button active-box"><%= i %></button>
           <% } else { %>
               <button class="small-button" onclick="window.location.href='?page=<%= i %>'"><%= i %></button>
           <% }
       }
       
       if (endPage < totalPages - 1) { %>
           <span class="ellipsis">...</span>
       <% } %>

    <% if (totalPages > 1) { %>
        <button class="small-button" onclick="window.location.href='?page=<%= totalPages %>'"><%= totalPages %></button>
    <% } %>

    <% if (currentPage < totalPages) { %>
        <a href="?page=<%= currentPage + 1 %>">></a>
        <a href="?page=<%= totalPages %>">Last</a>
    <% } else { %>
        <span class="disabled">></span>
        <span class="disabled">Last</span>
    <% } %>
</div>
      <form id="page-form" action="" method="get">
                            <input type="number" name="page" id="page-input" min="1" max="<%= totalPages %>" value="<%= currentPage %>">
                            <button type="submit" class="page-box">Go</button>
                        </form>
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
            <%
                
    // Close resources
    resultSet.close();
    statement.close();
    connection.close();
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}
%>

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