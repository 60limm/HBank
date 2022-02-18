<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html style="
    padding : 100px;
">
<head>
<meta charset="UTF-8">
<title>transaction list</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> 
<!-- 제이쿼리 --><script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
  	table{
  		width: 800px !important;
  	}
  	
  	.balanceDIV{
  		width: 800px;
  	}
  	
  	th, td {
  		text-align: center;
  		vertical-align : middle !important;
	}
  	
</style>
<body>
<script>
	window.onload = function(){
		$(".transactionTD").hide();
	}
</script>
	<!-- 거래내역을 볼 계좌 선택하는 옵션 설정 <br> -->
	<a href='/bank/main'>메인으로 돌아가기</a>
	<h3>거래내역조회</h3>
	<br>
	
	<form>
		<table>
		
		<!-- <tr>
		<td colspan='2'> 시작일자 &nbsp; <input type='date' value='2021-02-14'> &nbsp; ~ &nbsp; 종료일자 &nbsp; <input type='date' value='2022-02-14' ></td>
		</tr> -->
		
		<tr><td>시작일자 <input type='date' value='2022-02-11' id='from_date' class="form-control"></td>
		<td>종료일자 <input type='date' id='to_date' class="form-control"></td></tr>
		
		<tr><td>
		<select class="form-control" id="selectAccount">
			<option value="none">- 선택 - </option>
			
			<c:forEach var="i" begin="0" end="${fn:length(JsonAccountList)-1}">
				<option id='${fn:replace(JsonAccountList.get(i).get('fintech_use_num'),'\"','')}'>
					${fn:replace(JsonAccountList.get(i).get('bank_name'),'\"','')} ${fn:replace(JsonAccountList.get(i).get('account_num_masked'),'\"','')} 
				</option>
			</c:forEach> 
		
		</select>
		</td>
		<td align='left'><button type='button' class='btn' onclick='selectAccountFn()' >거래내역 조회</button></td>
		
		</tr>
		<tr><td colspan='2' class='transactionTD'><div id='transactionDIV' class='transactionDIV'></div></td></tr>
		</table>
	</form>
	
<script>
	function selectAccountFn(){
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
			url : 'http://localhost:8081/bank/transactionlist/one?fintech_use_num='+fintech_use_num+"&from_date="+from_date+"&to_date="+to_date,
			dataType : "json",
			success : function(response){
				
				console.log(response["res_list"]);
				console.log(response["res_list"][0]);
				
				var inDIV = "<table class='table table-striped'><caption><br><br><b> 조회 결과 </b></caption>";
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