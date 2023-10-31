<%-- 
    Document   : user-election-result-graph-mla
    Created on : 05-Aug-2023, 10:41:45 am
    Author     : manikanta
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <script src="https://cdn.anychart.com/js/8.0.1/anychart-core.min.js"></script>
<script src="https://cdn.anychart.com/js/8.0.1/anychart-pie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <script src="lib2/chart/chart.min.js"></script>
    
<style>
  .vote-rotation {
    display: inline-block;
    animation: rotate 4s linear infinite;
    transform-origin: center;
  }
   .vote-animation {
    animation: heartbeat 1.5s ease infinite, colorChange 5s alternate infinite;
  }
   @keyframes heartbeat {
    0%, 100% { transform: scale(1); }
    50% { transform: scale(1.1); }
  }

  @keyframes colorChange {
    0% { color: blue; }
    50% { color: red; }
    100% { color: green; }
  }

  @keyframes rotate {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
</style>

<style>
        .card-container {
            box-shadow: 1px 0px 8px 0px rgb(23, 24, 24);
            margin: 0 10px;
            padding: 20px;
            position: relative;
        }

        .scrolling-container {
            overflow: hidden;
        }

        .scrolling-text {
            white-space: nowrap;
            animation: scrollBidirectional 10s linear infinite;
            animation-play-state: running;
        }
    .scrolling-text2 {
            white-space: nowrap;
            animation: scrollBidirectional2 15s linear infinite;
            animation-play-state: running;
        }
        .star-container {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: red; /* Warning color */
        }
        .star-container2 {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: blue;}

       @keyframes scrollBidirectional {
    0%, 100% {
        transform: translateX(0);
    }
    25%, 175% {
        transform: translateX(-1cm);
    }
    50% {
        transform: translateX(1cm);
    }
}


       @keyframes scrollBidirectional2 {
    0%, 100% {
        transform: translateX(0);
    }
    25%, 105% {
        transform: translateX(-5cm);
    }
    50% {
        transform: translateX(5cm);
    }
}

    </style>
</head>
<style>
    #container {
        width: 350px;
        height: 350px;
        margin: 0;
        padding: 0;
      }
</style>
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
                    <h1 class="m-0">iVote</h1> </a>
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
        .m-auto {
    margin-top: 0;
}
    }
</style>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<ul class="nav">
    <li  class="nav-item"><i style="color:white; "  class="bi bi-list"></i>
        <a href=""  class=" nav-link"></a>
        <!-- Dropdown menu -->
        <ul class="sub-menu">
            <li>
                <p>Aadhar: <%= session.getAttribute("aadhar") %></p>
                <p>First Name: <%= session.getAttribute("name") %></p>
                <p>Email: <%= session.getAttribute("email") %></p>
                <p>Phone: <%= session.getAttribute("phone") %></p>
               
                <p>Voter ID: <%= session.getAttribute("voterid") %></p>
                <a href="user-election-result.jsp">Go Back</a>
            </li>
        </ul>
    </li>
</ul>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
       
                    <!-- <img src="img/logo.png" alt="Logo"> -->
               
<!--                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">-->
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" title="Toggle Navigation">

                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="user-profile.jsp" class="nav-item nav-link">My Profile</a>
                        <a href="user-dashboard.jsp" class="nav-item nav-link">My Dashboard</a>
                        <a href="user-election.jsp" class="nav-item nav-link ">Elections</a>
                        <a href="user-election-result.jsp" class="nav-item nav-link active">Results</a>
                        <a href="main-user.jsp" class="nav-item nav-link">Logout</a>
                    </div>
                </div>
            </nav>
            <div class="container-xxl bg-primary page-header">
            </div>
        </div>
        <!-- Navbar & Hero End -->
<%
    // Retrieve the session attribute and clear it after displaying
    String alertMessage = (String) session.getAttribute("alertMessage");
    session.removeAttribute("alertMessage");
    
    if (alertMessage != null && !alertMessage.isEmpty()) {
%>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Alert',
            text: '<%= alertMessage %>',
        });
    </script>
<%
    }
%>

<%@ page import="java.sql.*" %>


<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fvms", "root", "Durga@123");
        Statement stmt = conn.createStatement();

        String sql = "SELECT cname, pname FROM candidates WHERE votes = (SELECT MAX(votes) FROM candidates)";
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            String cname = rs.getString("cname");
            String pname = rs.getString("pname");
%>
<div class="col-10 mt-5  style='margin-top: 0;' m-auto scrolling-text">
    <div class="row">
        <div class="card text-center" style="box-shadow: 1px 0px 8px 0px rgb(94, 230, 89);">
           
            <h6 class="mt-1 "> <i>Winner</i> of the Elections is <i style="color:orange; "  class="bi bi-star  vote-rotation"></i><i class=  "vote-animation"><%= cname%></i><i style="color:orange; "  class="bi bi-star  vote-rotation"></i> from <%= pname%></h6>
        </div>
    </div>
</div>
<%
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>    

   <div class="col-10 mt-5 m-auto">
        <div class="row">
            <div class="card text-center" style="box-shadow: 1px 0px 8px 0px rgb(94, 230, 89);">
                <h2 class="d-flex my-5">MLA Election Results</h2>
                <div class="col-8 mx-5">
                    <canvas id="myChart" width="150px" height="60px"></canvas>
                </div>
                
<!--                
<script>
    // Make an AJAX request to fetch data from the JSP script
    fetch('getChartData.jsp')
        .then(response => response.json())
        .then(data => {
            var xValues = [];
            var yValues = [];
            var barColors = ["yellow", "skyblue", "pink"];

            data.forEach(item => {
                xValues.push(item.partyname);
                yValues.push(item.votecount);
            });

            // Find the maximum vote count
            var maxVote = Math.max(...yValues);

            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                        backgroundColor: barColors,
                        data: yValues
                    }]
                },
                options: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: "Graph Representation"
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                max: maxVote + 3 // Set a value slightly higher than the maximum vote count
                            }
                        }]
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching data:', error));
</script>-->



<script>
    // Make an AJAX request to fetch data from the JSP script
    fetch('getChartData.jsp')
        .then(response => response.json())
        .then(data => {
            var xValues = [];
            var yValues = [];
            var barColors = ["yellow", "skyblue", "pink"];

            data.forEach(item => {
                xValues.push(item.partyname);
                yValues.push(item.votecount);
            });

            // Set the desired upper limit for the y-axis
            var yAxisUpperLimit = 60; // Adjust the value as needed

            // Find the maximum vote count
            var maxVote = Math.max(...yValues);

            // Calculate the y-axis ticks with the desired upper limit
            var stepSize = Math.ceil(yAxisUpperLimit / 6); // Customize as needed
            var yTicks = [];
            for (var i = 0; i <= yAxisUpperLimit; i += stepSize) {
                yTicks.push(i);
            }

            new Chart("myChart", {
                type: "bar",
                data: {
                    labels: xValues,
                    datasets: [{
                        backgroundColor: barColors,
                        data: yValues
                    }]
                },
                options: {
                    legend: { display: false },
                    title: {
                        display: true,
                        text: "Graph Representation"
                    },
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                max: yAxisUpperLimit, // Set the upper limit for the y-axis
                                stepSize: stepSize,
                                callback: function (value, index, values) {
                                    if (value <= maxVote) {
                                        return value;
                                    }
                                    return ""; // Hide the tick label if it's beyond the maxVote
                                }
                            }
                        }]
                    }
                }
            });
        })
        .catch(error => console.error('Error fetching data:', error));
</script>

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
    <script src="lib2/chart/chart.min.js"></script>
 
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>



 <%--     
    <div class="col-10 mt-5  style='margin-top: 0;' m-auto ">
            <div class="row">
                <div class="card text-center" style="box-shadow: 1px 0px 8px 0px rgb(94, 230, 89);">
                 
                        <h2 class="d-flex my-5">MLA Election Results</h2>
                        <div class="col-8 mx-5">
                            <canvas id="myChart"  width="150px" height="50px"></canvas>
                        </div>
                        <script>
                            var xValues = ["TDP", "JANASENA", "TRS"];
                            var yValues = [42, 21, 54, 0];
                            var barColors = ["yellow", "skyblue", "pink"];

                            new Chart("myChart", {
                                type: "bar",
                                data: {
                                    labels: xValues,
                                    datasets: [{
                                        backgroundColor: barColors,
                                        data: yValues
                                    }]
                                },
                                options: {
                                    legend: { display: false },
                                    title: {
                                        display: true,
                                        text: "Graph Representation"
                                    }
                                }
                            });
                        </script>
                     
                    </div>
                </div>
            </div>
 //  second  code with database
 
 
  <div class="col-10 mt-5 m-auto">
        <div class="row">
            <div class="card text-center" style="box-shadow: 1px 0px 8px 0px rgb(94, 230, 89);">
                <h2 class="d-flex my-5">MLA Election Results</h2>
                <div class="col-8 mx-5">
                    <canvas id="myChart" width="150px" height="50px"></canvas>
                </div>
                <script>
                    // Assume you have fetched the data from the database and stored it in variables
                    <% 
                    // Initialize your database connection
                    String url = "jdbc:mysql://localhost:3306/fvms";
                    String username = "root";
                    String password = "Durga@123";
                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet resultSet = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        connection = DriverManager.getConnection(url, username, password);
                        
                        // Fetch candidate names and votes from the database
                        String query = "SELECT pname, votes FROM candidates";
                        statement = connection.prepareStatement(query);
                        resultSet = statement.executeQuery();
                        out.println(resultSet);

                        // Create arrays for candidate names and votes
                        List<String> pnamesList = new ArrayList<>();
                        List<Integer> votesList = new ArrayList<>();
                        
                        while (resultSet.next()) {
                            pnamesList.add(resultSet.getString("pname"));
                            votesList.add(resultSet.getInt("votes"));
                        }

                        String[] pnames = pnamesList.toArray(new String[0]);
                        Integer[] votes = votesList.toArray(new Integer[0]);
                        
                        
                        
                        %>
                            
                            
                            
                            
                            
                  
                    // Use the retrieved data to create the chart
                    var pnames = <%= Arrays.toString(pnames) %>;
                    var votes = <%= Arrays.toString(votes) %>;
                    var barColors = ["yellow", "skyblue", "pink"];

                    new Chart("myChart", {
                        type: "bar",
                        data: {
                            labels: pnames,
                            datasets: [{
                                backgroundColor: barColors,
                                data: votes
                            }]
                        },
                        options: {
                            legend: { display: false },
                            title: {
                                display: true,
                                text: "Graph Representation"
                            }
                        }
                    });
                </script>
            </div>
        </div>
    </div>
    
              <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (resultSet != null) resultSet.close();
                            if (statement != null) statement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    %>
    
 
 
        --%>