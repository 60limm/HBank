<%@page import="com.hb.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>HBank</title>
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
  <!-- ???????????? -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<style>
	th, td {
  		text-align: center;
  		vertical-align : middle !important;
	}  		
	main{
    	margin-top: 100px;
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

  <main id="main">
   <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2></h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Product</li>
            <li>Status</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>?????? ?????? ??????</h2>
          <p>?????? ?????? ????????? ???????????????</p><br>
      </div>
    </section>
    <!-- End Featured Services Section -->
    
	<!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

      <div class="container">
		
		<c:if test="${fn:length(MyP)==0}">
			<div class="section-title">
				<br><p>????????? ????????? ????????????.</p><br>
				<p><a href='/bank/savingsR'>???????????? ??????</a>
			</div>
		</c:if>
		
		<c:if test="${fn:length(MyP)!=0}">
		
			<table class='table' id='1sttable'>
			<tr>
				<th>?????????</th>
				<th>??????</th>
				<th>?????? ?????? ??? ??????</th>
				<th>?????? ?????? </th>
				<th>?????? ?????? </th>
				<th>?????? ?????? </th>
				<th>??????</th>
				<!-- <th></th> -->
			</tr>
			
			<c:forEach var="i" begin="0" end="${fn:length(MyP)-1}">
				<tr id='balanceTR${i}'>
					<td style="padding-top: 20px;padding-bottom: 20px;">${MyP.get(i).sv_name }</td>
					
					<c:if test="${MyP.get(i).sv_type.equals('??????')}">
			            <td>??????</td>
					</c:if>
					<c:if test="${MyP.get(i).sv_type.equals('??????')}">
			            <td>??????</td>
					</c:if>
					
					<c:forEach var="j" begin="0" end="${fn:length(AllAc)-1}">
						<c:if test="${fn:replace(AllAc.get(j).get('fintech_use_num'),'\"','') eq MyP.get(i).used_finnum }">
							<td>${fn:replace(AllAc.get(j).get('bank_name'),'\"','')} &nbsp; / &nbsp;
							${fn:replace(AllAc.get(j).get('account_num_masked'),'\"','')}</td>
						</c:if>
					</c:forEach>
					<td>${MyP.get(i).used_regdate}</td>
					<td>${MyP.get(i).used_maturity}</td>
					<c:if test="${MyP.get(i).sv_payment_type.equals('M')}"><td>??? ${MyP.get(i).used_payment_amount} ???</td></c:if>
					<c:if test="${MyP.get(i).sv_payment_type.equals('D')}"><td>??? ${MyP.get(i).used_payment_amount} ???</td></c:if>
					<c:if test="${MyP.get(i).sv_payment_type.equals('I')}"><td>${MyP.get(i).used_payment_amount} ???</td></c:if>
					<td>${MyP.get(i).used_status }</td>
					<!--<td><a href="#">????????????</a></td>-->
				</tr>
			</c:forEach>
			</table>
		</c:if>
      </div>
      
      </div>
      
      <c:if test="${fn:length(MyP)!=0}">
      <div class="section-title">
      	<br><br><p><a href='/bank/savingsR'>???????????? ?????????</a>
	  </div>
	  </c:if>
			
    </section><!-- End About Us Section -->
	
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
        	<div class="section-title">
      	  		<br><br>
        		
        		
     		 </div>
    	</div>
     </div>
    </section><!-- End About Us Section -->
  </main>
    

  <!-- ======= Footer ======= -->
  <footer id="footer" style='margin-top: 25px;'>
    <div class="container">
      <h3>Green</h3>
      <p>Et aut eum quis fuga eos sunt ipsa nihil. Labore corporis magni eligendi fuga maxime saepe commodi placeat.</p>
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