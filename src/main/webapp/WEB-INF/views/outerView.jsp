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

<h3>outer</h3>
<div id="wrap">
	<div class="container mt-3">
		<div class="row mb-3">
			<c:forEach items="${outerList}" var="outerp">
				<div class="col-md-4 bottomfilter" style="hight:auto;">
					<div class="card" style="width:300px">
						<img class="card-img-top" src="image/${outerp.pPhoto}" alt="productimage" style="max-width:300px;"/>
						<div class="card-body">
							<h5 class="card-title product-title">${outerp.pName}</h5>
							<h5 class="card-text product-price">${outerp.pPrice} 원</h5>
							<a href="productdetails?pId=${outerp.pId}" class="pclick stretched-link"></a>
						</div>
						<p style="visibility:hidden;">${outerp.pType}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
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