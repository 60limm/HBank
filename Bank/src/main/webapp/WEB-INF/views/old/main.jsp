<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style="
    padding : 100px;
">
<head>
<meta charset="UTF-8">
<title>Main</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<!-- 제이쿼리 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<style>
	<!--토큰 사이즈 조절-->
	table, th, td {
    	border: 1px solid #bcbcbc;
    	text-overflow: ellipsis !important;
    	overflow: hidden !important;
    	white-space: nowrap !important;
		max-width: 600px !important;
		min-width: 100px !important;
  	}
  	table{
  		width: 600px !important;
  	}
  	td{
  		height: 25px;
  	}
  	th, td {
  		text-align: center;
  		vertical-align : middle !important;
	}
  	input{
  		width:595px;
  		heigh:100%;
  		letter-spacing: 1px;
  	}
  	#wrapper{
  		margin : 0 auto;
  	}
</style>
<script>
	window.onload = function(){
		$("#loginForm").hide();
	}
	
	function FnLoginClick(){
		$("#loginForm").show();
	}
	function FnLogoutClick(){
		alert("로그아웃 합니다");
		location.href= 'http://localhost:8081/bank/logout'
	}	
</script>
<body>
 	<br> 

	
	<h3> main </h3>
	
 	<c:if test="${user_info==null}">
 		<a href='http://localhost:8081/bank/join?sign=n'>
		회원가입
		</a>

		<br>
	
		<a href='#' onclick='FnLoginClick()'>
		로그인
		</a>
			<!-- 로그인 버튼 클릭 시 div.show() -->
			<div id='loginForm'>
			<br>
			<form action='loginForm' method='post'>
				<table class='table table-bordered'>
					<tr>
						<td>아이디</td>
						<td><input type='text' id='user_id' name='user_id' class="form-control" required></td>
					</tr>				
					<tr>
						<td>비밀번호</td>
						<td><input type='password' id='user_pw' name='user_pw' class="form-control" required></td>
					</tr>
					<tr>
						<td colspan='2' align='center'><button type='submit' class='btn'>로그인</button></td>
					</tr>										
				</table>
			</form>
		</div>
 	</c:if>
 	
 	<!-- 로그인 완료 시 나타날 화면 -->
  	<c:if test="${user_info!=null}">
		<a href='#' onclick='FnLogoutClick()'>로그아웃</a>
		<br>
		<a href='http://localhost:8081/bank/accountlist'>내 계좌</a>
		<br>
		<a href='#'>이체하기</a>
		<br>
		<a href='http://localhost:8081/bank/transactionlist'>거래내역조회</a>
 	</c:if>
 		
		
		<!-- 
		<div id='wrapper'>
			<form>
				<table>
					<tr>
						<td>회원번호</td>
						<td>${user_seq_no}</td>
					</tr>				
					<tr>
						<td>아이디</td>
						<td><input type='text' id='user_id' name='user_id' required></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type='password' id='user_pw' name='user_pw' required></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type='text' id='user_name' name='user_name' required></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="tel" id="user_tel" name="user_tel" title="전화번호를 입력하세요." placeholder="010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13"></td>
					</tr>
					<tr>
						<td>토큰</td>
						<td>eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDAzMDAyIiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2NTE3MDkxODQsImp0aSI6IjVlZmM1M2JmLTBkOGItNDU4Zi05ZWYyLWI3MGRmYjI1MTBkOCJ9.CW9J5oXOCwVqQv2ikLubiJtCvn3qv5y5_M2i9rvvn3k</td>
					</tr>
					<tr>
						<td colspan='2' align='center'><button type='submit'>회원가입</button></td>
					</tr>										
				</table>
				<input type='hidden' name='user_seq_no' value='${user_seq_no}'>
				<input type='hidden' name='user_token' value='${access_token}'>
				<input type='hidden' name='user_refresh_token' value='${refresh_token}'>
			</form>
 		</div>
 		-->
 		
</body>

</html>