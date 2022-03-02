<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	load<hr>
	<c:forEach var="savingsVO" items="${savingslist}" varStatus="status">
		<p> ${status.index} :  <c:out value="${savingsVO.sv_name}" /></p>
	</c:forEach>
</body>
</html>