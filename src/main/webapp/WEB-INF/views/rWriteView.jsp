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
<title>글 작성</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<h3 class="text-center">REVIEW 작성</h3>
<form action="rWrite" method="post" id="rwrite">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<div class="form-group">
		<label for="uemail">이름:</label>
		<input type="text" class="form-control" id="uemail" name="uEmail" value="${user_id}" required readonly/>
	</div>
	<div class="form-group">
		<label for="pId">상품:</label>
		<input type="text" class="form-control" id="pId" name="pId" value="${dto.pId}" required readonly/>
	</div>
	<div class="form-group">
		<label for="title">제목: </label>
		<input type="text" class="form-control" id="rtitle" name="rTitle" required/>
	</div>
	<div class="form-group">
		<label for="content">내용: </label>
		<textarea class="form-control" id="content" name="rContent"rows="10" required></textarea>
	</div>
	<button type="submit" class="btn btn-success">작성</button> &emsp;
	<a href="rBoard" id="writeLink" class="btn btn-primary">목록보기</a>
	
</form>

<script>
$(document).ready(function(){
	$("#rwrite").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#rwrite").attr("action"),
			type: "post",
			data: $("#rwrite").serialize(),
			success: function(data){
				$("#hjumno").text("글쓰기 완료, 게시판 리스트 입니다.");
				$("#mainRegion").html(data);	
			},
			error: function(){
				$("#mbody").text("write: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
	
	$("#writeLink").click(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#writeLink").attr("href"),
			type:"get",
			data: "",
			success: function(data){
				$("#hjumno").text("게시판 리스트 입니다.");
				$("#mainRegion").html(data);	
			},
			error: function(){
				$("#mbody").text("게시판: 서버 접속 실패");
				$("#modal").trigger("click");
			}
		});
	});
});
</script>
</body>
</html>