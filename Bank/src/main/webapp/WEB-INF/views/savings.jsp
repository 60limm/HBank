<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Green Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="<c:url value="/resources/img/favicon.png" />" rel="icon">
  <link href="<c:url value="/resources/img/apple-touch-icon.png" />"  rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="<c:url value="/resources/vendor/glightbox/css/glightbox.min.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/vendor/swiper/swiper-bundle.min.css" />" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Green - v4.7.0
  * Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
	
	.btn60{
    	color: white !important;
    	border : 1px solid #5CB874 !important;
    	margin-right: 20px !important;
    	background-color : #5CB874 !important;
    }
    
    #sortSelectCustom{
    	border: 1px solid #aaa;
  		border-radius: 0.5em;
  		box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
  		background-color: #fff;
  		padding: 4px 1.4em 4px 0.8em;
  		margin: 0;
    }
</style>
<body>

	<!-- Vendor JS Files -->
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js?ver=1" />"></script>
  <script src="<c:url value="/resources/vendor/glightbox/js/glightbox.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/isotope-layout/isotope.pkgd.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/swiper/swiper-bundle.min.js" />"></script>
  <script src="<c:url value="/resources/vendor/php-email-form/validate.js" />"></script>

  <!-- Template Main JS File -->
  <script src="<c:url value="/resources/js/main.js"/>" ></script>
	
	
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="/bank/home">HBank</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	  
	  <c:if test="${user_info!=null}"> <!-- 로그인 O -->
      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/bank/home">Home</a></li>
          <li><a class="nav-link scrollto" href="/bank/homeTransfer">이체</a></li>
          <li class="dropdown"><a href="/bank/accountlist"><span>계좌</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/accountlist">계좌정보 조회</a></li>
              <li><a href="/bank/accountlist">계좌정보 변경</a></li>
              <li><a href="/bank/accountlist">잔액 조회</a></li>
              <li><a href="/bank/account/delete">계좌 해지</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/savings"><span>금융상품</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/savings">예금</a></li>
              <li><a href="/bank/savings">적금</a></li>
              <li><a href="#">가입상품보기</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="/bank/transactionlist">거래내역조회</a></li>
          <li><a class="getstarted scrollto" href="#" onclick='FnLogoutClick()'>Log out</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      </c:if>
      
	  
	  <c:if test="${user_info==null}"> <!-- 로그인 X -->
	  <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/bank/home">Home</a></li>
          <li><a class="nav-link scrollto" href="/bank/inner">이체</a></li>
          <li class="dropdown"><a href="/bank/inner"><span>계좌</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/inner">계좌정보 조회</a></li>
              <li><a href="/bank/inner">계좌정보 변경</a></li>
              <li><a href="/bank/inner">잔액 조회</a></li>
              <li><a href="/bank/account/delete">계좌 해지</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/savings"><span>금융상품</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/savings">예금</a></li>
              <li><a href="/bank/savings">적금</a></li>
              <li><a href="#">가입상품보기</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="/bank/inner">거래내역조회</a></li>
          <li><a class="getstarted scrollto" href="/bank/inner">Log in</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav>
      </c:if>
      <!-- .navbar -->
      
    </div>
  </header><!-- End Header -->

  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2></h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Transfer</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>금융상품</h2>
          <p>사용자의 계좌로부터 타인의 계좌로 자금을 송금합니다 <br>출금할 계좌를 선택하세요</p><br>
      </div>
    </section>
    <!-- End Featured Services Section -->
    
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-lg-4 col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-laptop"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="">Dolor Sitema</a></h4>
              <p class="description">Minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat tarad limino ata</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Featured Services Section -->
     <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs" style="background: #ffffff;">
      <div class="container">
      <form>
        <div class="d-flex justify-content-between align-items-center"  style="margin-right:100px;">
          <h2>&nbsp;</h2><br>
          <ol style="font-size: 16px;">
            <li>정렬 : &nbsp;&nbsp;&nbsp;<select id='sortSelectCustom'><option>추천순</option></select></li>
          </ol>
        </div>
      </form>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row no-gutters">
		 <!--<div class="savingsCustom">-->
		  <c:forEach var="savingsVO" items="${savingslist}" varStatus="status">
			<div class="col-lg-4 col-md-6 content-item" style="width:70%;">
			<c:if test="${savingsVO.sv_type.equals('D')}">
	            <span style="font-size: 18px;">예금</span>
			</c:if>
			<c:if test="${savingsVO.sv_type.equals('I')}">
	            <span style="font-size: 18px;">적금</span>
			</c:if>
            <h4 style="margin-top: 10px; margin-bottom: 10px;">
            	<c:out value="${savingsVO.sv_name}" />
            </h4>
            <p>
            금리 : <c:out value="${savingsVO.sv_interest}" /> %<br>
            기간 : <fmt:parseNumber value="${savingsVO.sv_term/30}" integerOnly="true" /> 개월
            </p>
            </div>
          	<div style="width:30%; text-align:center; margin:auto;">
          	<div style="display:inline-block; text-align:center;">
          	<button class='btn btn60'>상세보기</button>
          	<button class='btn btn60'>가입하기</button>
          	</div>
          	</div>
		  </c:forEach>
		  
		  <div class="col-lg-4 col-md-6 content-item" style="width:100%;">
            <span>01</span>
            <h4>Lorem Ipsum</h4>
            <p>Ulamco laboris nisi ut aliquip ex ea commodo consequat. Et consectetur ducimus vero placeat</p>
          </div>
          
          <div class="col-lg-4 col-md-6 content-item">
            <span>03</span>
            <h4> Ad ad velit qui</h4>
            <p>Molestiae officiis omnis illo asperiores. Aut doloribus vitae sunt debitis quo vel nam quis</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>04</span>
            <h4>Repellendus molestiae</h4>
            <p>Inventore quo sint a sint rerum. Distinctio blanditiis deserunt quod soluta quod nam mider lando casa</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>05</span>
            <h4>Sapiente Magnam</h4>
            <p>Vitae dolorem in deleniti ipsum omnis tempore voluptatem. Qui possimus est repellendus est quibusdam</p>
          </div>

		 <!-- </div>-->
        </div>

      </div>
    </section><!-- End Why Us Section -->
	</main>
  <!-- ======= Footer ======= -->
  <footer id="footer">
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

  

</body>

</html>
</body>
</html>