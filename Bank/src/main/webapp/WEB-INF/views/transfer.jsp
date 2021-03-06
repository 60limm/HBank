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
            <li>Transfer</li>
          </ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Featured Services Section ======= -->
    <section id="featured-services" class="featured-services section-bg">
      <div class="section-title">
      	  <br><br>
          <h2>??????</h2>
          <p>????????? ?????? ????????? ?????? ????????? ???????????????.</p><br>
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
            <h4>????????????</h4>
            <p>??????????????? ????????? ??????????????? ????????? ???????????????.</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>02</span>
            <h4>???????????????</h4>
            <p>????????? ???????????? ????????? ??????????????? ????????? ???????????? ??????????????? ???????????????. </p>
          </div>

          <div class="col-lg-4 col-md-6 content-item">
            <span>03</span>
            <h4>????????????</h4>
            <p>??????????????? ???????????? ????????? ????????? ???????????????.</p>
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
			<!--<caption>?????? ??????</caption>-->
			<tr>
				<th>?????? ????????????</th>
				<td colspan='3'><input type='text' id='cntr_account_num' name='cntr_account_num' value='${account_num_masked}' class="form-control"></td>
				<!-- 
				<th>?????? ??????</th>
				<td>
				<select name="cntr_bank_code" class="form-control" id='cntr_bank_code'>
					<option value="none">??????</option>		<option value='002'>????????????</option>
					<option value='003'>????????????</option>		<option value='004'>KB????????????</option>
					<option value='007'>????????????</option>		<option value='008'>???????????????</option>
					<option value='011'>NH????????????</option>	<option value='012'>???????????????</option>
					<option value='020'>????????????</option>		<option value='023'>SC????????????</option>
					<option value='027'>??????????????????</option>	<option value='031'>????????????</option>
					<option value='032'>????????????</option>		<option value='034'>????????????</option>
					<option value='035'>????????????</option>		<option value='037'>????????????</option>
					<option value='039'>????????????</option>		<option value='045'>???????????????</option>
					<option value='048'>??????</option>			<option value='050'>????????????</option>
				</select>
				</td>
				-->
			</tr>
			<tr>
				<th>?????? ????????????</th>
				<td><input type='text' id='recv_client_account_num' name='recv_client_account_num' class="form-control" required></td>
				<th>?????? ??????</th>
				<td>
				<select name="recv_client_bank_code" class="form-control" id='recv_client_bank_code'>
					<option value="none">??????</option>		<option value='002'>????????????</option>
					<option value='003'>????????????</option>		<option value='004'>KB????????????</option>
					<option value='007'>????????????</option>		<option value='008'>???????????????</option>
					<option value='011'>NH????????????</option>	<option value='012'>???????????????</option>
					<option value='020'>????????????</option>		<option value='023'>SC????????????</option>
					<option value='027'>??????????????????</option>	<option value='031'>????????????</option>
					<option value='032'>????????????</option>		<option value='034'>????????????</option>
					<option value='035'>????????????</option>		<option value='037'>????????????</option>
					<option value='039'>????????????</option>		<option value='045'>???????????????</option>
					<option value='048'>??????</option>			<option value='050'>????????????</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>??????(KRW)</th>
				<td colspan='3'><input type='text' name='tran_amt' id='tran_amt' class="form-control" required></td>
			</tr>
			<tr>
				<th>?????????</th>
				<td colspan='2'><input type='text' id='recv_client_name' name='recv_client_name' class="form-control" readonly required></td>
				<td><button type='button' class='btn btn-xs' onclick='FNRecvCheck()'>????????? ??????</button></td>
			</tr>
			<tr>
				<th>??????</th>
				<td colspan='3' ><input type='text' id='dps_print_content' name='dps_print_content' class="form-control" required></td>
			</tr>
			<tr>
				<td colspan='4'><button type='submit' class='btn'>?????? ??????</button>
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