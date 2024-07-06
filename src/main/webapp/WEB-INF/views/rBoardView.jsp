<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %> 
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!-- RWD -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- MS -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8,IE=EmulateIE9"/> 
<title>게시판</title>
<!--  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->  
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> 
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="js/jquery.twbsPagination.js"></script>
<!-- stylesheet -->
<link href="style/rBoardView.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<form id = "searchForm" class="form-inline"  action="#">		
  		<button class="btn btn-success ml-auto" type="button"><i class="fa fa-search"></i></button>
    	<input id="searchInput" class="form-control mr-sm-2" type="text" placeholder="Search">    	
</form>   
 
  
<div id="submain">
	<h3 class="text-center" id=rBoard>REVIEW BOARD</h3>	
	<table id="searchTable" class="table table-bordered table-hover text-center">
		<thead>
			<tr>
				<th>No.</th>
				<th>Product</th>
				<th>Title</th>
				<th>ID</th>
				<th>Date</th>
			</tr>
		</thead>
		<tbody>	
			<c:forEach items="${listContent}" var="dto">
				<tr>
					<td>${dto.rbId}</td>
					<td>${dto.pId}</td>
					<td>
						<c:forEach begin="1" end="${dto.rIndent}">-</c:forEach>
						<a class="contentView" href="rContentView?rbId=${dto.rbId}">${dto.rTitle}</a>
					</td>
					<td>${dto.uEmail}</td> 
					<td>${dto.rDate}</td> 	
			    </tr>	
			</c:forEach>
		</tbody>	
	</table>
</div>
<!-- 페이지 표시 -->
<nav aria-label="Page navigation"> 
	<ul class="pagination justify-content-center" id="pagination" style="margin:20px 0">
	</ul>
</nav>

<script>
$(function(){		
	//내용보기
	$(".contentView").click(function(event){
		event.preventDefault();
		let ceo = $(event.target);
		$.ajax({
			url : ceo.attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#mainRegion").html(data);
				$("#current").text("리뷰 상세페이지 입니다.");
			},
			error : function() {
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	//쓴 글이 없을때 
	if($(".contentView").length==0){
		let noneReview ="<tr><td colspan='6'><h3 class='text-secondary text-center'>작성한 리뷰가 없습니다.</h3></td></tr>";
		$("#reviewBody").html(noneReview);
	}
	else{
		window.pagObj = $("#pagination").twbsPagination({
			totalPages: $(".contentView").length,
			visiblePages: 10,
			onPageClick : function(event,page) {
				console.info(page + ' (from options)');
				$(".page-link").on("click",function(event){
					event.preventDefault(); 	 			
					let peo = $(event.target); 			
					let pageNo = peo.text();				
					let purl;
					let pageA;
					let pageNo1;
					let pageNo2;
					
					if(pageNo != "First" && pageNo != "Previous" && pageNo != "Next" && pageNo != "Last") {
						purl = "plist?pageNo=" + pageNo;
					}
					else if(pageNo == "Next") {
						pageA = $("li.active > a");
						pageNo = pageA.text();
						pageNo1 = parseInt(pageNo);
						pageNo2 = pageNo1 + 1;
						purl = "plist?pageNo=" + pageNo2;
					}
					else if(pageNo == "Previous") {
						pageA = $("li.active > a");
						pageNo = pageA.text();
						pageNo1 = parseInt(pageNo);
						pageNo2 = pageNo1 - 1;
						purl = "plist?pageNo=" + pageNo2;
					}
					else if(pageNo == "First") {					
						purl = "plist?pageNo=" + 1;
					}
					else if(pageNo == "Last") {					
						purl = "plist?pageNo=" + 35;
					}
					else {					
						return;					
					}	
					
					$.ajax({
						url : purl,
						type : "get",
						data : "",
						success : function(data) {
							$("#hjumbo").text("게시판 " + pageNo + "페이지입니다");						
							$("#submain").html(data);						
						},
						error : function() {
							$("#mbody").text("서버접속 실패!.");
							$("#modal").trigger("click");	
						}					
					});
				});
			}
		})
		.on('page', function(event, page){
			console.info(page + ' (from event listening)');	    
		});
	}	

});
</script>

<script>
$("#searchInput").on("keyup",function(){
	var value = $(this).val().toLowerCase();
	$("#searchTable tr").filter(function(){
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	});
});
//전체 게시판 내용에서 고르기
$("#searchInput").on("focus",function(){
	console.log('focus');
	$.ajax({
		url : "searchBoard",
		type : "get",
		data : "",
		success : function(data) {
			$("#mainRegion").html(data);
			$("#current").text("리뷰 게시판 검색 입니다.");
		},
		error : function() {
			$("#mbody").text("서버 접속 실패");
			$("#modal").trigger("click");
		}
	});
});
</script>
</body>
</html>