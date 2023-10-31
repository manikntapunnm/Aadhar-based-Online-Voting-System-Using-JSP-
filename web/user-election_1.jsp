<%-- 
    Document   : user-election
    Created on : 05-Aug-2023, 10:42:41 am
    Author     : manikanta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">

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
                <p>Voteghmc: <%= session.getAttribute("voteghmc") %></p>
                <p>Votemla: <%= session.getAttribute("votemla") %></p>
                <p>Votemlc: <%= session.getAttribute("votemlc") %></p>
                <p>Voter ID: <%= session.getAttribute("voterid") %></p>
            </li>
        </ul>
    </li>
</ul>
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
                       
                        <a href="user-dashboard.jsp" class="nav-item nav-link ">My Dashboard</a>
                        <a href="user-election.jsp" class="nav-item nav-link active">Elections</a>
                        <a href="user-election-result.jsp" class="nav-item nav-link ">Results</a>
                         <a href="user-profile.jsp" class="nav-item nav-link">My Profile</a>
                        <a href="main-user.jsp" class="nav-item nav-link" style="text-decoration: underline;">Logout</a>
                        

                    </div>
                </div>
           
            </nav>
            <div class="container-xxl bg-primary page-header">
                
            </div>
                <div class="scrolling-container">
        <div class="star-container scrolling-text2">
               
               <span class="bi bi-clock"> Voting is allowed in b/w 9AM to 6PM </span> 
            </div></div>
        </div>
        <!-- Navbar & Hero End -->
        
      <%
    // Set aadhar value in the session
//    String aadhar = request.getParameter("aadhar"); // Replace with your session attribute value
//    session.setAttribute("aadhar", aadhar);
%>  
  
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

    <%-- Check if the success message session attribute exists and display the Sweet Alert --%>
<%
    String SuccessMessage = (String) request.getSession().getAttribute("SuccessMessage");
    String PendingMessage = (String) request.getSession().getAttribute("PendingMessage");
    String FailedMessage = (String) request.getSession().getAttribute("FailedMessage");

    if (SuccessMessage != null && !SuccessMessage.isEmpty()) {
        out.println("<script>");
        out.println("Swal.fire({");
        out.println("  icon: 'success',");
        out.println("  title: 'Success',");
        out.println("  text: '" + SuccessMessage + "',");
        out.println("});");
        out.println("</script>");
        // Remove the session attribute to prevent displaying the message again on subsequent requests
        request.getSession().removeAttribute("SuccessMessage");
    }

    if (PendingMessage != null && !PendingMessage.isEmpty()) {
        out.println("<script>");
        out.println("Swal.fire({");
        out.println("  icon: 'info',");
        out.println("  title: 'Pending',");
        out.println("  text: '" + PendingMessage + "',");
        out.println("});");
        out.println("</script>");
        // Remove the session attribute to prevent displaying the message again on subsequent requests
        request.getSession().removeAttribute("PendingMessage");
    }

    if (FailedMessage != null && !FailedMessage.isEmpty()) {
        out.println("<script>");
        out.println("Swal.fire({");
        out.println("  icon: 'error',");
        out.println("  title: 'Failed',");
        out.println("  text: '" + FailedMessage + "',");
        out.println("});");
        out.println("</script>");
        // Remove the session attribute to prevent displaying the message again on subsequent requests
        request.getSession().removeAttribute("FailedMessage");
    }
%>


        
      <%@ page import="java.sql.*" %>
      <%@ page import="javax.servlet.http.HttpSession" %>
<%
String DB_URL = "jdbc:mysql://localhost:3306/fvms";
String DB_USER = "root";
String DB_PASSWORD = "Durga@123";
String ename = null; 
        HttpSession esession = request.getSession();
String aadhar = (String) session.getAttribute("aadhar");
String voteghmc = (String) session.getAttribute("voteghmc");
String votemla = (String) session.getAttribute("votemla");
String votemlc = (String) session.getAttribute("votemlc");


try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

    // Retrieve election details for GHMC Elections
    String ghmcSql = "SELECT * FROM elections WHERE ename = ?";
    String ghmcElectionName = "GHMC";
    PreparedStatement ghmcStatement = connection.prepareStatement(ghmcSql);
    ghmcStatement.setString(1, ghmcElectionName);
    ResultSet ghmcResultSet = ghmcStatement.executeQuery();

    // Retrieve election details for MLA Elections
    String mlaSql = "SELECT * FROM elections WHERE ename = ?";
    String mlaElectionName = "MLA";
    PreparedStatement mlaStatement = connection.prepareStatement(mlaSql);
    mlaStatement.setString(1, mlaElectionName);
    ResultSet mlaResultSet = mlaStatement.executeQuery();
    
    // Retrieve election details for MLC Elections
    String mlcSql = "SELECT * FROM elections WHERE ename = ?";
    String mlcElectionName = "MLC";
    PreparedStatement mlcStatement = connection.prepareStatement(mlcSql);
    mlcStatement.setString(1, mlcElectionName);
    ResultSet mlcResultSet = mlcStatement.executeQuery();

    if (ghmcResultSet.next()) {
        String ghmcName = ghmcResultSet.getString("ename");
        int ghmcCandidates = ghmcResultSet.getInt("candidates");
        String ghmcDate = ghmcResultSet.getString("date");
        String ghmcresults = ghmcResultSet.getString("results");
        
//         HttpSession ghmcresults = request.getSession(); // Obtain the session object
//        ghmcresults.setAttribute("ghmcEname", ghmcName);
          


        if (mlaResultSet.next()) {
            String mlaName = mlaResultSet.getString("ename");
            int mlaCandidates = mlaResultSet.getInt("candidates");
            String mlaDate = mlaResultSet.getString("date");
            String mlaresults = mlaResultSet.getString("results");
             //HttpSession mlaSession = request.getSession(); // Obtain the session object
        //mlaSession.setAttribute("mlaEname", mlaName);
        

            if (mlcResultSet.next()) {
                String mlcName = mlcResultSet.getString("ename");
                int mlcCandidates = mlcResultSet.getInt("candidates");
                String mlcDate = mlcResultSet.getString("date");
                String mlcresults = mlcResultSet.getString("results");
               // HttpSession mlcSession = request.getSession(); // Obtain the session object
       // mlcSession.setAttribute("mlcEname", mlcName);
       

                %>
                <div class="d-flex justify-content-center mb-5" style="margin-top: 120px;">

                    <%--<div class="col-3 card d-flex flex-column justify-content-start card-container mx-3"
                         style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
                        <div class="card-body align-items-center div">
                            <form action="user-ghmc-canditates-action.jsp" method="GET">
                                <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                                     style="width:250px ; margin:auto;" />
                                <h4 class="card-title text-center"><%= ghmcName%> Elections</h4>
                                <hr>
                                <p class="text-center">Number of Candidates: <%= ghmcCandidates%></p>
                                <hr>
                                <p class="text-center">Election Date: <%= ghmcDate%></p>
                                <hr>
                                <input type="hidden" name="elections" value="<%= ghmcName%>" />
                                <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
                                <input type="hidden" name="voteghmc" value="<%= session.getAttribute("voteghmc")%>" />
                                <button type="submit" class="d-flex m-auto btn btn-primary">Vote</button>
                            </form>
                        </div>
                    </div> --%>
                    
                            
             <!--second card-->
                  <%--  <div class="col-3 card d-flex flex-column justify-content-start card-container mx-2"
                         style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
                        <div class="card-body align-items-center div">
                            <form action="user-mla-canditates.jsp" method="GET">
                                <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                                     style="width:250px ; margin:auto;" />
                                <h4 class="card-title text-center"><%= mlaName%> Elections</h4>
                                <hr>
                                <p class="text-center">Number of Candidates: <%= mlaCandidates%></p>
                                <hr>
                                <p class="text-center">Election Date: <%= mlaDate%></p>
                                <hr>
                                <input type="hidden" name="elections" value="<%= mlaName%>" />
                                <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
                                <input type="hidden" name="votemla" value="<%= session.getAttribute("votemla")%>" />
                                <button class="d-flex m-auto btn btn-primary">Vote</button>
                            </form>
                        </div>
                    </div>
                                
                                
                                
                                
                                
                                
 <!--third card-->
                    <div class="col-3 card d-flex flex-column justify-content-start card-container mx-3"
                         style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
                        <div class="card-body align-items-center div">
                            <form action="user-sae-canditates.jsp" method="GET">
                                <img src='img/front-view-elections-vote-concept.jpg' class="d-flex mb-3"
                                     style="width:250px ; margin:auto;" />
                                <h4 class="text-center"><%= mlcName%> Elections</h4>
                                <hr>
                                <p class="text-center">Number of Candidates: <%= mlcCandidates%></p>
                                <hr>
                                <p class="text-center">Election Date: <%= mlcDate%></p>
                                <hr>
                                <input type="hidden" name="elections" value="<%= mlcName%>" />
                                <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
                                <input type="hidden" name="votemlc" value="<%= session.getAttribute("votemlc")%>" />
                                <button type="submit" class="d-flex m-auto btn btn-primary">Vote</button>
                            </form>
                        </div>
                    </div>
                </div>
--%>
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

                    
                    <!--first card-->


            <div class="col-3 card d-flex flex-column justify-content-start card-container mx-3"
     style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
    <div class="card-body align-items-center div">
        <% 
            String voteghmcStatus = (String) session.getAttribute("voteghmc");
             java.time.LocalTime currentTime = java.time.LocalTime.now();
    java.time.LocalTime votingStartTime = java.time.LocalTime.of(9, 0); // 9:00 AM
    java.time.LocalTime votingEndTime = java.time.LocalTime.of(18, 0);
           // if (voteghmcStatus != null && voteghmcStatus.equals("Pending") && (ghmcresults == null || ghmcresults.equals("Pending"))) {
            if (voteghmcStatus != null && voteghmcStatus.equals("Pending") &&
        (ghmcresults == null || ghmcresults.equals("Pending")) &&
        currentTime.isAfter(votingStartTime) && currentTime.isBefore(votingEndTime)) {
         
        %>
        <form action="user-ghmc-canditates.jsp" method="post">
            <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="card-title text-center"><%= ghmcName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= ghmcCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= ghmcDate%></p>
            <hr>
           
          <p class="text-center   vote-animation">Vote: <%= voteghmc%></p>
          
            <hr>
            <input type="hidden" name="elections" value="<%= ghmcName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="voteghmc" value="<%= session.getAttribute("voteghmc")%>" />
            <button type="submit" class="d-flex m-auto btn btn-primary ">Vote</button>

        </form>
        <% } else if (voteghmcStatus != null && voteghmcStatus.equals("Voted")) { %>
         <form action="user-ghmc-canditates.jsp" method="post">
            <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="card-title text-center"><%= ghmcName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= ghmcCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= ghmcDate%></p>
            <hr>
              <p class="text-center text-center2  voted-message vote-animation">Results: <%= ghmcresults%> </p>
            <hr>
            <input type="hidden" name="elections" value="<%= ghmcName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="voteghmc" value="<%= session.getAttribute("voteghmc")%>" />
            
            <p class="text-center text-center2  voted-message color1 ">You have already voted.</p>
            
        <% } else { %>
         <form action="user-ghmc-canditates.jsp" method="post">
            <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="card-title text-center"><%= ghmcName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= ghmcCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= ghmcDate%></p>
            <hr>
            <p class="text-center text-center2  voted-message color1">Results: <%= ghmcresults%> </p>
            <hr>
            <input type="hidden" name="elections" value="<%= ghmcName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="voteghmc" value="<%= session.getAttribute("voteghmc")%>" />
            <p class="text-center text-center2  voted-message color2">Voting Stopped</p>
            <p class="text-center text-center2  voted-message color3">Voting is not allowed at this time.</p>
        <% } %>
    </div>
</div>

<div class="col-3 card d-flex flex-column justify-content-start card-container mx-2"
     style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
    <div class="card-body align-items-center div">
        <% 
    String votemlaStatus = (String) session.getAttribute("votemla");
    java.time.LocalTime mlaVotingStartTime = java.time.LocalTime.of(9, 0); // 9:00 AM
    java.time.LocalTime mlaVotingEndTime = java.time.LocalTime.of(18, 0); // 2:00 PM

    if (votemlaStatus != null && votemlaStatus.equals("Pending") &&
        (mlaresults == null || mlaresults.equals("Pending")) &&
        currentTime.isAfter(mlaVotingStartTime) && currentTime.isBefore(mlaVotingEndTime)) {
%>
        <form action="user-mla-canditates.jsp" method="get">
            <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="card-title text-center"><%= mlaName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= mlaCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= mlaDate%></p>
            <hr>
            <p class="text-center  vote-animation">Vote: <%= votemla%></p>
          <hr>
            <input type="hidden" name="elections" value="<%= mlaName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="votemla" value="<%= session.getAttribute("votemla")%>" />
            <button class="d-flex m-auto btn btn-primary ">Vote</button>
        </form>
        <% } else if (votemlaStatus != null && votemlaStatus.equals("Voted")) { %>
          <form action="user-mla-canditates.jsp" method="get">
            <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="card-title text-center"><%= mlaName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= mlaCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= mlaDate%></p>
            <hr>
            <p class="text-center text-center2  voted-message vote-animation">Results: <%= mlaresults%> </p>
            <hr>
            <input type="hidden" name="elections" value="<%= mlaName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="votemla" value="<%= session.getAttribute("votemla")%>" />
            <p class="text-center text-center2  voted-message color1">You have already voted.</p>
        <% } else { %>
          <form action="user-mla-canditates.jsp" method="get">
            <img src='img/front-view-elections-concept-with-copy-space.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="card-title text-center"><%= mlaName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= mlaCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= mlaDate%></p>
            <hr>
            <p class="text-center text-center2  voted-message color1">Results: <%= mlaresults%> </p>
            <hr>
            <input type="hidden" name="elections" value="<%= mlaName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="votemla" value="<%= session.getAttribute("votemla")%>" />
             <p class="text-center text-center2  voted-message color2">Voting Stopped</p>
             <p class="text-center text-center2  voted-message color3">Voting is not allowed at this time.</p>
        <% } %>
    </div>
</div>

<div class="col-3 card d-flex flex-column justify-content-start card-container mx-3"
     style="box-shadow: 1px 0px 8px 0px rgb(40, 41, 41); ">
    <div class="card-body align-items-center div">
       <% 
    String votemlcStatus = (String) session.getAttribute("votemlc");
    java.time.LocalTime mlcVotingStartTime = java.time.LocalTime.of(9, 0); // 9:00 AM
    java.time.LocalTime mlcVotingEndTime = java.time.LocalTime.of(18, 0); // 2:00 PM

    if (votemlcStatus != null && votemlcStatus.equals("Pending") &&
        (mlcresults == null || mlcresults.equals("Pending")) &&
        currentTime.isAfter(mlcVotingStartTime) && currentTime.isBefore(mlcVotingEndTime)) {
%>
       
        <form action="user-sae-canditates.jsp" method="get">
            <img src='img/front-view-elections-vote-concept.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="text-center"><%= mlcName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= mlcCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= mlcDate%></p>
            <hr>
            <p class="text-center vote-animation">Vote: <%= votemlc%></p><!-- comment -->
          <hr>
            <input type="hidden" name="elections" value="<%= mlcName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="votemlc" value="<%= session.getAttribute("votemlc")%>" />
            <button type="submit" class="d-flex m-auto btn btn-primary">Vote</button>
        </form>
        <% } else if (votemlcStatus != null && votemlcStatus.equals("Voted")) { %>
        
        <form action="user-sae-canditates.jsp" method="get">
            <img src='img/front-view-elections-vote-concept.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="text-center"><%= mlcName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= mlcCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= mlcDate%></p>
            <hr>
            <p class="text-center text-center2  voted-message vote-animation">Results: <%= mlcresults%> </p>
            <hr>
            <input type="hidden" name="elections" value="<%= mlcName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="votemlc" value="<%= session.getAttribute("votemlc")%>" />
            <p class="text-center text-center2  voted-message color1">You have already voted.</p>
            
        <% } else { %>
        
        <form action="user-sae-canditates.jsp" method="get">
            <img src='img/front-view-elections-vote-concept.jpg' class="d-flex mb-3"
                 style="width:250px ; margin:auto;" />
            <h4 class="text-center"><%= mlcName%> Elections</h4>
            <hr>
            <p class="text-center">Number of Candidates: <%= mlcCandidates%></p>
            <hr>
            <p class="text-center">Election Date: <%= mlcDate%></p>
            <hr>
            <p class="text-center text-center2  voted-message color1">Results: <%= mlcresults%> </p>
            <hr>
            <input type="hidden" name="elections" value="<%= mlcName%>" />
            <input type="hidden" name="aadhar" value="<%= session.getAttribute("aadhar")%>" />
            <input type="hidden" name="votemlc" value="<%= session.getAttribute("votemlc")%>" />
             <p class="text-center text-center2  voted-message color2">Voting Stopped</p>
             <p class="text-center text-center2  voted-message color3">Voting is not allowed at this time.</p>
        <% } %>
    </div>
</div>

                </div>
    
                <%
            }
        }
    }

    ghmcResultSet.close();
    ghmcStatement.close();

    mlaResultSet.close();
    mlaStatement.close();

    mlcResultSet.close();
    mlcStatement.close();

    connection.close();
} catch (Exception e) {
    e.printStackTrace();
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
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top vote-rotation"><i class="bi bi-arrow-up"></i></a>
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