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
	
	#transactionlistSearch {
		color: #5cb874;
	    padding: 8px 25px;
	    margin-left: 30px;
	    border-radius: 4px;
	    border: 2px solid #5cb874;
	    transition: 0.3s;
	    font-size: 14px;
	}
	main{
    	margin-top: 100px;
    }
</style>
<body>
<script>
  window.onload = function(){
		$(".balanceTD").hide();
		$(".title2").hide();
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
            <li>Transaction</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>거래 내역 조회</h2>
          <p>계좌의 거래 내역을 조회합니다</p><br>
      </div>
    </section>
    <!-- End Featured Services Section -->
    
    <!-- ======= About Us Section ======= -->
    <section id="about" class="about">
      <div class="container">
      <div class="container">

		<form>
			<table style="margin:auto;">
			
			<tr>
			<td><input type='date' value='2022-02-11' id='from_date' class='form-control'></td>
			<td>~</td>
			<td><input type='date' id='to_date' class='form-control'></td>
			<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌 :&nbsp;&nbsp; </th>
			<td>
			<select class="form-control" id="selectAccount" style="width: 280px;">
				<option value="none">- 선택 - </option>
				
				<c:forEach var="i" begin="0" end="${fn:length(JsonAccountList)-1}">
					<option id='${fn:replace(JsonAccountList.get(i).get('fintech_use_num'),'\"','')}'>
						${fn:replace(JsonAccountList.get(i).get('bank_name'),'\"','')} ${fn:replace(JsonAccountList.get(i).get('account_num_masked'),'\"','')} 
					</option>
				</c:forEach> 
			
			</select>
			</td>
			<td><a id='transactionlistSearch' onclick='selectAccountFn()' class="getstarted scrollto" href='#'>조회</a></td>
			</tr>
			<!-- 여기에 여유가 좀 있었으면 좋겠다 -->
			<tr><td colspan='6'>
			
			<!-- ======= Services Section ======= -->
			    <section id="services" class="services" style="padding-bottom: 0px;padding-top: 30px;">
			      <div class="container">
			        <div class="section-title title2">
			          <hr>
			        </div>
			        <div class="section-title title3">
			          <hr><br>
			          시작일자 와 종료일자 및 조회할 계좌를 선택하세요
			        </div>
			      </div>
			    </section>
			<!-- End Services Section -->
    
			</td></tr>
			<tr><td colspan='6' class='transactionTD'><div id='transactionDIV' class='transactionDIV'></div></td></tr>
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

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  
<script>
function selectAccountFn(){
	$(".title3").hide();
	$(".title2").show();
	
	var from_date = $("#from_date").val();
	var to_date = $("#to_date").val();
	console.log(from_date," ",to_date);
	
	from_date = from_date.replace(/-/gi,"");
	to_date = to_date.replace(/-/gi,"");
	console.log(from_date," ",to_date);
	
	var selectAccount = $("#selectAccount option:selected").val();
	
	var fintech_use_num = $("#selectAccount option:selected").attr('id');
	
	//ajax통신으로 데이터 받아오기
	$.ajax({
		type : 'GET',
		url : 'http://172.21.200.26:8081/bank/transactionlist/one?fintech_use_num='+fintech_use_num+"&from_date="+from_date+"&to_date="+to_date,
		dataType : "json",
		success : function(response){
			
			console.log(response["res_list"]);
			console.log(response["res_list"][0]);
			
			var inDIV = "<table class='table table-bordered'>";
			inDIV += "<tr><th>거래일자</th><th>거래시간</th><th>입출금구분</th><th>거래구분</th><th>내용</th><th>거래금액</th><th>잔액</th><th>거래점</th></tr>";
			for (var i = 0; i < response["page_record_cnt"] ; i++ ){
				
				if( Number(response["res_list"][i]["tran_date"]) >= Number(from_date) && Number(response["res_list"][i]["tran_date"]) <= Number(to_date)){
					inDIV += "<tr>";
					inDIV += "<td>"+response["res_list"][i]["tran_date"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["tran_time"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["inout_type"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["tran_type"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["print_content"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["tran_amt"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["after_balance_amt"]+"</td>";
					inDIV += "<td>"+response["res_list"][i]["branch_name"]+"</td>";
					inDIV += "</tr>";
				}
				
			}
			inDIV += "</table>";
			
			$("#transactionDIV").html(inDIV);
			$(".transactionTD").show();
		}
	
	})
	
	
}
</script>
</body>

</html>