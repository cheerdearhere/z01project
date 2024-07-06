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
<title>Insert Title</title>
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
<link href="style/shop.css" type="text/css" rel="stylesheet">
</head>
<body>

<h5 class="text-center shopPart">
	<a id="bestA" class="text-dark bottom" href="bestView">BEST</a>
</h5>
<nav class="row navbar navbar-expand-sm justify-content-center text-center">
	<ul class="bi-top-nav02 pList nav" style="list-style:none">
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="outerBest" href="outerView">outer</a>
		</li>
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="topBest" href="topView">top</a>
		</li>
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="skirtBest" href="skirtView">skirt</a>
		</li>
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="pantBest" href="pantView">pants</a>
		</li>
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="etcBest" href="etcView">etc</a>
		</li>
	</ul>
</nav>
<hr/>
<!-- 옷 리스트 -->
<div id="wrap">
	<div class="container mt-3">
		<div class="row mb-3">		
			<c:forEach items="${bestList}" var="bestp">
				<div class="col-md-4 bestfilter" style="hight:auto;">
					<div class="card" style="width:300px">
						<img class="card-img-top" src="image/${bestp.pPhoto}" alt="productimage" style="max-width:300px;"/>
						<div class="card-body">
							<h5 class="card-title product-title">${bestp.pName}</h5>
							<h5 class="card-text product-price">${bestp.pPrice} 원</h5>
							<a href="productdetails?pId=${bestp.pId}" class="pclick stretched-link"></a>
						</div>
						<p style="visibility:hidden;">${bestp.pType}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<br/><br/>
<script>
$(document).ready(function(){
	//new 창
	$("#bestA").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#bestA").attr("href"),
			type:"get",
			data:"",
			success: function(data){
				$("#mainRegion").html(data);
				$("#current").text("Best 제품 페이지");
			},
			error: function(){
				$("#mbody").text("best: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//new 중 해당 요소만 출력
	$("#outerBest").click(function(e){
		e.preventDefault();
		$(".bestfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("outer")>-1);
		});
	});
	$("#topBest").click(function(e){
		e.preventDefault();
		$(".bestfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("top")>-1);
		});
	});
	$("#skirtBest").click(function(e){
		e.preventDefault();
		$(".bestfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("skirt")>-1);
		});
	});
	$("#pantBest").click(function(e){
		e.preventDefault();
		$(".bestfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("pant")>-1);
		});
	});
	$("#etcBest").click(function(e){
		e.preventDefault();
		$(".bestfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("etc")>-1);
		});
	});
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