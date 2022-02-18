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
<!-- �������� --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<style>
	<!--��ū ������ ����-->
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
	����� ���� �� ���� ��� / ��ū �߱�
	
	<br>
	
	<c:choose>
		<c:when test="${fn:contains(sign, 't')}">
			<!-- 
			��ū : ${access_token}<br>
			������ū : ${refresh_token}<br>
			����� ������ȣ : ${user_seq_no}
			-->
			
			<div id='wrapper'>
			<!-- ȸ������ form -->
			<form action='joinForm' method='post'>
				<table>
					<tr>
						<td>ȸ����ȣ</td>
						<td>${user_seq_no}</td>
					</tr>				
					<tr>
						<td>���̵�</td>
						<td><input type='text' id='user_id' name='user_id' required></td>
					</tr>
					<tr>
						<td>��й�ȣ</td>
						<td><input type='password' id='user_pw' name='user_pw' required></td>
					</tr>
					<tr>
						<td>�̸�</td>
						<td><input type='text' id='user_name' name='user_name' required></td>
					</tr>
					<tr>
						<td>��ȭ��ȣ</td>
						<td><input type="tel" id="user_tel" name="user_tel" title="��ȭ��ȣ�� �Է��ϼ���." placeholder="010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13" required></td>
					</tr>
					<tr>
						<td>��ū</td>
						<td>${access_token}</td>
					</tr>
					<!-- 
					<tr>
						<td>������ū</td>
						<td>${refresh_token}</td>
					</tr>
					-->					
					<tr>
						<td colspan='2' align='center'><button type='submit'>ȸ������</button></td>
					</tr>										
				</table>
				<!-- �Ʒ� �� ���� text -> hidden �� �������־�� �� -->
				<input type='hidden' name='user_seq_no' value='${user_seq_no}'>
				<input type='hidden' name='user_token' value='${access_token}'>
				<input type='hidden' name='user_refresh_token' value='${refresh_token}'>
			</form>
			</div>
		</c:when>
		
		<c:otherwise>
			<a href='https://testapi.openbanking.or.kr/oauth/2.0/authorize?response_type=code&client_id=1d6518bc-b15d-4a70-bde1-390d0677953a&redirect_uri=http://localhost:8081/bank/join&scope=login inquiry transfer oob&state=00000000000000000000000000000001&auth_type=0'>
			����� ���� �ޱ�
			</a>
		</c:otherwise>
	</c:choose>
	
</body>
</html>