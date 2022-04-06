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
  
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
    
    main{
    	margin-top: 100px;
    }
    
    .60cus{
    	border-top-style: solid !important;
    	border-right-style: solid !important;
    	border-left-style: solid !important;
    }
</style>
<body>
<script>
	window.onload = function(){
		$(".infoDIV").hide();
		
		var location = window.location.href;
		console.log(location);
		
		if(location.indexOf("savingsinstallment") > -1){
			$("#a_all").css("color","black");
			$("#a_dep").css("color","black");
		}else if(location.indexOf("savingsdeposit") > -1){
			$("#a_all").css("color","black");
			$("#a_ins").css("color","black");
		}else if(location.indexOf("savings") > -1){
			$("#a_dep").css("color","black");
			$("#a_ins").css("color","black");
		}
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
    <section id="featured-services" class="featured-services section-bg" >
      <div class="section-title" >
      	  <br><br>
          <h2>금융상품</h2>
          <p>HBank의 추천 상품을 소개합니다<br>원하시는 상품을 찾아보세요</p><br>
      </div>
    </section>
    <!-- ======= Featured Services Section ======= -->
    <!-- <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><span class="material-icons" style='width:95%; display:inline; vertical-align:middle;'>monetization_on</span></div>
              <h4 class="title"><a href="/bank/savingsdeposit">예금</a></h4>>-->
              <!--<p class="description">일정 기간을 정해놓고 돈을 예치합니다</p>-->
           <!--  </div>
          </div>
          <div class="col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="/bank/savingsinstallment">적금</a></h4> -->
              <!-- <p class="description">정해진 기간동안 일정액을 매월/매일 예치합니다.</p>-->
            <!-- </div>
          </div>
        </div>
      </div>
    </section>-->
    <!-- 
    <div class="row" style="padding-left: 150px;padding-right: 150px;">
    	<div class='col-sm-1 60cus' style='border: 1px; color: grey;'>모든 상품 보기
    	</div>
    	<div class='col-sm-1 60cus' style='border: 0.5px solid;'>예금 상품
    	</div>
    	<div class='col-sm-1 60cus' style='border: 1px '>적금 상품
    	</div>
    </div> -->
    <!-- End Featured Services Section -->
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center" style="margin-right:1050px;">
          <h2></h2>
          <ol>
            <li><a id='a_all' href="/bank/savingsR">전체 상품</a></li>
            <li><a id='a_dep' href="/bank/savingsdepositR">예금 상품</a></li>
            <li><a id='a_ins' href="/bank/savingsinstallmentR">적금 상품</a></li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
     <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs" style="background: #ffffff;">
      <div class="container">
      <form>
        <div class="d-flex justify-content-between align-items-center"  style="margin-right:100px;">
          <h2>&nbsp;</h2><br>
          <ol style="font-size: 16px;">
            <li>정렬 : &nbsp;&nbsp;&nbsp;<select id='sortSelectCustom' onchange="OrderChange()"><option value="recommend">추천순</option><option value="name">이름순</option></select></li> 
            <!-- <li>&nbsp;&nbsp;&nbsp;<select id='sortSelectCustom' onchange=""><option value="recommend">추천순</option></select></li>-->
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
			<div class="col-lg-4 col-md-6 content-item" style="width:70%; border-bottom:0px;">
			<c:if test="${savingsVO.sv_type.equals('예금')}">
	            <span style="font-size: 18px; width:5%; display:inline; vertical-align:middle;">예금&nbsp;&nbsp;</span><span class="material-icons" style='width:95%; display:inline; vertical-align:middle;'>monetization_on</span>
			</c:if>
			<c:if test="${savingsVO.sv_type.equals('적금')}">
	            <span style="font-size: 18px; width:5%; display:inline; vertical-align:middle;">적금&nbsp;&nbsp;</span><span class="material-icons" style='width:95%; display:inline; vertical-align:middle;'>stairs</span>
			</c:if>
            <h4 style="margin-top: 10px; margin-bottom: 10px;">
            	<c:out value="${savingsVO.sv_name}" />
            </h4>
            <p>
            <c:choose>
            	<c:when test="${savingsVO.sv_interest_36!=0}">
            		최고 금리 : <c:out value="${savingsVO.sv_interest_36}" /> %<br>
            	</c:when>
            	<c:when test="${savingsVO.sv_interest_24!=0}">
            		최고 금리 : <c:out value="${savingsVO.sv_interest_24}" /> %<br>
            	</c:when>
            	<c:when test="${savingsVO.sv_interest_12!=0}">
            		최고 금리 : <c:out value="${savingsVO.sv_interest_12}" /> %<br>
            	</c:when>
            	<c:otherwise>
            		최고 금리 : <c:out value="${savingsVO.sv_interest_6}" /> %<br>
            	</c:otherwise>
            </c:choose>
            </p>
          	</div>
          	<div style="width:30%; text-align:center; margin:auto;">
          	<div style="display:inline-block; text-align:center;">
          	<button class='btn btn60 infobtn' onclick='infobtn(${status.index})' id='infobtn_${status.index}'>상세보기</button>
          	
          	<c:if test="${user_info!=null}">
          	<button class='btn btn60' onclick='reqbtn(${savingsVO.sv_seq})' id='reqbtn'>가입하기</button>
          	</c:if>
          	<c:if test="${user_info==null}">
          	<button class='btn btn60' onclick='nologin()'>가입하기</button>
          	</c:if>
			
          	</div>
          	</div>
			
          
          	<div class="col-lg-4 content-item infoDIV" id="infodiv${status.index}" style="width:100%;">
           		<table class='table'>
           			<tr><th style='width:25%'><br>상품 설명</th><td>${fn:replace(savingsVO.sv_contents, '-', '<br/>-')}</td></tr>
           			<tr><th>가입 대상</th><td>${fn:replace(savingsVO.sv_target, '다.', '다.<br/>')}</td></tr>
           			<tr><th>이자 형태</th><td>
	           			<c:if test="${savingsVO.sv_interest_type eq 'simple'}">단리</c:if>
	           			<c:if test="${savingsVO.sv_interest_type eq 'compound'}">복리</c:if>
	           			/ 고정금리 / <c:out value="${savingsVO.sv_return_type}" />
	           			<br><br>
	           			<!-- 기간별 금리표 삽입 -->
	           			<table class='table table-bordered' style="width:50%">
	           			<caption align='right'>연 이율 ( 세전, % )</caption>
	           				<c:if test="${savingsVO.sv_interest_6!=0}"> <tr align='center'><td style='width:30%'>6개월 </td><th>${savingsVO.sv_interest_6} </th></tr></c:if>
	           				<c:if test="${savingsVO.sv_interest_12!=0}"><tr align='center'><td style='width:30%'>12개월</td><th>${savingsVO.sv_interest_12} </th></tr></c:if>
	           				<c:if test="${savingsVO.sv_interest_24!=0}"><tr align='center'><td style='width:30%'>24개월</td><th>${savingsVO.sv_interest_24} </th></tr></c:if>
	           				<c:if test="${savingsVO.sv_interest_36!=0}"><tr align='center'><td style='width:30%'>36개월</td><th>${savingsVO.sv_interest_36} </th></tr></c:if>
	           			</table>
	           		</td></tr>
	           		<c:if test="${savingsVO.sv_type.equals('예금')}">
	           			<tr><th>최소 납입금</th><td>
	           		</c:if>
	           		<c:if test="${savingsVO.sv_type.equals('적금')}">
	           			<tr><th>월 최소 납입금</th><td>
	           		</c:if>
	           		
	           		<c:if test="${savingsVO.sv_limit_min!=0}"><fmt:formatNumber value="${savingsVO.sv_limit_min}" pattern="#,###" /> 원</c:if>
	           		<c:if test="${savingsVO.sv_limit_min==0}">최소 한도 없음</c:if>
           			</td></tr>
           			
           			<c:if test="${savingsVO.sv_type.equals('예금')}">
	           			<tr><th>최대 납입금</th><td>
	           		</c:if>
	           		<c:if test="${savingsVO.sv_type.equals('적금')}">
	           			<tr><th>월 최대 납입금</th><td>
	           		</c:if>
	           		
	           		<c:if test="${savingsVO.sv_limit_max!=0}"><fmt:formatNumber value="${savingsVO.sv_limit_max}" pattern="#,###" /> 원</c:if>
	           		<c:if test="${savingsVO.sv_limit_max==0}">최대 한도 없음</c:if>
           			</td></tr>
           			
           			<tr><th>납입 형태</th><td>
           				<c:if test="${savingsVO.sv_payment_type eq 'M'}">매월</c:if>
           				<c:if test="${savingsVO.sv_payment_type eq 'D'}">매일</c:if>
           				<c:if test="${savingsVO.sv_payment_type eq 'I'}">즉시</c:if></td></tr>
           		</table>
          	</div><hr style="background-color: 	#8FBC8F; " >
		  </c:forEach>
		  
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
	var btnstatus = 100;
	
	function infobtn(idx){
		
		$(".infoDIV").hide();
		//alert("idx="+idx+" btnstatus="+btnstatus);
		if (btnstatus==100){
			
			$("#infobtn_"+idx).html('상세접기');
			$("#infodiv"+idx).show();
	
			btnstatus = idx;
			
		} else if (btnstatus == idx){
			
			$("#infobtn_"+idx).html('상세보기');
			$("#infodiv"+idx).hide();
			
			btnstatus = 100;
			
		} else if (btnstatus != idx){
			$(".infobtn").html('상세보기');
			
			$("#infobtn_"+idx).html('상세접기');
			$("#infodiv"+idx).show();
	
			btnstatus = idx;
		}
		
	}
	
	function reqbtn(sv_seq){
		console.log(sv_seq);
		
		// 가입 form 띄우기 전에 내가 가입한 상품인지 먼저 확인하기
		$.ajax({
			type 	: 'GET',
			url 	: 'http://172.21.200.26:8081/bank/savingCheck?sv_seq='+sv_seq,
			dataType : "text",
			success	: function(response){
				
				console.log(response);
				
				if(response=="0"){
					// 폼 사이트로 이동
					location.href='http://172.21.200.26:8081/bank/savingformLoad?sv_seq='+sv_seq;
				}else{
					alert("이미 가입한 상품입니다.");
				}
			},
			error	: function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		})
	}
	
	function nologin(){
		location.href='http://172.21.200.26:8081/bank/inner'
	}
	
	function OrderChange(){
		var opt = document.getElementById("sortSelectCustom");
		var optVal = opt.options[opt.selectedIndex].value;
		//console.log(optVal);
		console.log(window.location.href);
		var location = window.location.href;
		var go = "";
		if(optVal.includes("name")){
			if(window.location.href.indexOf("savingsinstallment") > -1){
				go ='savingsinstallmentN';
			}else if(window.location.href.indexOf("savingsdeposit") > -1){
				go = 'savingsdepositN';
			}else if(window.location.href.indexOf("savings") > -1){
				go ='savingsN';
			}else{console.log("?");}
		}else if(optVal.includes("recommend")){
			if(window.location.href.indexOf("savingsinstallment") > -1){
				go ='savingsinstallmentR';
			}else if(window.location.href.indexOf("savingsdeposit") > -1){
				go ='savingsdepositR';
			}else if(window.location.href.indexOf("savingsN") > -1){
				go ='savingsR';
			}else{console.log("?");}
		}
		console.log(go);
		//location.href='http://172.21.200.26:8081/bank/'+go;
		window.location.replace('http://172.21.200.26:8081/bank/'+go);	
	}
	
</script>
</body>

</html>
</body>
</html>