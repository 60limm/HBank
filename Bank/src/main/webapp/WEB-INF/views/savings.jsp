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
  
  <!-- ???????????? -->
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
		
		
		if(location.indexOf("N") > -1){
			$("#sortSelectCustom").html("<option value='name'>?????????</option><option value='recommend'>?????????</option>");
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
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg" >
      <div class="section-title" >
      	  <br><br>
          <h2>????????????</h2>
          <p>HBank??? ?????? ????????? ???????????????<br>???????????? ????????? ???????????????</p><br>
      </div>
    </section>
    <!-- ======= Featured Services Section ======= -->
    <!-- <section id="featured-services" class="featured-services section-bg">
      <div class="container">
        <div class="row no-gutters">
          <div class="col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><span class="material-icons" style='width:95%; display:inline; vertical-align:middle;'>monetization_on</span></div>
              <h4 class="title"><a href="/bank/savingsdeposit">??????</a></h4>>-->
              <!--<p class="description">?????? ????????? ???????????? ?????? ???????????????</p>-->
           <!--  </div>
          </div>
          <div class="col-md-6" style="width:50%;">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="/bank/savingsinstallment">??????</a></h4> -->
              <!-- <p class="description">????????? ???????????? ???????????? ??????/?????? ???????????????.</p>-->
            <!-- </div>
          </div>
        </div>
      </div>
    </section>-->
    <!-- 
    <div class="row" style="padding-left: 150px;padding-right: 150px;">
    	<div class='col-sm-1 60cus' style='border: 1px; color: grey;'>?????? ?????? ??????
    	</div>
    	<div class='col-sm-1 60cus' style='border: 0.5px solid;'>?????? ??????
    	</div>
    	<div class='col-sm-1 60cus' style='border: 1px '>?????? ??????
    	</div>
    </div> -->
    <!-- End Featured Services Section -->
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center" style="margin-right:1050px;">
          <h2></h2>
          <ol>
            <li><a id='a_all' href="/bank/savingsR">?????? ??????</a></li>
            <li><a id='a_dep' href="/bank/savingsdepositR">?????? ??????</a></li>
            <li><a id='a_ins' href="/bank/savingsinstallmentR">?????? ??????</a></li>
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
            <li id='orderli'>?????? : &nbsp;&nbsp;&nbsp;<select id='sortSelectCustom' onchange="OrderChange()"><option value="recommend">?????????</option><option value="name">?????????</option></select></li> 
            <!-- <li>&nbsp;&nbsp;&nbsp;<select id='sortSelectCustom' onchange=""><option value="recommend">?????????</option></select></li>-->
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
			<c:if test="${savingsVO.sv_type.equals('??????')}">
	            <span style="font-size: 18px; width:5%; display:inline; vertical-align:middle;">??????&nbsp;&nbsp;</span><span class="material-icons" style='width:95%; display:inline; vertical-align:middle;'>monetization_on</span>
			</c:if>
			<c:if test="${savingsVO.sv_type.equals('??????')}">
	            <span style="font-size: 18px; width:5%; display:inline; vertical-align:middle;">??????&nbsp;&nbsp;</span><span class="material-icons" style='width:95%; display:inline; vertical-align:middle;'>stairs</span>
			</c:if>
            <h4 style="margin-top: 10px; margin-bottom: 10px;">
            	<c:out value="${savingsVO.sv_name}" />
            </h4>
            <p>
            <c:choose>
            	<c:when test="${savingsVO.sv_interest_36!=0}">
            		?????? ?????? : <c:out value="${savingsVO.sv_interest_36}" /> %<br>
            	</c:when>
            	<c:when test="${savingsVO.sv_interest_24!=0}">
            		?????? ?????? : <c:out value="${savingsVO.sv_interest_24}" /> %<br>
            	</c:when>
            	<c:when test="${savingsVO.sv_interest_12!=0}">
            		?????? ?????? : <c:out value="${savingsVO.sv_interest_12}" /> %<br>
            	</c:when>
            	<c:otherwise>
            		?????? ?????? : <c:out value="${savingsVO.sv_interest_6}" /> %<br>
            	</c:otherwise>
            </c:choose>
            </p>
          	</div>
          	<div style="width:30%; text-align:center; margin:auto;">
          	<div style="display:inline-block; text-align:center;">
          	<button class='btn btn60 infobtn' onclick='infobtn(${status.index})' id='infobtn_${status.index}'>????????????</button>
          	
          	<c:if test="${user_info!=null}">
          	<button class='btn btn60' onclick='reqbtn(${savingsVO.sv_seq})' id='reqbtn'>????????????</button>
          	</c:if>
          	<c:if test="${user_info==null}">
          	<button class='btn btn60' onclick='nologin()'>????????????</button>
          	</c:if>
			
          	</div>
          	</div>
			
          
          	<div class="col-lg-4 content-item infoDIV" id="infodiv${status.index}" style="width:100%;">
           		<table class='table'>
           			<tr><th style='width:25%'><br>?????? ??????</th><td>${fn:replace(savingsVO.sv_contents, '-', '<br/>-')}</td></tr>
           			<tr><th>?????? ??????</th><td>${fn:replace(savingsVO.sv_target, '???.', '???.<br/>')}</td></tr>
           			<tr><th>?????? ??????</th><td>
	           			<c:if test="${savingsVO.sv_interest_type eq 'simple'}">??????</c:if>
	           			<c:if test="${savingsVO.sv_interest_type eq 'compound'}">??????</c:if>
	           			/ ???????????? / <c:out value="${savingsVO.sv_return_type}" />
	           			<br><br>
	           			<!-- ????????? ????????? ?????? -->
	           			<table class='table table-bordered' style="width:50%">
	           			<caption align='right'>??? ?????? ( ??????, % )</caption>
	           				<c:if test="${savingsVO.sv_interest_6!=0}"> <tr align='center'><td style='width:30%'>6?????? </td><th>${savingsVO.sv_interest_6} </th></tr></c:if>
	           				<c:if test="${savingsVO.sv_interest_12!=0}"><tr align='center'><td style='width:30%'>12??????</td><th>${savingsVO.sv_interest_12} </th></tr></c:if>
	           				<c:if test="${savingsVO.sv_interest_24!=0}"><tr align='center'><td style='width:30%'>24??????</td><th>${savingsVO.sv_interest_24} </th></tr></c:if>
	           				<c:if test="${savingsVO.sv_interest_36!=0}"><tr align='center'><td style='width:30%'>36??????</td><th>${savingsVO.sv_interest_36} </th></tr></c:if>
	           			</table>
	           		</td></tr>
	           		<c:if test="${savingsVO.sv_type.equals('??????')}">
	           			<tr><th>?????? ?????????</th><td>
	           		</c:if>
	           		<c:if test="${savingsVO.sv_type.equals('??????')}">
	           			<tr><th>??? ?????? ?????????</th><td>
	           		</c:if>
	           		
	           		<c:if test="${savingsVO.sv_limit_min!=0}"><fmt:formatNumber value="${savingsVO.sv_limit_min}" pattern="#,###" /> ???</c:if>
	           		<c:if test="${savingsVO.sv_limit_min==0}">?????? ?????? ??????</c:if>
           			</td></tr>
           			
           			<c:if test="${savingsVO.sv_type.equals('??????')}">
	           			<tr><th>?????? ?????????</th><td>
	           		</c:if>
	           		<c:if test="${savingsVO.sv_type.equals('??????')}">
	           			<tr><th>??? ?????? ?????????</th><td>
	           		</c:if>
	           		
	           		<c:if test="${savingsVO.sv_limit_max!=0}"><fmt:formatNumber value="${savingsVO.sv_limit_max}" pattern="#,###" /> ???</c:if>
	           		<c:if test="${savingsVO.sv_limit_max==0}">?????? ?????? ??????</c:if>
           			</td></tr>
           			
           			<tr><th>?????? ??????</th><td>
           				<c:if test="${savingsVO.sv_payment_type eq 'M'}">??????</c:if>
           				<c:if test="${savingsVO.sv_payment_type eq 'D'}">??????</c:if>
           				<c:if test="${savingsVO.sv_payment_type eq 'I'}">??????</c:if></td></tr>
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
			
			$("#infobtn_"+idx).html('????????????');
			$("#infodiv"+idx).show();
	
			btnstatus = idx;
			
		} else if (btnstatus == idx){
			
			$("#infobtn_"+idx).html('????????????');
			$("#infodiv"+idx).hide();
			
			btnstatus = 100;
			
		} else if (btnstatus != idx){
			$(".infobtn").html('????????????');
			
			$("#infobtn_"+idx).html('????????????');
			$("#infodiv"+idx).show();
	
			btnstatus = idx;
		}
		
	}
	
	function reqbtn(sv_seq){
		console.log(sv_seq);
		
		// ?????? form ????????? ?????? ?????? ????????? ???????????? ?????? ????????????
		$.ajax({
			type 	: 'GET',
			url 	: 'http://172.21.200.26:8081/bank/savingCheck?sv_seq='+sv_seq,
			dataType : "text",
			success	: function(response){
				
				console.log(response);
				
				if(response=="0"){
					// ??? ???????????? ??????
					location.href='http://172.21.200.26:8081/bank/savingformLoad?sv_seq='+sv_seq;
				}else{
					alert("?????? ????????? ???????????????.");
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