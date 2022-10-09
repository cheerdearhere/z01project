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
<title>Bottom</title>
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
<!-- style file -->
<link href="style/shop.css" type="text/css" rel="stylesheet">
<link href="style/home.css" type="text/css" rel="stylesheet"/>
<link href="style/footer.css" type="text/css" rel="stylesheet"/>
<link href="style/header.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<!-- bottom navbar -->
<h5 class="text-center shopPart">
	<a id="bottomS" class="text-dark bottom" href="bottom">bottom</a>
</h5>
<nav class="row navbar navbar-expand-sm justify-content-center text-center">
	<ul class="bi-top-nav02 pList nav" style="list-style:none">
		<!-- select로 해당 소스를 sort해오는 것으로 -->
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="skirt" href="skirtView">skirt</a>
		</li>
		<li class="nav-item mymenu">
			<a class="nav-link text-muted" id="pant" href="pantView">pants</a>
		</li>
	</ul>
</nav>
<hr/>
<!-- 옷 리스트 -->
<div id="wrap">
	<div class="container mt-3">
		<div class="row mb-3">		
			<!-- 실제 DB적용: bottom 전체 select -->
			<c:forEach items="${bottomList}" var="bottomp">
				<div class="col-md-4 bottomfilter" style="hight:auto;">
					<div class="card" style="width:300px">
						<img class="card-img-top" src="image/${bottomp.pPhoto}" alt="productimage" style="max-width:300px;"/>
						<div class="card-body">
							<h5 class="card-title product-title">${bottomp.pName}</h5>
							<h5 class="card-text product-price">${bottomp.pPrice} 원</h5>
							<a href="productdetails?pId=${bottomp.pId}" class="pclick stretched-link"></a>
						</div>
						<p style="visibility:hidden;">${bottomp.pType}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<br/><br/>
<script>
$(document).ready(function(){
	//bottom 창
	$(".bottom").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $(".bottom").attr("href"),
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
	//bottom 중 해당 요소만 출력
	$("#skirt").click(function(e){
		e.preventDefault();
		$(".bottomfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("skirt")>-1);
		});
	});
	$("#pant").click(function(e){
		e.preventDefault();
		$(".bottomfilter").filter(function(){
			$(this).toggle($(this).find("p").text().indexOf("pant")>-1);
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