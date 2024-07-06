<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>HOME</title> 
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- stylesheet -->
<link href="style/header.css" type="text/css" rel="stylesheet"/>
<link href="style/home.css" type="text/css" rel="stylesheet"/>
<link href="style/footer.css" type="text/css" rel="stylesheet"/>
<!--  icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- stylesheet -->
<link href="style/header.css" type="text/css" rel="stylesheet"/>
<link href="style/home.css" type="text/css" rel="stylesheet"/>
<link href="style/footer.css" type="text/css" rel="stylesheet"/>
<style>
html, body{
	height: 100%;
	margin : 0;
	padding: 0;
}
#mainRegion{
	height:auto;
}
.carousel-inner img {
	/*RWD를 위해 처리 */
	width: 100%;
	height : 100%;
}
</style>
</head> 
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="col text-center tBar">
	<button id="current" type="button" class="btn btn-dark btn-sm btn-block active">7월 쿠폰팩 최대 2만원 지급</button>
</div>
<div class="text-center">
	<a class="container text-center" href="home"><img src="media/LOGO.jpg" alt="회사 로고"></a>
</div>
<!--navigation-->
<nav class="navbar navbar-expand-lg container sticky-top">
	<!-- collapsible navbar button -->
	<button class="navbar-toggler btn btn-block btn-secondary" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse justify-content-center text-center" id="collapsibleNavbar">
		<ul class="navbar-nav bi-top-nav02">
			<li class="nav-item dropdown menu01"> 
	           	<a class=" nav-link dropdown-toggle text-muted" id="shopbtn" data-target="#shopDrop" data-toggle="dropdown" href="#">
	           		Shop
	           	</a>
	           	<div class="dropdown-menu" id="shopDrop">
					<a class="dropdown-item" id="outerView" href="outerView">Outer</a>
					<a class="dropdown-item" href="topView" id="topView">Top</a>
					<a class="dropdown-item" href="bottom" id="bottom">Bottom</a>
					<a class="dropdown-item" href="etcView" id="etcView">ETC</a>
				</div>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" href="lookbook" id="lookbookView">LookBook</a>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" href="newView" id="newView">New</a>
			</li>
			<li class="mymenu nav-item">
				<a class="nav-link text-muted" href="bestView" id="bestView">Best</a>
			</li>
			<li class="menu02 nav-item dropdown">
				<a class="nav-link dropdown-toggle text-muted" id="comunutybtn" data-target="#comunityDrop" data-toggle="dropdown" href="#">
					Community
				</a>
	           	<div class="dropdown-menu" id="comunityDrop">
					<a class="dropdown-item" id="faq" href="faq">QnA</a>
					<a class="dropdown-item" id="myPage" href="productCart">my page</a>
					<a class="dropdown-item" id="rBoardView" href="rBoardView">review Board</a>
				</div>
			</li>
			<li class="mymenu nav-item">
				<span>&emsp;</span>
			</li>

			<sec:authorize access="isAnonymous()">
				<li class="nav-item mymenu">
					<a class="nav-link text-muted" href="loginView">로그인</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<li class="nav-item mymenu">
					<a class="nav-link text-muted" href="joinView" id="joinView">회원가입</a>
				</li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="nav-item mymenu">
					<a class="nav-link text-muted" href="logoutView">로그아웃</a>
				</li>
			</sec:authorize>
		</ul>
	</div>
</nav>

<!-- main region -->
<div id="mainRegion" class="container mt-1">
	<!-- image slider-->	
	<div id="slides" class="carousel slide p-0" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#slides" data-slide-to="0" class="active"></li>
			<li data-target="#slides" data-slide-to="1"></li>
			<li data-target="#slides" data-slide-to="2"></li>
		</ul>
 		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="media/${homeDto.hmSlide0}" alt="${homeDto.hmSlide0}">
			</div>
			<div class="carousel-item">
				<img src="media/${homeDto.hmSlide1}" alt="${homeDto.hmSlide1}">
			</div>
			<div class="carousel-item">
				<img src="media/${homeDto.hmSlide2}" alt="${homeDto.hmSlide2}">
			</div>
		</div>
	</div><br/>
	<!-- 이미지 한개-->
	<div class="swimimg">
		<img src="media/${homeDto.hmMain}" alt="${homeDto.hmMain}" width="70%"/>
	</div>
	<hr class="my-5"/>	
	<h5 style="margin-left: 40px;">NEW ARRIVALS</h5><br/>
	<div class="row">
		<c:forEach items="${newList}" var="newp">
			<div class="col-md-4 my-3" style="hight:auto;">
				<div class="card">
					<a href="productdetails?pId=${newp.pId}" class="pclick">
						<img class="card-img-top" src="image/${newp.pPhoto}" alt="image:${newp.pName}" style="width:100%;"/>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<hr class="my-5"/>	
	<h5 style="margin-left: 40px;">BEST ITEMS</h5><br/>
	<div class="row">
		<c:forEach items="${bestList}" var="bestp">
			<div class="col-md-4 my-3" style="hight:auto;">
				<div class="card">
					<a href="productdetails?pId=${bestp.pId}" class="pclick">
						<img class="card-img-top" src="image/${bestp.pPhoto}" alt="image:${bestp.pName}" style="width:100%;"/>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!--footer-->
<footer>
	<div class="container-fluid">
		<div class="footer">
			<div class="socialicon">
				<ul style="list-style:none; text-align:col;">
					<li style= "display:inline-block;" >
						<a class="text-dark" href="${homeDto.hmInstar}" target="_blank">
							<i class="fas fa-camera-retro"></i>
							Instargram
						</a>
					</li>
					<li style= "display:inline-block;">
						<a class="text-dark" href="${homeDto.hmYoutube}" target="_blank">
							<i class="fab fa-youtube"></i>
							Youtube
						</a>
					</li>
				</ul> 
			</div>
			<div style="text-align: left-bottom;">
				<ul style="list-style:none; text-align:center;" >
					<li style= "display:inline-block;">
						<a class="text-muted" href="#" >도움말</a>
					</li>
					<li style= "display:inline-block;">
						<a class="text-muted" href="#">배송 </a>
					</li>
					<li style= "display:inline-block;">
						<a class="text-muted" href="#">교환/반품/환불 </a>
					</li>
					<li style= "display:inline-block;">
						<a class="text-muted" href="#">인재채용 </a>
					</li>
					<li style= "display:inline-block;">
						<a class="text-muted" href="#">제휴문의</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="footer-bottom">
		<div class="col">
			<ul style="list-style:none; text-align: center;" >
				<li><a class="text-secondary" href="#">AGREEMENT</a></li>
				<li><a class="text-muted" href="#">SHOPPING GUIDE</a></li>
				<li><a class="text-muted" href="#">PRIVACY</a></li>
			</ul>
		</div>
	</div>
	<div class="fb-right">
		<div class="fbox copyright">
			<ul style="list-style:none; text-align:center;">
				<li>COMPANY:(주)블랙업</li>
				<li>OWNER:최예나래</li>
				<li>TEL:1566-6813</li>
				<li>EMAIL:contact@black-up.co.kr</li>
				<li>BUSINESS LICENSE:419-87-00807</li>
				<li>E-COMMERCE PERMIT:제 2017-서울마포-2273호</li>
				<li>
					ADDRESS:
					<span> </span>
					03992
					<span>  </span>
					서울특별시 마포구 동교로23길 32-22 (동교동)JC동교빌딩 4층
				</li>
			</ul>
		</div>
	</div>
	<div class="copyright" style="text-align:center;">
		<span>© Copyright 2022. BLACKUP.</span>
	</div>
</footer>

<!-- modal -->
<button type="button" id="modal" class="btn btn-dark d-none" data-toggle="modal" data-target="#myModal">
	Open modal
</button>
<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header bg-light">
				<h4 class="modal-title">
					<i class="fa fa-info-circle" aria-hidden="true">Info</i>
				</h4>
				<button type="button" class="close mclose" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<h4 id="mbody" class="text-center">가입을 축하합니다.</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary mclose" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script>
$(document).ready(function(){
	//회원가입창
	$("#joinView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#joinView").attr("href"),
			type:"get",
			data: "",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("회원가입 창");
			},
			error: function(){
				$("#mbody").text("회원가입 창: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//모달창 닫기
	$(".mclose").click(function(){
		location.href="loginView";
	});
	//lookbook창
	$("#lookbookView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#lookbookView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("Look Book + youtube");
			},
			error: function(){
				$("#mbody").text("룩북: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//bottom 창
	$("#bottom").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#bottom").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("하의 상품페이지");
			},
			error: function(){
				$("#mbody").text("bottom: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//top 창
	$("#topView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#topView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("상의 상품페이지");
			},
			error: function(){
				$("#mbody").text("top: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//outer
	$("#outerView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#outerView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("외투 상품페이지");
			},
			error: function(){
				$("#mbody").text("outer: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//etc
	$("#etcView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#etcView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("기타 악세서리 상품페이지");
			},
			error: function(){
				$("#mbody").text("etc: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//new
	$("#newView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#newView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("새로 입고한 상품 페이지");
			},
			error: function(){
				$("#mbody").text("new: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//best
	$("#bestView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#bestView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("best product page");
			},
			error: function(){
				$("#mbody").text("best: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//myPage
	$("#myPage").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#myPage").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("my Page");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//review
	$("#rBoardView").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#rBoardView").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("review board");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//QnA
	$("#faq").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#faq").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("QnA");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
});
</script>
</body>
</html>