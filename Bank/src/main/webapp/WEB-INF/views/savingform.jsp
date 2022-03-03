<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
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
${param.sv_seq}
<!-- ------------ -->
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
            <li>Product</li>
            <li>Sign Up</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
        <form id="savingform" action="savingform" method="POST">
			<table class='table table-bordered'>
			<!--<caption>송금 정보</caption>-->
			<tr>
				<th>상품명</th>
				<td colspan='3'><input type='text' id='' name='' value='${OneP.get(0).sv_name} (${OneP.get(0).sv_seq})' class="form-control" readonly></td>
			</tr>
			<tr><th>내용</th><td colspan='3'> <textarea name="opinion" class='form-control' cols="30"  rows="5" readonly>${OneP.get(0).sv_contents}</textarea></td></tr>
			<tr>
				<th>금리 (%)</th>
				<td colspan='3'><input type='text' id='' name='' value='연 ${OneP.get(0).sv_interest}' class="form-control" readonly required></td>
			</tr>
			<tr>
				<th>이자형태</th>
				<td><input type='text'value='고정금리' class="form-control" readonly></td>
				<td><input type='text'value='단리' class="form-control" readonly></td>
				<td><input type='text'value='만기일시지급' class="form-control" readonly></td>
			</tr>
			<tr>
				<th>연결 계좌</th>
				<td colspan='3'>
					<select class="form-control" id="selectAccount" required>
						<option value="none">- 계좌 선택 - </option>
				
						<c:forEach var="i" begin="0" end="${fn:length(AllAc)-1}">
							<option id='${fn:replace(AllAc.get(i).get('fintech_use_num'),'\"','')}'>
								${fn:replace(AllAc.get(i).get('bank_name'),'\"','')} ${fn:replace(AllAc.get(i).get('account_num_masked'),'\"','')} 
							</option>
						</c:forEach> 
					</select>
				</td>
			</tr>
			<tr>
				<th>납입금액<br>(단위 : 원)</th>
				<td colspan='3'><input type='text' id='used_payment_amount' name='used_payment_amount' class="form-control" required></td>
			</tr>
			<tr>
			  <c:if test="${OneP.get(0).sv_payment_type.equals('M')}">
				<th>납입일</th>
				<td><select class="form-control"><option>매월</option></select></td>
				<td colspan='2'><select class="form-control" name='used_payment_date'>
				<option value='1'>1일</option><option value='2'>2일</option><option value='3'>3일</option>
				<option value='4'>4일</option><option value='5'>5일</option><option value='6'>6일</option>
				<option value='7'>7일</option><option value='8'>8일</option><option value='9'>9일</option>
				<option value='10'>10일</option><option value='11'>11일</option><option value='12'>12일</option>
				<option value='13'>13일</option><option value='14'>14일</option><option value='15'>15일</option>
				<option value='16'>16일</option><option value='18'>18일</option><option value='18'>18일</option>
				<option value='19'>19일</option><option value='20'>20일</option><option value='21'>21일</option>
				<option value='22'>22일</option><option value='23'>23일</option><option value='24'>24일</option>
				<option value='25'>25일</option><option value='26'>26일</option><option value='27'>27일</option>
				<option value='28'>28일</option><option value='29'>29일</option><option value='30'>30일</option>
				</select></td>
			  </c:if>
			  <c:if test="${OneP.get(0).sv_payment_type.equals('D')}">
				<th>납입일</th>
				<td colspan='3'><input type='text' class='form-control' value='매일' readonly/>
				<input type='hidden' id='used_payment_date' name='used_payment_date' value='D'>
			  </c:if>
			</tr>
			<tr>
				<td colspan='4'><input type='checkbox' class='btn' required>&nbsp;&nbsp;&nbsp;&nbsp; 약관동의
				<input type='hidden' id='used_finnum' name='used_finnum'>
				<input type='hidden' id='used_service_seq' name='used_service_seq' value='${param.sv_seq}'>
				<input type='hidden' id='used_usernum' name='used_usernum' value='${user_info.user_seq_no}'>
				<input type='hidden' id='used_maturity' name='used_maturity'>
			</tr>
			<tr style=" text-align: right;">
				<td colspan='4'><button type='button' class='btn' onclick='btnclick()'>신청</button>
			</tr>
		</table>
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
  
  
  <script>
  function btnclick(){
	  var used_finnum		  = $("#selectAccount option:selected").attr('id');
	  
	  $("#used_finnum").val(used_finnum);
	  $("#used_maturity").val('2024-01-01');
	  
	  $("#savingform").submit();
	  
  }
  </script>
</body>
</html>