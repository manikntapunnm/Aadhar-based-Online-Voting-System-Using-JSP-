<%-- 
    Document   : user-election
    Created on : 05-Aug-2023, 10:42:41 am
    Author     : manikanta
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>

<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>BizConsult - Consulting HTML Template</title>
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
            <script>history.pushState(null, null, document.URL);
window.addEventListener('popstate', function () {
    history.pushState(null, null, document.URL);
});</script>
    <style>
              @keyframes fadeInOut {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0;
  }
}
.color1{
    color:green;
}
.color2{
    color:red;
}
.color3{
    color:blue;
}

.text-center2 {
  text-align: center;
  position: relative;
  
}

.voted-message {
  animation: fadeInOut 2s ease-in-out infinite;
}

</style>       

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
        
        <ul class="sub-menu">
            <li>
                <p>Aadhar: <%= session.getAttribute("aadhar") %></p>
                <p>First Name: <%= session.getAttribute("name") %></p>
                <p>Email: <%= session.getAttribute("email") %></p>
                <p>Phone: <%= session.getAttribute("phone") %></p>
                <p>Voteghmc: <%= session.getAttribute("voteghmc") %></p>
                <p>Votemla: <%= session.getAttribute("votemla") %></p>
                <p>Votemlc: <%= session.getAttribute("votemlc") %></p>
                <p>Voter ID: <%= session.getAttribute("voterid") %></p>
               
            </li>
        </ul>
    </li>
</ul>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                                 <div class="scrolling-container">
        <div class="star-container2 scrolling-text2">
               "Empower Your Voice, Cast Your Vote!"
            </div></div>

                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="user-profile.jsp" class="nav-item nav-link">My Profile</a>
                        <a href="user-dashboard.jsp" class="nav-item nav-link">My Dashboard</a>
                        <a href="user-election.jsp" class="nav-item nav-link active">Elections</a>
                        <a href="user-election-result.jsp" class="nav-item nav-link ">Results</a>
                        <a href="main-user.jsp" class="nav-item nav-link" style="text-decoration: underline;">Logout</a>
                    </div>
                </div>
            </nav>
            <div class="container-xxl bg-primary page-header">
            </div>
                            <div class="scrolling-container">
        <div class="star-container scrolling-text2">
               
               <span class=" bg-warning   bi bi-clock"> Voting is allowed in b/w 9AM to 6PM </span> 
            </div></div>
        </div>

        </div>
        <!-- Navbar & Hero End -->

    
        
           <%
        Connection con = null;
        Statement statement = null;
        ResultSet rs = null;
        
        
                HttpSession esession = request.getSession();
String aadhar = (String) session.getAttribute("aadhar");
String voteghmc = (String) session.getAttribute("voteghmc");
String votemla = (String) session.getAttribute("votemla");
String votemlc = (String) session.getAttribute("votemlc");


        try {
            String url = "jdbc:mysql://localhost:3306/fvms";
            String username = "root";
            String dbpassword = "Durga@123";
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, dbpassword);

            // Use a simple statement to fetch all events
            String sql = "SELECT * FROM elections";
            statement = con.createStatement();
            rs = statement.executeQuery(sql);
            

    %>
 <!--div class= "d-flex justify-content-center mb-5" style="margin-top: 120px;"-->
  
 

 <div class="container mb-5 mt-5">
        <div class="row justify-content-center">
            
            <div class="col-9">
                <div class="row">
                  <% 
                    
                    
                    Map<String, String[]> electionUrlsMap = new HashMap<>();


                    // Loop through all events and display their details
                    while (rs.next()) {
                        String ename = rs.getString("ename");
                        String candidates = rs.getString("candidates");
                        String date = rs.getString("date");
                        String results = rs.getString("results");
                        //String party =rs.getString("pname");
                        Blob imageBlob = rs.getBlob("image");
                        byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                      //  String dashboardURL = "user-" + ename.toLowerCase().replace(" ", "-") + "-candidates.jsp";
                        String voteURL = "vote" + ename.toLowerCase().replace(" ", "");
                        String sessionVoteURL = (String) session.getAttribute(voteURL);
                        electionUrlsMap.put(ename, new String[]{voteURL, sessionVoteURL});

        %>

            
            
            
      <div class="col-lg-4 col-md-6 mb-4">
    <div class="card d-flex flex-column justify-content-start" style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41);">

        <div class="card-body align-items-center div">
      
            <% 
            String voteStatus =  sessionVoteURL;
            
             java.time.LocalTime currentTime = java.time.LocalTime.now();
    java.time.LocalTime votingStartTime = java.time.LocalTime.of(9, 0); // 9:00 AM
    java.time.LocalTime votingEndTime = java.time.LocalTime.of(18, 0);
           
            if (voteStatus != null && voteStatus.equals("Pending") &&
        (results == null || results.equals("Pending")) &&
        currentTime.isAfter(votingStartTime) && currentTime.isBefore(votingEndTime)) {
          session.setAttribute("voteURL", voteURL);
                        session.setAttribute("sessionVoteURL", sessionVoteURL);
                        
        %>

            
            <form action="user-candidates.jsp?<%=voteURL%>:<%= sessionVoteURL%>&aadhar:<%=aadhar%>&ename:<%= ename%>" method="post"> <!-- Form start -->
                    <input type="hidden" name="voteURL" value="<%= voteURL %>" />
    <input type="hidden" name="sessionVoteURL" value="<%= sessionVoteURL %>" />
    <input type="hidden" name="aadhar" value="<%= aadhar %>" />
    <input type="hidden" name="ename" value="<%= ename %>" />
                <img src="data:image/jpeg;base64, <%= base64Image%>" class="d-flex mb-3" style="width:250px ; margin:auto;">
                <h4 class="card-title text-center"><%= ename%> Elections</h4>
                <hr>
                <p class="text-center">Number of Candidates : <%= candidates%></p>
                <hr>
                <p class="text-center">Election Date: <%= date%></p>
                <hr>
                <p class="text-center   vote-animation">Vote: <%= sessionVoteURL%></p>
                

          
                <hr>


                <button type="submit" class="d-flex m-auto btn btn-primary">Vote</button>
            </form> <!-- Form end -->
            
            <% } else if (voteStatus != null && voteStatus.equals("Voted")) { %>
                      <form action="user-candidates.jsp?<%=voteURL%>:<%= sessionVoteURL%>&aadhar:<%=aadhar%>&ename:<%= ename%>" method="post"> <!-- Form start -->
                    <input type="hidden" name="voteURL" value="<%= voteURL %>" />
    <input type="hidden" name="sessionVoteURL" value="<%= sessionVoteURL %>" />
    <input type="hidden" name="aadhar" value="<%= aadhar %>" />
    <input type="hidden" name="ename" value="<%= ename %>" />
                <img src="data:image/jpeg;base64, <%= base64Image%>" class="d-flex mb-3" style="width:250px ; margin:auto;">
                <h4 class="card-title text-center"><%= ename%> Elections</h4>
                <hr>
                <p class="text-center">Number of Candidates : <%= candidates%></p>
                <hr>
                <p class="text-center">Election Date: <%= date%></p>
                <hr>
                <p class="text-center   vote-animation">Vote: <%= sessionVoteURL%></p>
             
                <hr>
               <p class="text-center text-center2  voted-message vote-animation">Results: <%= results%> </p>
            <hr>
                        <p class="text-center text-center2  voted-message color1 ">You have already voted.</p>


            </form>
            <% } else { %>
            
            
    
            
              <form action="user-candidates.jsp?<%=voteURL%>:<%= sessionVoteURL%>&aadhar:<%=aadhar%>&ename:<%= ename%>" method="post"> <!-- Form start -->
                    <input type="hidden" name="voteURL" value="<%= voteURL %>" />
    <input type="hidden" name="sessionVoteURL" value="<%= sessionVoteURL %>" />
    <input type="hidden" name="aadhar" value="<%= aadhar %>" />
    <input type="hidden" name="ename" value="<%= ename %>" />
                <img src="data:image/jpeg;base64, <%= base64Image%>" class="d-flex mb-3" style="width:250px ; margin:auto;">
                <h4 class="card-title text-center"><%= ename%> Elections</h4>
                <hr>
                <p class="text-center">Number of Candidates : <%= candidates%></p>
                <hr>
                <p class="text-center">Election Date: <%= date%></p>
                <hr>
                <p class="text-center   vote-animation">Vote: <%= sessionVoteURL%></p>
             
                <hr>
               <p class="text-center text-center2  voted-message vote-animation">Results: <%= results%> </p>
            <hr>
                        
          <%--<p class="text-center text-center2  voted-message color2">Voting Stopped</p>//declared
            <p class="text-center text-center2  voted-message color3">Voting is not allowed at this time.</p> //block
--%>

 <% if (results.equals("Declared")) { %>
        <p class="text-center text-center2 voted-message color2">Voting Stopped</p>
    <% } else if (!"Pending".equals(voteURL) && "voted".equals(sessionVoteURL)) { %>
        <p class="text-center text-center2 voted-message color3">Voting is not allowed at this time.</p>
    <% } else { %>
        <div class="text-center">
            <a href="main-contact.jsp" class="btn btn-primary">Contact</a>
        </div>
    <% } %>

            </form>
            
                    <% } %>
            
            
            
        </div>
    </div>
</div>

                    <% 
                        }

                         session.setAttribute("electionUrlsMap", electionUrlsMap);
                    %>

</div>
            </div>
              
        </div> 
    </div>
     
          <%  
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            out.println("An error occurred: " + e.getMessage());
        } finally {
            // Close the resources in the reverse order of their creation
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (statement != null) {
                try {
                    statement.close();
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

   <!--div class="col-9 mt-4">
                <div class="row">
                   
                </div>
            </div
                       
                     <div class="col-9">
                <div class="row">  
                       
                       
                       
                       
            <div class="col-3 card d-flex flex-column justify-content-start card-container mx-3" style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
                <div class="card-body align-items-center div">
                   
                    
                   
                  
                  
                </div>
            </div>  
                                <a href="user-mlc-candidates.jsp" class="btn btn-primary d-flex m-auto">Vote</a>     -->
             
                    
                 
      <%--  <div class=  "col-lg-4 col-md-6 mb-4">
            <div class="card d-flex flex-column justify-content-start" style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41);">

                <div class="card-body align-items-center div">
                    <img src="data:image/jpeg;base64, <%= base64Image%>"   class="d-flex mb-3" style="width:250px ; margin:auto;">
                    <h4 class="card-title text-center"><%= ename%> Elections</h4><hr>
                    <hr>
                    <p class="text-center">Number of Canditates : <%= candidates%></p><hr>
                    <p class="text-center">Election Date: <%= date%></p><hr>

                    <a href="user-ghmc-canditates.jsp">
                        <button class="d-flex m-auto btn btn-primary">Vote</button>
                    </a>
                </div>
            </div> 
                    
                    
                    


        </div>--%>  