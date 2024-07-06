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
<style>
html, body{
	height: 100%;
	margin : 0;
	padding: 0;
}
</style>
<body>
<div class="container">
	<h1>관리자 홈</h1>
	<div class="row">
		<div class="card-columns mb-5">
			<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black; position:-webkit-sticky; ">
				<div class="card-body text-center">
					<h4>상품 등록</h4>
					<p class="card-text">상품 정보를 등록하는 페이지입니다.</p>
					<a href="productRegi" class="card-link stretched-link text-dark productRegi">click</a> 
				</div>
			</div>
			<div class="card border border-secondary bg-white homeCard"  style="box-shadow:3px 3px 5px black">	
				<div class="card-body text-center">
					<h4>상품 목록</h4>
					<p class="card-text">등록한 상품의 목록이 있는 페이지입니다.</p>
					<a href="productList" class="card-link stretched-link text-dark productList" >click</a>
				</div>
			</div>
			<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
				<div class="card-body text-center">
					<h4>주문 목록</h4>
					<p class="card-text mb-1">주문이 들어온 상품에 대한 페이지입니다.</p>
					<a href="orderList" class="card-link stretched-link text-dark orderList">click</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-columns mb-5">
			<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
				<div class="card-body text-center">
					<h4>고객 안내</h4>
					<p class="card-text">이용약관, 구매 가이드 등 도움말을 관리합니다.</p>
					<a href="clientHelp" class="card-link stretched-link text-dark clientHelp">click</a>
				</div>
			</div>
			<div class="card border border-secondary bg-white homeCard"  style="box-shadow:3px 3px 5px black">
				<div class="card-body text-center">
					<h5>교환/반품/환불 관리</h5>
					<p class="card-text">제품에대한 고객의 요청(교환, 반품, 환불)을 관리합니다.</p>
					<a href="clientRequest" class="card-link stretched-link text-dark clientRequest">click</a>
				</div>
			</div>
			<div class="card border border-secondary bg-white homeCard"  style="box-shadow:3px 3px 5px black">
				<div class="card-body text-center">
					<h4>고객 리뷰 관리</h4>
					<p class="card-text">고객이 구입한 상품에 남긴 리뷰를 관리합니다.</p>
					<a href="userReview" class="card-link stretched-link text-dark userReview">click</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="card-columns mb-5">
			<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
				<div class="card-body text-center">
					<h4>채용관리</h4>
					<p class="card-text">구인정보를 관리하는 페이지입니다.</p>
					<a href="recruit" class="card-link stretched-link text-dark recruit">click</a>
				</div>
			</div>
			<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
				<div class="card-body text-center">
					<h4>판매자 문의</h4>
					<p class="card-text">페이지를 운영하실때 도움이 필요하시면 연락주세요.</p>
					<a href="managerHelp" class="card-link stretched-link text-dark managerHelp">click</a>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$(".managerHome").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(".managerHome").attr("href"),
			type: "get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("판매 관리자 home입니다.");
			},
			error: function(){
				alert("pmHome: 서버 접속 실패");
			}
		});
	});
	$(".productRegi").click(function(event){
		event.preventDefault();
		$.ajax({
			url: "productRegi",
			type: "get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("판매 물품 등록 페이지입니다.");
			},
			error: function(){
				alert("pmHome: 서버 접속 실패");
			}
		});
	});
	$(".mainPage").click(function(event){
		event.preventDefault();
		$.ajax({
			url: "mainPage",
			type: "get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("첫화면 관리 페이지입니다.");
			},
			error: function(){
				alert("mainPage: 서버 접속 실패");
			}
		});
	});
	$(".productList").click(function(e){
		e.preventDefault();
		$.ajax({
			url:"productList",
			type:"get",
			data: "",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("등록제품 목록입니다.");
			},
			error: function(){
				alert("product List: 서버 접속 실패");
			}
		});
	});

});
</script>	
</body>
</html>