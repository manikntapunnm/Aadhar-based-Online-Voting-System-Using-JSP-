<%-- 
    Document   : admin
    Created on : 05-Aug-2023, 10:40:05 am
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <!-- fontawesome -->
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/fontawesome.min.css" integrity="sha512-cHxvm20nkjOUySu7jdwiUxgGy11vuVPE9YeK89geLMLMMEOcKFyS2i+8wo0FOwyQO/bL8Bvq1KMsqK4bbOsPnA==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
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
                    <a href="admin.jsp" class="nav-item nav-link active"><i
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
<%@ page import="java.sql.*" %>



            
            
            
             <%
            
            
            //int totalStudents = 0;
            
        Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        String url = "jdbc:mysql://localhost:3306/fvms";
        String username = "root";
        String dbpassword = "Durga@123";
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, username, dbpassword);


       %>

              <% 
          int totalelections1 = 0;
        String countElectionsQuery = "SELECT COUNT(*) AS totalelections1 FROM elections";
        ps = con.prepareStatement(countElectionsQuery);
        rs = ps.executeQuery();
        if (rs.next()) {
            totalelections1 = rs.getInt("totalelections1");
        }
        



        %> 
        
          
              <% 
        int totalcandidates1 = 0;
        String countCandidatesQuery = "SELECT COUNT(*) AS totalcandidates1 FROM candidates";
        ps = con.prepareStatement(countCandidatesQuery);
        rs = ps.executeQuery();
        if (rs.next()) {
            totalcandidates1 = rs.getInt("totalcandidates1");
        }
        






   int totalVoters = 0;
        String countVotersQuery = "SELECT COUNT(*) AS totalVoters FROM voters";
        ps = con.prepareStatement(countVotersQuery);
        rs = ps.executeQuery();
        if (rs.next()) {
            totalVoters = rs.getInt("totalVoters");
        }

        // Retrieve the total number of pending voters
        int totalPending = 0;
        String countPendingQuery = "SELECT COUNT(*) AS totalPending FROM voters WHERE action = 'Pending'";
        ps = con.prepareStatement(countPendingQuery);
        rs = ps.executeQuery();
        if (rs.next()) {
            totalPending = rs.getInt("totalPending");
        }
        




        %> 
        
            
            
            
            
            
            
            
            
            
            
            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Candidates</p>
                                <h6 class="mb-0"><%= totalelections1 %></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-bar fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Elections</p>
                                <h6 class="mb-0"><%= totalcandidates1 %></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-area fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Total Voters</p>
                                <h6 class="mb-0"><%= totalVoters%></h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Pending Voters</p>
                                <h6 class="mb-0"><%= totalPending %></h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sale & Revenue End -->

<%
            
            } catch (ClassNotFoundException | SQLException e) {
        // Handle exceptions appropriately
        e.printStackTrace();
    } finally {
        // Close the resources properly
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
            
            
            








            <!-- Sales Chart Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                
                                

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
                    ResultSet resultSet = statement.executeQuery();
            %>

                                <h6 class="mb-0">Manage Election:</h6>
                                <a href="">Show All</a>
                            </div>
                            <h6 class="mb-4"></h6>
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th>S.No</th>
                                        <th>Election Name</th>

                                        <th>Elections</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>

                                    <%
                                        int sNo = 1;
                                        while (resultSet.next()) {

                                            String action = resultSet.getString(15);


                                    %>
                                    <tr>
                                        <td><%= sNo++%></td>
                                        <td><%= resultSet.getString("ename")%></td>



                                        <td style="color:
                                            <% String status = resultSet.getString("action");
                                                if (status.equalsIgnoreCase("Upcoming")) {
                                                    out.print("orange");
                                                } else if (status.equalsIgnoreCase("Ongoing")) {
                                                    out.print("green");
                                                } else if (status.equalsIgnoreCase("Closed")) {
                                                    out.print("red");
                                                } else {
                                                    out.print("black"); // Default color if status doesn't match any condition
                                                }
                                            %>
                                            ">
                                            <%= action%>
                                        </td>
                                <script>
                                        function showAlert() {
                                            var myText = "You wanna Delete";
                                            alert(myText);
                                        }
                                </script>
                                
                                </tr>

                                <%
                                        }

                                        // Close resources
                                        resultSet.close();
                                        statement.close();
                                        connection.close();
                                    } catch (ClassNotFoundException | SQLException e) {
                                        e.printStackTrace();
                                    }
                                %>



                                </tbody>
                            </table>
                            <canvas id="worldwide-sales"></canvas>
                        </div>
                    </div>




                    <%
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
                            String countQuery = "SELECT COUNT(*) AS total FROM candidates";
                            Statement countStatement = connection.createStatement();
                            ResultSet countResult = countStatement.executeQuery(countQuery);
                            if (countResult.next()) {
                                totalcandidates = countResult.getInt("total");
                            }
                            countResult.close();
                            countStatement.close();
                            totalPages = (int) Math.ceil((double) totalcandidates / requestsPerPage);

                            // Retrieve the image from the appropriate table
                            String sql = "SELECT * FROM candidates LIMIT ?,?";
                            PreparedStatement statement = connection.prepareStatement(sql);
                            statement.setInt(1, startIndex);
                            statement.setInt(2, requestsPerPage);

                            ResultSet resultSet = statement.executeQuery();
                    %>





                    <div class="col-sm-12 col-xl-6">
                        <div class="bg-light text-center rounded p-4">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <h6 class="mb-0">Manage Candidate:</h6>
                                <a href="">Show All</a>
                            </div>

                            <h6 class="mb-4"></h6>
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>

                                        <th>Candidate Name</th>


                                        <th>Action</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        int sNo = (currentPage - 1) * requestsPerPage + 1;
                                        while (resultSet.next()) {
                                            String action = resultSet.getString(7);

                                    %>
                                    <tr>

                                        <td><%= resultSet.getString("cname")%></td>



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
                                            <%= action%>
                                        </td>
                                    

                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <style>
                        /* Your existing CSS styles... */

                        /* Primary color style for the pagination numbers */
                        .pagination {
                            margin-top: 10px;
                            display: inline-block;
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

                            <div class="pagination-container text-center">
                                <div class="pagination mr-3">
                                    <div class="pagination " >
                                        <% if (currentPage > 1) {%>
                                        <a href="?page=1">First</a>
                                        <a href="?page=<%= currentPage - 1%>"><</a>
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
            if (i == currentPage) {%>
                                        <button class="small-button active-box"><%= i%></button>
                                        <% } else {%>
                                        <button class="small-button" onclick="window.location.href='?page=<%= i%>'"><%= i%></button>
                                        <% }
               }

               if (endPage < totalPages - 1) { %>
                                        <span class="ellipsis">...</span>
                                        <% } %>

                                        <% if (totalPages > 1) {%>
                                        <button class="small-button" onclick="window.location.href='?page=<%= totalPages%>'"><%= totalPages%></button>
                                        <% } %>

                                        <% if (currentPage < totalPages) {%>
                                        <a href="?page=<%= currentPage + 1%>">></a>
                                        <a href="?page=<%= totalPages%>">Last</a>
                                        <% } else { %>
                                        <span class="disabled">></span>
                                        <span class="disabled">Last</span>
                                        <% }%>
                                    </div>
                                    <form id="page-form" action="" method="get">
                                        <input type="number" name="page" id="page-input" min="1" max="<%= totalPages%>" value="<%= currentPage%>">
                                        <button type="submit" class="page-box">Go</button>
                                    </form>
                                </div>
                            </div>


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


                    <canvas id="salse-revenue"></canvas>
                </div>
            </div>
        </div>
    </div>
            <!-- Sales Chart End -->

            
            
            
            
            
            
         
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
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