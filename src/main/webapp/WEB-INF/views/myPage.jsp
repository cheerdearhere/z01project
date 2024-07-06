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
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="row container">
	<nav class="navbar container col-2" style="top:0;">
		<ul class="navbar-nav">
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" href="productCart" id="productCart">장바구니</a>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" id="orderList" href="orderList?uEmail=${user_id}">주문하기</a>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" id="orderedList" href="userOrderedList?uEmail=${user_id}">구매한 상품</a>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" id="myReiview" href="myReiview?uEmail=${user_id}">내가 쓴 리뷰</a>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" id="myInfo" href="myInfo">내 정보 관리</a>
			</li>
		</ul>
	</nav>
	<div class="col-10">
		<div>
			<h3 id="myPageTitle" class="text-center mb-2">My Cart</h3>
			<hr/>
		</div>
		<div id="myPageContent" class="contener"></div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("#productCart").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#productCart").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("product Cart");
				$("#myPageTitle").text("My Cart");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	
	$("#orderList").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#orderList").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("orderList");
				$("#myPageTitle").text("order list");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});

	$("#orderedList").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#orderedList").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("orderedList");
				$("#myPageTitle").text("주문 상태");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});

	$("#myReiview").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#myReiview").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("myReiview");
				$("#myPageTitle").text("myReiview");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});


	$("#myInfo").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#myInfo").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("myInfo");
				$("#myPageTitle").text("myInfo");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//my page 첫화면(장바구니) 호출
	$("#productCart").trigger("click");
	
	$(".pclick").click(function(e){
		e.preventDefault();
		let productPage=window.open("","_blank","left=10,width=300");
		$.ajax({
			url: $(e.target).attr("href"),
			type: "get",
			data:"",
			success:function(data){
				productPage.document.write(data);
				$("#current").text("제품상세");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
				productPage.close();
			}
		});
	});
});
</script>
</body>
</html>