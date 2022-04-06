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
    .btn60{
    	color: #198754 !important;
    }
    input {
		  width: 300px;
		  height: 32px;
		  font-size: 15px;
		  border: 0;
		  border-radius: 15px;
		  outline: none;
		  padding-left: 10px;
		  background-color: rgb(233, 233, 233);
		}
</style>
<body>
<script>
  window.onload = function(){
		$(".updateTR").hide();
		$(".balanceTD").hide();
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
            <li>Account</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>계좌 조회</h2>
          <p>사용자가 가진 계좌 정보 및 잔액을 조회합니다.<br>&nbsp;</p><br>
      </div>
    </section>
    <!-- End Featured Services Section -->
    
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">

      <div class="container">
		<!-- 여기에 리스트 div 넣기 -->
		<table class='table' id='1sttable'>
		<tr>
			<th>은행</th>
			<th>계좌번호</th>
			<th>별명</th>
			<th></th>
			<th></th>
		</tr>
		
		<c:forEach var="i" begin="0" end="${fn:length(JsonList_final)-1}">
			<tr id='balanceTR${i}' ">
				<td style="padding-top: 20px;padding-bottom: 20px;">
					<c:out value="${fn:replace(JsonList_final.get(i).get('bank_name'),'\"','')} "> </c:out> </td>
				<td><c:out value="${fn:replace(JsonList_final.get(i).get('account_num_masked'),'\"','')} "></c:out></td>
				<td><c:out value="${fn:replace(JsonList_final.get(i).get('account_alias'),'\"','')} "> </c:out></td>
				<!--<td><c:out value="${fn:replace(JsonList_final.get(i).get('fintech_use_num'),'\"','')} "> </c:out></td>-->
				<!--<td><button type="button" class="btn btn-link" id="btn${i}" onclick='FnAccountClick(${JsonList_final.get(i).get('fintech_use_num')},${i})'>조회</button></td>-->
				<td style="width: 216px;"><button class='btn btn60' id="btn${i}" onclick='FnAccountClick(${JsonList_final.get(i).get('fintech_use_num')},${i})'>잔액조회</button></td>
				<td style="width: 216px;"><button class='btn btn60' id="btnT${i}" onclick='FnUpdateBefore(${i})'>변경</button></td>
			</tr>
			<tr>
				<td colspan='5' class='balanceTD' id='balanceTD${i}'><div class='balanceDIV' id='balanceDIV${i}'></div></td>
			</tr>
			<tr class='updateTR' id='updateTR${i}'>
				<td colspan='5' class='updateTD' id='updateTD${i}'><div class='updateDIV' id='updateDIV${i}'>
					<form action='accountlistUpdate' method='post'>
					<div class="col-xs-2">
					<label>변경할 계좌 별명 : &nbsp;&nbsp;&nbsp;</label>
						<input type='text' id="update_alias" name="update_alias">
						<input type='hidden' name='fintech_use_num' value='${fn:replace(JsonList_final.get(i).get('fintech_use_num'),'\"','')}'>
					&nbsp;&nbsp;&nbsp;
					<button type='submit' class='btn' border='1px solid #198454'>확인</button>
					</div>
					</form>
				</div></td>
			</tr>
		</c:forEach>
		</table>
      </div>
      
      </div>
    </section><!-- End About Us Section -->
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
	function FnAccountClick(fintech_use_num,i){
		console.log(fintech_use_num);
		$(".updateTR").hide();
		$("#balanceTD"+i).show();
		$("#btn"+i).text('취소');
		$("#btnT"+i).text('변경');
		
		
		/* $("#balanceDIV"+i).css("background",'white'); */
		$("#balanceTR"+i).css("background",'#FBFBFB');
		
		
		//ajax 통신으로 만들어보자
		$.ajax({
			type :'GET',
			url : 'http://172.21.200.26:8081/bank/accountlist/balance?fintech_use_num='+fintech_use_num,
			dataType : "json",
			success: function(response){	//이 response를 json으로 받고, 해봅시다
				
				var account_type_info = "";
				if(response["account_type"] == 1){
					account_type_info = "수시입출금";
				}else if(response["account_type"] == 2){
					account_type_info = "예적금";
				}else if(response["account_type"] == 6){
					account_type_info = "수익증권";
				}else if(response["account_type"] == 'T'){
					account_type_info = "종합계좌";
				}else{account_type_info = "?";}
				
				var inDIV = "<table class='table table-bordered'>";
				inDIV += "<tr><th align='center'>상품명</th><td>";
				inDIV += response["product_name"];
				inDIV += "</td><th align='center'>계좌종류</th><td>";
				inDIV += account_type_info;
				inDIV += "</td></tr><tr><th align='center'>계좌개설일</th><td>";
				inDIV += response["account_issue_date"];
				inDIV += "</td><th align='center'>만기일</th><td>";
				inDIV += response["maturity_date"];
				inDIV += "</td></tr><tr><th align='center'>계좌잔액</th><td colspan='3'>";
				inDIV += response["balance_amt"] +" 원</td>";	
				inDIV += "</tr><tr><th align='center'>출금가능금액</th><td colspan='3'>";
				inDIV += response["available_amt"] +" 원</td></tr></table><br>";
				$("#balanceDIV"+i).html(inDIV);	
			},
			error: function(error){
				$("#balanceDIV"+i).text("error");
			},
		})
		
	}
	function FnUpdateBefore(i){
		//변경 클릭 시
		$(".balanceTD").hide();
		$("#updateTR"+i).show();
		$("#balanceTR"+i).css("background",'#FBFBFB');
		
		$("#btn"+i).text('잔액조회');
		$("#btnT"+i).text('취소');
	}
	
	
	function FnUpdate(fintech_use_num, token){
		var update_alias = $("#update_alias").val();
		var jsonData = {
						"fintech_use_num" : fintech_use_num,
						"account_alias"	  : update_alias
		};
		
		//location.href= 'http://172.21.200.26:8081/bank/transfer?fintech_use_num='+fintech_use_num+"&account_num_masked="+account_num_masked;
	}
</script>
</body>

</html>