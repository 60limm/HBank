<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>HBank</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Green - v4.7.0
  * Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>

	#loginFormTable{
		margin-left: auto !important; 
		margin-right: auto !important;
	}
	#loginForm{
		align-items: center;
    	align-content: center;
    }
    
    
</style>
<body>
<script>
if (${tryTF!=null}){
	alert("???????????? ?????????????????????.\n???????????? ??????????????? ?????? ???????????????.");
}
</script>
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="/bank/home">HBank</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	  
	  <c:if test="${user_info!=null}"> <!-- ????????? O -->
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/bank/home">Home</a></li>
          <li><a class="nav-link scrollto" href="/bank/homeTransfer">??????</a></li>
          <li class="dropdown"><a href="/bank/accountlist"><span>??????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/accountlist">???????????? ??????</a></li>
              <li><a href="/bank/accountlist">???????????? ??????</a></li>
              <li><a href="/bank/accountlist">?????? ??????</a></li>
              <li><a href="/bank/account/delete">?????? ??????</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/savingsR"><span>????????????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/savingsdepositR">??????</a></li>
              <li><a href="/bank/savingsinstallmentR">??????</a></li>
              <li><a href="/bank/savingStatus">??????????????????</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/exchanges"><span>??????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/exchanges">?????? ??????</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="/bank/transactionlist">??????????????????</a></li>
          <li><a class="getstarted scrollto" href="#" onclick='FnLogoutClick()'>Log out</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      </c:if>
      
	  
	  <c:if test="${user_info==null}"> <!-- ????????? X -->
	  <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/bank/home">Home</a></li>
          <li><a class="nav-link scrollto" href="/bank/inner">??????</a></li>
          <li class="dropdown"><a href="/bank/inner"><span>??????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/inner">???????????? ??????</a></li>
              <li><a href="/bank/inner">???????????? ??????</a></li>
              <li><a href="/bank/inner">?????? ??????</a></li>
              <li><a href="/bank/account/delete">?????? ??????</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/savingsR"><span>????????????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/savingsdepositR">??????</a></li>
              <li><a href="/bank/savingsinstallmentR">??????</a></li>
              <li><a href="/bank/inner">??????????????????</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/exchanges"><span>??????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/exchanges">?????? ??????</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="/bank/inner">??????????????????</a></li>
          <li><a class="getstarted scrollto" href="/bank/inner">Log in</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      </c:if>
      <!-- .navbar -->
      
    </div>
  </header><!-- End Header -->

  <main id="main" style="margin-top: 170px;">
  	<!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2></h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Log-In</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
  	<!-- ======= About Us Section ======= -->
	<section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>?????????</h2>
          <p>?????? ????????? ???????????? > <a href='/bank/join?sign=n'>???????????? ??????</a> </p><br>
        </div>
    </section>
    
    

    <section class="inner-page" style="padding-top: 100px;padding-bottom: 100px;">
      <div class="container">
        <!-- ????????? ??? -->
        <div id='loginForm' style="width: 500px; margin: auto ; align:center;">
			<form action='loginForm' method='post'>
			<label>?????????</label><input type='text' id='user_id' name='user_id' class="form-control" required>
			<br>
			<label>????????????</label><input type='password' id='user_pw' name='user_pw' class="form-control" required>
			<br>
			<div class="section-title">
          		<button type='submit' class='btn btn-default' style='border:1px solid #6c757d8c;'>?????????</button>
        	</div>
			</form>
		</div>
		
      </div>
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" style="margin-top: 0px;">
    <div class="container">
      <h3>Green</h3>
      <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
      <div class="social-links">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
      <div class="copyright">
        &copy; Copyright <strong><span>Green</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/green-free-one-page-bootstrap-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>

</html>