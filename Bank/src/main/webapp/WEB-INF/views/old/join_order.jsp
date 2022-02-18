<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html style="
    padding-left: 100px;
    padding-right: 100px;
">
<head>
<meta charset="UTF-8">
<title>Join</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<!-- 제이쿼리 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<style>
	<!--토큰 사이즈 조절-->
	table, th, td {
    	border: 1px solid #bcbcbc;
    	text-overflow: ellipsis;
    	overflow: hidden;
    	white-space: nowrap;
		max-width: 600px;
		min-width: 100px;
  }
  	table{
  		width: 600px;
  	}
  	td{
  		height: 25px;
  	}
  	input{
  		width:595px;
  		heigh:100%;
  		letter-spacing: 1px;
  	}
</style>
<body>
	<h3>authorize ~ token</h3>
	사용자 인증 및 계좌 등록 / 토큰 발급
	
	<br>
	
	<c:choose>
		<c:when test="${fn:contains(sign, 't')}">
			<!-- 
			토큰 : ${access_token}<br>
			갱신토큰 : ${refresh_token}<br>
			사용자 고유번호 : ${user_seq_no}
			-->
			
			<div id='wrapper'>
			<!-- 회원가입 form -->
			<form action='joinForm' method='post'>
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
						<td><input type="tel" id="user_tel" name="user_tel" title="전화번호를 입력하세요." placeholder="010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required></td>
					</tr>
					<tr>
						<td>토큰</td>
						<td>${access_token}</td>
					</tr>
					<!-- 
					<tr>
						<td>갱신토큰</td>
						<td>${refresh_token}</td>
					</tr>
					-->					
					<tr>
						<td colspan='2' align='center'><button type='submit'>회원가입</button></td>
					</tr>										
				</table>
				<!-- 아래 세 개는 text -> hidden 로 변경해주어야 함 -->
				<input type='hidden' name='user_seq_no' value='${user_seq_no}'>
				<input type='hidden' name='user_token' value='${access_token}'>
				<input type='hidden' name='user_refresh_token' value='${refresh_token}'>
			</form>
			</div>
		</c:when>
		
		<c:otherwise>
			<a href='https://testapi.openbanking.or.kr/oauth/2.0/authorize?response_type=code&client_id=1d6518bc-b15d-4a70-bde1-390d0677953a&redirect_uri=http://localhost:8081/bank/join&scope=login inquiry transfer oob&state=00000000000000000000000000000001&auth_type=0'>
			사용자 인증 받기
			</a>
		</c:otherwise>
	</c:choose>
	
</body>
</html>