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
  <!-- 제이쿼리 -->
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
          <li><a class="nav-link scrollto" href="/bank/transactionlist">거래내역조회</a></li>
          <li><a class="nav-link scrollto" href="#">카드</a></li>
          <li><a class="nav-link scrollto" href="/bank/about">About</a></li>
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
          <li><a class="nav-link scrollto" href="/bank/inner">거래내역조회</a></li>
          <li><a class="nav-link scrollto" href="#">카드</a></li>
          <li><a class="nav-link scrollto" href="/bank/about">About</a></li>
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
          <h2>이체</h2>
          <p>송금을 위해 상대방 계좌 정보를 입력하세요.</p><br>
        </div>
    </section>
    <!-- End Featured Services Section -->
    
	<!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">
		<br><br>
        <div class="row no-gutters">

          <div class="col-lg-4 col-md-6 content-item">
            <span>01</span>
            <h4>출금이체</h4>
            <p>이용기관이 사용자 계좌로부터 대금을 출금합니다.</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>02</span>
            <h4>수취인검증</h4>
            <p>자금을 수취하는 사람이 입금요청한 계좌의 예금주와 동일인인지 비교합니다. </p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>03</span>
            <h4>입금이체</h4>
            <p>이용기관이 사용자의 계좌로 대금을 송금합니다.</p>
          </div>
        </div>
      </div>
    </section><!-- End Why Us Section -->
	
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
        <form action="transfer/check" method="POST">
			<table class='table table-bordered'>
			<!--<caption>송금 정보</caption>-->
			<tr>
				<th>출금 계좌번호</th>
				<td colspan='3'><input type='text' id='cntr_account_num' name='cntr_account_num' value='${account_num_masked}' class="form-control"></td>
				<!-- 
				<th>출금 은행</th>
				<td>
				<select name="cntr_bank_code" class="form-control" id='cntr_bank_code'>
					<option value="none">선택</option>		<option value='002'>산업은행</option>
					<option value='003'>기업은행</option>		<option value='004'>KB국민은행</option>
					<option value='007'>수협은행</option>		<option value='008'>수출입은행</option>
					<option value='011'>NH농협은행</option>	<option value='012'>지역농축협</option>
					<option value='020'>우리은행</option>		<option value='023'>SC제일은행</option>
					<option value='027'>한국씨티은행</option>	<option value='031'>대구은행</option>
					<option value='032'>부산은행</option>		<option value='034'>광주은행</option>
					<option value='035'>제주은행</option>		<option value='037'>전북은행</option>
					<option value='039'>경남은행</option>		<option value='045'>새마을금고</option>
					<option value='048'>신협</option>			<option value='050'>저축은행</option>
				</select>
				</td>
				-->
			</tr>
			<tr>
				<th>입금 계좌번호</th>
				<td><input type='text' id='recv_client_account_num' name='recv_client_account_num' class="form-control" required></td>
				<th>입금 은행</th>
				<td>
				<select name="recv_client_bank_code" class="form-control" id='recv_client_bank_code'>
					<option value="none">선택</option>		<option value='002'>산업은행</option>
					<option value='003'>기업은행</option>		<option value='004'>KB국민은행</option>
					<option value='007'>수협은행</option>		<option value='008'>수출입은행</option>
					<option value='011'>NH농협은행</option>	<option value='012'>지역농축협</option>
					<option value='020'>우리은행</option>		<option value='023'>SC제일은행</option>
					<option value='027'>한국씨티은행</option>	<option value='031'>대구은행</option>
					<option value='032'>부산은행</option>		<option value='034'>광주은행</option>
					<option value='035'>제주은행</option>		<option value='037'>전북은행</option>
					<option value='039'>경남은행</option>		<option value='045'>새마을금고</option>
					<option value='048'>신협</option>			<option value='050'>저축은행</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>금액(KRW)</th>
				<td colspan='3'><input type='text' name='tran_amt' id='tran_amt' class="form-control" required></td>
			</tr>
			<tr>
				<th>예금주</th>
				<td colspan='2'><input type='text' id='recv_client_name' name='recv_client_name' class="form-control" readonly required></td>
				<td><button type='button' class='btn btn-xs' onclick='FNRecvCheck()'>예금주 확인</button></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan='3' ><input type='text' id='dps_print_content' name='dps_print_content' class="form-control" required></td>
			</tr>
			<tr>
				<td colspan='4'><button type='submit' class='btn'>이체 요청</button>
			</tr>
		</table>
		<input type='hidden' id='fintech_use_num' name='fintech_use_num' class="form-control" value='${fintech_use_num }'>
	</form>
    </div>
     </div>
    </section><!-- End About Us Section -->
  </main>
    

  <!-- ======= Footer ======= -->
  <footer id="footer">
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
	<script>
	function FNRecvCheck(){
		var cntr_account_num = $("#recv_client_account_num").val();
		var bank_code_std = $("#recv_client_bank_code").val();
		var fin = $("#fintech_use_num").val();
		var tran_amt = $("#tran_amt").val();
		console.log(cntr_account_num,bank_code_std,fin,tran_amt);
		
		$.ajax({
			Type: 'GET',
			url: 'http://172.21.200.26:8081/bank/transfer/receiveCheck',
			data: 'cntr_account_num='+cntr_account_num+'&bank_code_std='+bank_code_std+'&tran_amt='+tran_amt+'&fin='+fin,
			dataType: "text",
			success : function(response){
				
				var recv_name = response;
				$("#recv_client_name").val(recv_name);
			}
		})
	}
	</script>
</html>
</body>
</html>