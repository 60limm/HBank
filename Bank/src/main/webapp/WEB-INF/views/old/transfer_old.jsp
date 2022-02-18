<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style="
    padding: 100px;
">
<head>
<meta charset="UTF-8">
<title>Transfer</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<!-- 제이쿼리 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	
  	table{
  		width: 500px !important;
  	}
  	
  	th, td {
  		text-align: center;
  		vertical-align : middle !important;
	}
</style>
	<h3>Transfer</h3>
	
	<form action="transfer/check" method="POST">
	<table class='table table-bordered'>
	<caption>송금 정보</caption>
		<tr>
			<th>출금 계좌번호</th>
			<td colspan='2'><input type='text' name='cntr_account_num' value='${account_num_masked}' class="form-control"></td>
		</tr>
		<tr>
			<th>은행</th>
			<td>
				<select name="recv_client_bank_code" class="form-control" id='test'>
					<option value="none">선택</option>		<option value='002'>산업은행</option>
					<option value='003'>기업은행</option>		<option value='004'>KB국민은행</option>
					<option value='007'>수협은행</option>		<option value='008'>수출입은행</option>
					<option value='011'>NH농협은행</option>	<option value='012'>지역농축협</option>
					<option value='020'>우리은행</option>		<option value='023'>SC제일은행</option>
					<option value='027'>한국씨티은행</option>	<option value='031'>대구은행</option>
					<option value='032'>부산은행</option>		<option value='034'>광주은행</option>
					<option value='035'>제주은행</option>		<option value='037'>전북은행</option>
					<option value='039'>경남은행</option>		<option value='045'>새마을금고</option>
					<option value='048'>신협</option>			<option value='050'>저축은행</option>
				</select>
			</td>
			<td rowspan='2'><button type='button' class='btn btn-xs' onclick='FNRecvCheck()'>예금주확인</button></td>
		</tr>
		<tr>
			<th>입금 계좌번호</th>
			<td><input type='text' name='recv_client_account_num' class="form-control"></td>
		</tr>
		<tr>
			<th>예금주</th>
			<!-- <td colspan='2'><input type='text' name='recv_client_name' class="form-control" disabled></td> -->
			<td colspan='2'><input type='text' name='recv_client_name' class="form-control" ></td>
		</tr>
		<tr>
			<th>금액(KRW)</th>
			<td colspan='2'><input type='text' name='tran_amt' class="form-control"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan='2'><input type='text' name='dps_print_content' class="form-control"></td>
		</tr>
		<tr>
			<th>핀테크</th>
			<td colspan='2'>
				${fintech_use_num }
				<input type='hidden' name='fintech_use_num' class="form-control" value='${fintech_use_num }'>
			</td>
		</tr>
		<tr>
			<td colspan='3'><button type='submit' class='btn'>확인</button>
		</tr>

	</table>
	</form>
	
<script>
	function FNRecvCheck(){
		alert("예금주확인하는 api 연동헤야행");
		var name = $('#test').val();
		alert(name);
	}
</script>	
</body>
</html>