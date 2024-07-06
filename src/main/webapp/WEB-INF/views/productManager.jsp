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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<title>PM</title>
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
<!-- Chart.js API -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<!-- CKEditor API -->
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/decoupled-document/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<!-- external style sheet -->
<link href="style/productManager.css" type="text/css" rel="stylesheet"/>
</head>

<body>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>

<nav class="row justify-content-center text-center">
	<div class="container-fluid">
		<a class="navbar-brand" href="main"><img src="media/LOGO.jpg" alt="회사 로고"></a>
	</div>
	<p id="infotxt" class="text-center">${user_id}님 안녕하세요.</p>
</nav>
<nav class="manageTab navbar navbar-expand-lg navbar-dark bg-dark text-center font-weight-bold">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggle">
		<span class="fas fa-bars" style="color:white;"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarToggle">
		<ul class="navbar-nav nav nav-tabs mx-auto" style="width:100%;" role="tablist">
			<li class="nav-item">
				<a href="managerHome" class="managerHome nav-link active" data-toggle="tab">
					<i class="fas fa-home"></i> Home
				</a>
			</li>
			<li class="nav-item">
				<a href="productRegi" class="productRegi nav-link"  data-toggle="tab">
					<i class="fas fa-hand-holding-heart"></i> 상품 등록
				</a>
			</li>
			<li class="nav-item">
				<a href="productList" class="productList nav-link"  data-toggle="tab">
					<i class="fas fa-grip-horizontal"></i> 상품 목록
				</a>
			</li>
			<li class="nav-item">
				<a href="orderList" class="mainPage nav-link" data-toggle="tab">
					<i class="fas fa-desktop"></i> 홈 관리
				</a>
			</li>
			<li class="nav-item">
				<a href="pmOrderList" class="pmOrderList nav-link" data-toggle="tab">
					<i class="fas fa-list-ul"></i> 주문 목록
				</a>
			</li>
			<li class="nav-item">
				<a href="clientHelp" class="clientHelp nav-link" data-toggle="tab">
					<i class="fas fa-eraser"></i> 도움말 관리
				</a>
			</li>
			<li class="nav-item">
				<a href="clientRequest" class="clientRequest nav-link" data-toggle="tab">
					<i class="fas fa-eraser"></i> 교환/반품/환불
				</a>
			</li>
			<li class="nav-item">
				<a href="pmrBoardView" class="rBoardView nav-link" data-toggle="tab">
					<i class="fas fa-grin-alt"></i> 고객 리뷰
				</a>
			</li>
			<li class="nav-item">
				<a href="pageInfo" class="pageInfo nav-link" data-toggle="tab">
					<i class="fas fa-chart-bar"></i> 통계
				</a>
			</li>
			<li class="nav-item">
				<a href="managerHelp" class="managerHelp nav-link" data-toggle="tab">
					<i class="fas fa-question-cicle">
				</i> 판매자 문의</a>
			</li>
			<li class="nav-item">
				<a href="logoutView" class="nav-link">
					<i class="fas fa-lock-open"></i> logout
				</a>
			</li>
		</ul>
	</div>
</nav>
<section class="mb-5">
	<div id="managerBoard" class="tab-content tab-pane bg-white active">
		<div class="container">
			<h1>관리자 홈</h1>
			<div class="row">
				<div class="card-columns mb-2">
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black; position:-webkit-sticky; ">
						<div class="card-body text-center">
							<h4>상품 등록</h4>
							<p class="card-text mb-1">상품 정보를 등록하는 페이지입니다.</p>
							<a href="productRegi" class="productRegi card-link stretched-link text-dark">click</a> 
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">	
						<div class="card-body text-center">
							<h4>상품 목록</h4>
							<p class="card-text mb-1">등록한 상품의 목록이 있는 페이지입니다.</p>
							<a href="productList" class="productList card-link stretched-link text-dark">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>Home 관리</h4>
							<p class="card-text mb-1">사진 슬라이드와 메인 사진 등 첫 화면을 관리합니다. </p>
							<a href="mainPage" class="mainPage card-link stretched-link text-dark">click</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="card-columns mb-2">
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>주문 목록</h4>
							<p class="card-text mb-1">주문이 들어온 상품에 대한 페이지입니다.</p>
							<a href="pmOrderList" class="pmOrderList card-link stretched-link text-dark">click</a>
						</div>
					</div>
					
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>고객 안내</h4>
							<p class="card-text mb-1">이용약관, 구매 가이드 등 도움말을 관리합니다.</p>
							<a href="clientHelp" class="clientHelp card-link stretched-link text-dark">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h5>교환/반품/환불 관리</h5>
							<p class="card-text mb-1">제품에대한 고객의 요청(교환, 반품, 환불)을 관리합니다.</p>
							<a href="clientRequest" class="clientRequest card-link stretched-link text-dark">click</a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="card-columns mb-2">
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>고객 리뷰 관리</h4>
							<p class="card-text mb-1">고객이 구입한 상품에 남긴 리뷰를 관리합니다.</p>
							<a href="pmrBoardView" class="rBoardView card-link stretched-link text-dark">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>통 계</h4>
							<p class="card-text mb-1">관련된 통계 정보를 관리합니다. </p>
							<a href="pageInfo" class="pageInfo card-link stretched-link text-dark">click</a>
						</div>
					</div>
					<div class="card border border-secondary bg-white homeCard" style="box-shadow:3px 3px 5px black">
						<div class="card-body text-center">
							<h4>판매자 문의</h4>
							<p class="card-text mb-1">페이지를 운영하실때 도움이 필요하시면 연락주세요.</p>
							<a href="managerHelp" class="managerHelp card-link stretched-link text-dark">click</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div style="height:100px"></div>
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
	//review
	$(".rBoardView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(".rBoardView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("전체 고객의 리뷰 목록입니다.");
			},
			error: function(){
				alert("product List: 서버 접속 실패");
			}
		});
	});
	//managerHelp
	$(".managerHelp").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(".managerHelp").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("판매자-개발자 연락처 정보입니다.");
			},
			error: function(){
				alert("managerHelp: 서버 접속 실패");
			}
		});
	});
	//orderList
	$(".pmOrderList").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(".pmOrderList").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("주문관리 페이지입니다.");
			},
			error: function(){
				alert("order List: 서버 접속 실패");
			}
		});
	});
	$(".pageInfo").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(".pageInfo").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#managerBoard").html(data);
				$("#infotxt").text("통계 페이지입니다.");
			},
			error: function(){
				alert("order List: 서버 접속 실패");
			}
		});
	});
});
</script>
</body>
</html>