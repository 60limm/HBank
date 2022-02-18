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
<title>account</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<!-- 제이쿼리 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<style>
  	table{
  		width: 700px !important;
  	}
  	
  	.balanceDIV{
  		width: 600px;
  	}
  	
  	th, td {
  		text-align: center;
  		vertical-align : middle !important;
	}
  	
</style>
<body>
<script>
	window.onload = function(){
		$(".balanceTD").hide();
	}

</script>
	<a href='/bank/main'>메인으로 돌아가기</a>
	<h3>Account List</h3>
	<!-- ${JsonAccountList.get(0).get("fintech_use_num")} 하나 나오는지 확인 
	<br>
	${fn:length(JsonAccountList) } 길이 확인
	<br> -->
	
	<!-- 
	<c:forEach var="account" items="${JsonAccountList}" varStatus="status">
		<p id='str'> ${status.count} : <c:out value="${account}" /> &nbsp <button>조회</button></p>
	</c:forEach>
	-->
	
	<table class='table' id='1sttable'>
	<tr>
		<th>은행</th>
		<th>계좌번호</th>
		<th>별명</th>
		<th>d</th>
		<th></th>
	</tr>
	
	<c:forEach var="i" begin="0" end="${fn:length(JsonAccountList)-1}">
		<tr id='balanceTR${i}' style="
    padding-bottom: 12px;
    padding-top: 12px;
">
			<td style="
    padding-bottom: 12px;
    padding-top: 12px;
"><c:out value="${fn:replace(JsonAccountList.get(i).get('bank_name'),'\"','')} "> </c:out> </td>
			<td><c:out value="${fn:replace(JsonAccountList.get(i).get('account_num_masked'),'\"','')} "></c:out></td>
			<td><c:out value="${fn:replace(JsonAccountList.get(i).get('account_alias'),'\"','')} "> </c:out></td>
			<!--<td><c:out value="${fn:replace(JsonAccountList.get(i).get('fintech_use_num'),'\"','')} "> </c:out></td>-->
			<td><button type="button" class="btn btn-link" id="btn${i}" onclick='FnAccountClick(${JsonAccountList.get(i).get('fintech_use_num')},${i})'>조회</button></td>
			<td><button type="button" class="btn btn-link" id="btnT${i}" onclick='FnTransfer(${JsonAccountList.get(i).get('fintech_use_num')},${JsonAccountList.get(i).get('account_num_masked')})'>송금</button></td>
		</tr>
		<tr>
			<td colspan='5' class='balanceTD' id='balanceTD${i}'><div class='balanceDIV' id='balanceDIV${i}'></div></td>
		</tr>
	</c:forEach>
	</table>

<script>
	function FnAccountClick(fintech_use_num,i){
		console.log(fintech_use_num);
		$("#balanceTD"+i).show();
		$("#btn"+i).text('취소');
		
		$("#balanceTR"+i).css("background",'WhiteSmoke');
		
		//ajax 통신으로 만들어보자
		$.ajax({
			type :'GET',
			url : 'http://localhost:8081/bank/accountlist/balance?fintech_use_num='+fintech_use_num,
			//dataType : "text",
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
				
				var inDIV = "<table class='table table-bordered'><caption><b>계좌 정보 조회</b></caption>";
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
	
	function FnTransfer(fintech_use_num, account_num_masked){
		//송금 클릭 시 form 입력하도록
		
		location.href= 'http://localhost:8081/bank/transfer?fintech_use_num='+fintech_use_num+"&account_num_masked="+account_num_masked;
	}

</script>
</body>
</html>