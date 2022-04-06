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
  <script>
  window.onload = function(){
	  let date = new Date();
	  document.getElementById('used_regdate').value = date.toISOString().substring(0, 10);
	  
	  //$("#termsID").hide();
  }
  
  function periodLoad(periodMonth){
	  /*선택한 금리에 따라 가입기간 적용되도록*/
	  
	  let date2 = new Date();
	  date2.setMonth(date2.getMonth() + periodMonth);
	  document.getElementById('used_maturity').value = date2.toISOString().substring(0, 10);
  }
  
  function paymentChange(sv_payment_type){
	  if (sv_payment_type.includes('M')){
		  console.log(sv_payment_type);
		  var amount = document.getElementById('used_payment_amount').value;
		  var rate_month = $('input:radio[name=used_period]:checked').val(); // 체크된 값(checked value)
		  document.getElementById('used_payment_amount_sum').value = amount * rate_month;
	  }
  }
  
  </script>
</head>
<style>
	th {
		text-align: center;
  		vertical-align : middle !important;
	} 
	td {
		vertical-align : middle !important;
	} 		
	main{
    	margin-top: 100px;
    }	
</style>
<body>
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
            <li>Sign Up</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>금융상품</h2>
          <p>상품 가입을 위해<br>필요한 정보를 입력하세요</p><br>
      </div>
    </section>
    <!-- End Featured Services Section -->
    
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
        <div class="row">
        <form id="savingform" action="savingform" method="POST">
			<table class='table table-bordered'>
			<!--<caption>송금 정보</caption>-->
			<tr height="60">
				<th style='width:20%'>상품명</th>
				<td colspan='3'>&nbsp;&nbsp; ${OneP.get(0).sv_name} (${OneP.get(0).sv_seq})</td>
			</tr>
			<tr height="60">
				<th>가입대상</th>
				<td colspan='3'>&nbsp;&nbsp; ${OneP.get(0).sv_target}</td>
			</tr>
			<tr><th>내용</th><td colspan='3'> <textarea name="opinion" class='form-control' cols="30"  rows="5" readonly>${fn:replace(OneP.get(0).sv_contents, '-', '&#10;-')}</textarea></td></tr>
			<tr>
				<th>금리</th>
				<!-- <td colspan='3'><input type='text' id='' name='' value='연 ' class="form-control" readonly required></td> -->
				<td colspan='3' style='text-align: center;'>
						<!-- 기간별 금리표 삽입 -->
						<br>
	           			<table class='table table-bordered' style="width:50%" align='center'>
	           			<caption align='right'>연 이율 ( 세전, % )</caption>
	           				<c:if test="${OneP.get(0).sv_interest_6!=0}"> <tr align='center'><td style='width:30%'>6개월 </td><th>${OneP.get(0).sv_interest_6} </th><td><input type="radio" name="used_period" value="6" onclick='periodLoad(6)' required /></td></tr></c:if>
	           				<c:if test="${OneP.get(0).sv_interest_12!=0}"><tr align='center'><td style='width:30%'>12개월</td><th>${OneP.get(0).sv_interest_12} </th><td><input type="radio" name="used_period" value="12" onclick='periodLoad(12)' required /></td></tr></c:if>
	           				<c:if test="${OneP.get(0).sv_interest_24!=0}"><tr align='center'><td style='width:30%'>24개월</td><th>${OneP.get(0).sv_interest_24} </th><td><input type="radio" name="used_period" value="24" onclick='periodLoad(24)' required /></td></tr></c:if>
	           				<c:if test="${OneP.get(0).sv_interest_36!=0}"><tr align='center'><td style='width:30%'>36개월</td><th>${OneP.get(0).sv_interest_36} </th><td><input type="radio" name="used_period" value="36" onclick='periodLoad(36)' required /></td></tr></c:if>
	           			</table></td>
			</tr>
			<tr height="60">
				<th>이자형태</th>
				<!-- 
				<td><input type='text'value='고정금리' class="form-control" readonly></td>
				<td><input type='text'value='단리' class="form-control" readonly></td>
				<td><input type='text'value='만기일시지급' class="form-control" readonly></td>
				 -->
				 <td colspan='3'>&nbsp;&nbsp;고정금리&nbsp;&nbsp;/&nbsp;&nbsp;단리&nbsp;&nbsp;/&nbsp;&nbsp;만기일시지급</td>
			</tr>
			<tr style="text-align: center;"><th>가입기간</th><td colspan='3'><input type='date' id='used_regdate' class='form-control' readonly required/> ~ <input type='date' id='used_maturity' class='form-control' readonly required/></td></tr>
			<tr height="60">
				<th>연결 계좌</th>
				<td colspan='3'>
					<select class="form-control" id="selectAccount" required >
						<option value="">- 계좌 선택 - </option>
				
						<c:forEach var="i" begin="0" end="${fn:length(AllAc)-1}">
							<option id='${fn:replace(AllAc.get(i).get('fintech_use_num'),'\"','')}'>
								${fn:replace(AllAc.get(i).get('bank_name'),'\"','')} ${fn:replace(AllAc.get(i).get('account_num_masked'),'\"','')} 
							</option>
						</c:forEach> 
					</select>
				</td>
			</tr>
			<tr height="60">
				<c:if test="${OneP.get(0).sv_payment_type.equals('M')}"><th>월 납입한도<br></th></c:if>
				<c:if test="${OneP.get(0).sv_payment_type.equals('D')}"><th>일 납입한도<br></th></c:if>
				<c:if test="${OneP.get(0).sv_payment_type.equals('I')}"><th>납입한도<br></th></c:if>
				<td colspan='3' style='text-align: left;'>&nbsp;&nbsp;
					<c:if test="${OneP.get(0).sv_limit_min==0}">최소한도 없음</c:if>
					<c:if test="${OneP.get(0).sv_limit_min!=0}">최소 <fmt:formatNumber value="${OneP.get(0).sv_limit_min}" pattern="#,###" /> 원</c:if>
					 /
					<c:if test="${OneP.get(0).sv_limit_max==0}">최대한도 없음</c:if>
					<c:if test="${OneP.get(0).sv_limit_max!=0}">최대 <fmt:formatNumber value="${OneP.get(0).sv_limit_max}" pattern="#,###" /> 원</c:if>
				</td>
				
			</tr>
			<tr height="60">
				<c:if test="${OneP.get(0).sv_payment_type.equals('M')}"><th>월 납입금액<br>(단위 : 원)</th></c:if>
				<c:if test="${OneP.get(0).sv_payment_type.equals('D')}"><th>일 납입금액<br>(단위 : 원)</th></c:if>
				<c:if test="${OneP.get(0).sv_payment_type.equals('I')}"><th>납입금액<br>(단위 : 원)</th></c:if>
				
				<td colspan='3'><input type='number' id='used_payment_amount' name='used_payment_amount' class="form-control" onchange="paymentChange('${OneP.get(0).sv_payment_type}')" min="${OneP.get(0).sv_limit_min}" required /></td>
			</tr>
			<c:if test="${OneP.get(0).sv_payment_type.equals('M')}">
			<tr height="60">
				<th>납부 총 금액<br>(단위 : 원)</th>
				<td colspan='3'><input type='text' id='used_payment_amount_sum' name='' class="form-control" readonly /></td>
			</tr>
			</c:if>
			<tr height="60">
			  <c:if test="${OneP.get(0).sv_payment_type.equals('M')}">
				<th>납입일</th>
				<td><select class="form-control"><option>매월</option></select></td>
				<td colspan='2'><select class="form-control" name='used_payment_date'>
				<option value='1'>  1일</option><option value='2'>  2일</option><option value='3'>  3일</option>
				<option value='4'>  4일</option><option value='5'>  5일</option><option value='6'>  6일</option>
				<option value='7'>  7일</option><option value='8'>  8일</option><option value='9'>  9일</option>
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
				</td>
			  </c:if>
			  <c:if test="${OneP.get(0).sv_payment_type.equals('I')}">
			    <th>납입일</th>
				<td colspan='3'><input type='text' class='form-control' value='즉시' readonly/>
				<input type='hidden' id='used_payment_date' name='used_payment_date' value='I'>
				</td>
			  </c:if>
			</tr>
		</table>
		<br>
		<table class='table table-bordered' >
			<tr>
				<td colspan='5' style='text-align: left; padding-left: 160px;padding-right: 100px;padding-top: 30px;padding-bottom: 50px;'><b>유의사항</b><br><br>
				- 통장이 ‘전기통신금융사기 피해 방지 및 피해금 환급에 관한 특별법’에서 정의한 피해의심거래계좌 및 사기이용계좌로 이용될 경우<br>&nbsp;&nbsp;이체, 송금지연, 지급정지 등의 금융거래 제한조치를 할 수 있습니다.<br>
				- 이 예금은 공동명의 및 양도, 질권설정을 할 수 없습니다.<br>
				- 계약을 체결전에 상품설명서 및 약관을 읽어보시기 바랍니다.<br>
				- 금융소비자보호법 제19조제1항에 따라 상품에 대하여 설명을 받으실 권리가있습니다.<br>
				- 법령 및 내부통제기준에따라 작성된 자료입니다.<br>
				- 예금자보호 여부 : 이 예금은 예금자보호법에 따라 예금보험공사가 보호하되, 보호 한도는 본 은행에 있는 귀하의 모든 예금보호 대상 금융상품의 &nbsp;&nbsp;원금과 소정의 이자를 합하여 1인당 “최고 5천만원”이며, 5천만원을 초과하는 나머지 금액은 보호하지 않습니다.<br>
				</td>
			</tr>
			<tr style='text-align: center;'>
				<td style="padding-bottom: 30px;"><br>해당사실을 인지하였음을 확인합니다.&nbsp;&nbsp;<br><br> <input type='checkbox' class='btn' required>&nbsp;&nbsp;&nbsp; 확인</td>
			</tr>
		</table>
		<!--<table class='table table-bordered'>
			<tr>
				<td colspan='5' style='text-align: left; padding-left: 160px;padding-right: 100px;padding-top: 30px;padding-bottom: 50px;'><b>약관</b><br><br>
					 <div id='termsID'>
					<input type='checkbox' class='btn' required>&nbsp;&nbsp;&nbsp;&nbsp; 약관동의
					</div> 
				</td>
			</tr>
			<tr><td colspan='5' style='text-align: center;'>
					<input type='checkbox' class='btn' required>&nbsp;&nbsp;&nbsp; 약관동의
			</td><tr>
		</table>-->
		<table class='table table-bordered'>
			<tr style="text-align: center;">
				<td colspan='4'>
				<input type='hidden' id='used_service_seq' name='used_service_seq' value='${param.sv_seq}'>
				<input type='hidden' id='used_usernum' name='used_usernum' value='${user_info.user_seq_no}'>
				<input type='hidden' id='used_finnum' name='used_finnum'>
				<button type='submit' class='btn' onclick='btnclick(${param.sv_seq})'><b>신청</b></button>
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
  
//  function termsClick(){
//	  $("#termsID").show();
//  }
  
  
  function formatDate(){
	  var d = new Date(),
	  month = '' + (d.getMonth()+1),
	  day   = '' + d.getDate(),
	  year  = d.getFullYear();
	  
	  if (month.length < 2)
		  month = '0' + month;
	  if (day.length < 2)
		  day = '0' + day;
	  
	  return [year,month,day].join('-');
  }
  
  function btnclick(sv_seq){
	  //유효성체크 하기.. 왜 required 안되징
//	  console.log($("#used_regdate").val());
//	  var rate_month = $('input:radio[name=used_period]:checked').val(); // 체크된 값(checked value)
//	  console.log(rate_month);
	  
//	  if(isNaN(rate_month)){
//		  alert("기간이 선택되지 않았습니다.");
//		  location.href="http://172.21.200.26:8081/bank/savingformLoad?sv_seq="+sv_seq;
//	  }else{
//		  var used_finnum = $("#selectAccount option:selected").attr('id');
//		  $("#used_finnum").val(used_finnum);
	  	  //$("#savingform").submit();
		  //alert("신청이 완료되었습니다\n신청현황 보러가기");
//	  }
	  
	  var used_finnum = $("#selectAccount option:selected").attr('id');
	  $("#used_finnum").val(used_finnum);
	  
  }
  </script>
</body>
</html>