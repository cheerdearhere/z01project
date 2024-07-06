<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix ="sec" uri = "http://www.springframework.org/security/tags" %>
<%@ page session="false" %>              
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!--RWD first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>index</title>
</head>
<body>

<h3 class="text-center text-danger multiEffect">검색용게시판</h3>
<a href="Board" id="searchBoard" class="btn btn-primary">목록보기</a> <br/>;
<form id = "searchForm" class="form-inline"  action="#">		
  		<button class="btn btn-success ml-auto" type="button" disabled><i class="fa fa-search"></i></button>
    	<input id="searchInput" class="form-control mr-sm-2" type="text" placeholder="Search">    	
</form> 	
<table id="searchTable" class="table table-bordered table-hover">
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
					<td>${dto.uEmail}</td> <!-- bName은 user id -->
					<td>${dto.rDate}</td> <!-- Timestamp형의 문자열로 출력 -->	
			    </tr>	
		</c:forEach>
	</tbody>	
</table>

<script>
$(document).ready(function(){
	$("#searchBoard").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#searchBoard").attr("href"),
			type : "GET",
			data : "",
			success : function(data) {
				$("#hjumbo").text("게시판입니다.");
				$("#mainRegion").html(data);
			},
			error : function() {
				$("#mbody").text("서버접속 실패!.");
				$("#modal").trigger("click");	
			}
		});
	});	
});
</script>

<script>
$("#searchInput").on("keyup",function(){
	var value = $(this).val().toLowerCase();
	$("#searchTable tr").filter(function(){
		$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	});
});
</script>

</body>
</html>