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

   <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Green - v4.7.0
  * Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  <!-- 제이쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
</head>
<style>
	.material-icons{
		font-family: 'Material Icons';
		font-weight: normal;
		font-style: normal;
		font-size: 24px;
		display: inline-block;
		line-height: 1;
		text-transform: none;
		letter-spacing: normal;
		word-wrap: normalr;
		white-space: nowrap;
		direction: ltr;
		
		-webkit-font-smoothing: antialiased;
		
		text-rendering: optimizeLegibility;
		
		-moz-osx-font-smoothing: grayscale;
		
		font-feature-setings: 'liga';
	}
	
	
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
    
    th, td {
        text-align: center !important;
        vertical-align : middle !important;
      }

</style>
<body>
<script>
	window.onload = function(){
		$(".infoDIV").hide();
	}
</script>
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
          <li class="dropdown"><a href="/bank/savingsR"><span>금융상품</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/savingsdepositR">예금</a></li>
              <li><a href="/bank/savingsinstallmentR">적금</a></li>
              <li><a href="/bank/savingStatus">가입상품보기</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/exchanges"><span>외환</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/exchanges">고시 환율</a></li>
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
          <li class="dropdown"><a href="/bank/savingsR"><span>금융상품</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/savingsdepositR">예금</a></li>
              <li><a href="/bank/savingsinstallmentR">적금</a></li>
              <li><a href="/bank/inner">가입상품보기</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="/bank/exchanges"><span>외환</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/bank/exchanges">고시 환율</a></li>
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
            <li>Product</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>환율</h2>
          <p>국제환율 고시표</p><br>
      </div>
    </section>
    <!-- End Featured Services Section -->
    
    <!-- ======= Featured Services Section ======= 
    <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-lg-4 col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-laptop"></i></div>
              <h4 class="title"><a href="/bank/savingsdeposit">예금</a></h4>-->
              <!--<p class="description">일정 기간을 정해놓고 돈을 예치합니다</p>-->
            <!--</div>
          </div>
          <div class="col-lg-4 col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="/bank/savingsinstallment">적금</a></h4>
              <!-- <p class="description">정해진 기간동안 일정액을 매월/매일 예치합니다.</p>-->
            <!--</div>
          </div>
        </div>-->

      </div>
    </section><!-- End Featured Services Section -->
     <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs" style="background: #ffffff;">
      <div class="container">
      <form>
        <div class="d-flex justify-content-between align-items-center"  style="margin-right:100px;">
          <h2>&nbsp;</h2><br>
        </div>
      </form>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row no-gutters">
		 <!--<div class="savingsCustom">-->
		  <jsp:useBean id="now" class="java.util.Date" />
		  <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 HH:mm:ss" var="today" />
		  <div style="width:90%;">
		  <b>환율 고시 : ${fn:replace(exchangeList.get(0).get("날짜"),'\"','')}</b><br>
		  조회 시각 : ${today}
		  </div>
		  <div style="width:10%;"><button class='btn'><i class="material-icons" onclick='f5Function()'>autorenew</i><br>새로고침</button></div>
		  <div class="col-lg-4 col-md-6 content-item" style="width:100%;">
		  	<table class="table table-striped table-bordered" style="table-layout:fixed">		  	
		  		<tr >
		  			<th rowspan='2'>구분 / 통화표시</th><th colspan='2'>현찰</th><th colspan='2'>송금</th>
		  			<th rowspan='2'>매매기준율</th>
		  		</tr>
		  		<tr>
		  			<th>사실 때</th><th>파실 때</th><th>전신환 보내실 때</th><th>전신환 받으실 때</th>
		  		</tr>
		  		<c:forEach var="i" begin="1" end="${fn:length(exchangeList)-1}">
		  			<tr>
		  				<td><b><c:out value="${fn:replace(exchangeList.get(i).get('통화명'),'\"','')} "></c:out></b></td>
		  				<td><c:out value="${fn:replace(exchangeList.get(i).get('현찰사실때'),'\"','')} "></c:out></td>
		  				<td><c:out value="${fn:replace(exchangeList.get(i).get('현찰파실때'),'\"','')} "></c:out></td>
		  				<td><c:out value="${fn:replace(exchangeList.get(i).get('송금_전신환보내실때'),'\"','')} "></c:out></td>
		  				<td><c:out value="${fn:replace(exchangeList.get(i).get('송금_전신환받으실때'),'\"','')} "></c:out></td>
		  				<td><c:out value="${fn:replace(exchangeList.get(i).get('매매기준율'),'\"','')} "></c:out></td>
		  			</tr>
		  		</c:forEach>
		  		
		  	</table>
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

  
<script>
	function f5Function(){
		console.log("새로고침 버튼 클릭");
		location.href='/bank/exchanges';
	}
	
	
	
	
	
</script>
</body>

</html>
</body>
</html>