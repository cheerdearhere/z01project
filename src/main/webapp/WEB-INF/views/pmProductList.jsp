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
<title>Insert</title>
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
<style>
html, body{
	height: 100%;
	margin : 0;
	padding: 0;
}
</style>
</head>
<body>

<div class="container">
	<h1>상품 목록</h1>
	<table class="table">
		<thead>
			<tr>
				<th>등록번호</th>
				<th style="width:30%">표시이름</th>
				<th>등록시간</th>
				<th>가격</th>
				<th>수량</th>
				<th>종류</th>
				<th>new/best</th>
				<th>상태</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="productDto">
				<tr>
					<td>${productDto.pId}</td>
					<td>
						<a style="width:30%" href="pmProductView?pId=${productDto.pId}" class="managePclick btn btn-outline-primary w-100">
							${productDto.pName}
						</a>							
					</td>
					<td>${productDto.pDate}</td>
					<td>${productDto.pPrice}</td>
					<td>${productDto.pQuanty}</td>
					<td>${productDto.pType}</td>
					<td>${productDto.pBoard}</td>
					<td>${productDto.pState}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script>
//productMView
$(document).ready(function(){
	$(".managePclick").click(function(e){
		e.preventDefault();
		let evo = $(e.target);
		$.ajax({
			url: evo.attr("href"),
			type: "get",
			data: "",
			success: function(data){
				$("#managerBoard").html(data);
			},
			error: function(){
				alert("product details: 서버 접속 실패");
			}
		});
	});
});
</script>
</body>
</html>