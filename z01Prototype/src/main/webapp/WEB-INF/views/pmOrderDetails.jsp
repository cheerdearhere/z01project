<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>pmOrderDetails</title>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<div class="container">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th style="width:25%;"></th>
				<th style="width:75%;">내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>주문번호</td><td></td>
			</tr>
			<tr>
				<td>주문일</td><td></td>
			</tr>
			<tr>
				<td>제품번호</td><td></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td>
					<a></a>
				</td>
			</tr>
			<tr>
				<td>수량</td><td></td>
			</tr>
			<tr>
				<td>가격/총액</td><td>3500/13000</td>
			</tr>
			<tr>
				<td>할인 적용사항</td><td></td>
			</tr>
			<tr>
				<td>색상/사이즈</td><td></td>
			</tr>
			<tr>
				<td>고객ID</td><td></td>
			</tr>
			<tr>
				<td>배송지</td><td></td>
			</tr>
			<tr>
				<td>연락처</td><td></td>
			</tr>
			<tr>
				<td>요청사항</td><td></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>