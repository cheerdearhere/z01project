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
<title>JSP</title>
<!--bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!--jquery -->
<!--  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
-->
<!--propper jquery -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!--latest javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!--fontawesome icon-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"/>
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<h3 class="text-center threeDEffect">review detail</h3>
<form action="modify" method="post" id="modiContent">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div class="form-group">
		<label for="uId">번호</label>
		<input type="text" class="form-control" id="rId" name="rbId" value="${rContentView.rbId}" readonly />
	</div>
	<div class="form-group">
		<label for="good">추천</label>
		<input type="text" class="form-control" id="hit" value="${rContentView.rGood}" readonly />
	</div>
	<div class="form-group">
		<label for="uemail">작성자</label>
		<input type="text" class="form-control" id="uemail" name="uEmail" value="${rContentView.uEmail}" readonly/>
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" class="form-control" id="title" name="rTitle" value="${rContentView.rTitle}" readonly>
	</div>
	<div class="form-group">
		<label for="content">내용</label>
		<textarea class="form-control" id="rcontent" name="rContent" rows="10" readonly>
		${rContentView.rContent}
		</textarea>
	</div>
	<button type="submit" id="modi" class="btn btn-success">수정</button>&nbsp;&nbsp; 
	<a href="productReviewView" id="contentBoard" class="btn btn-primary">목록보기</a> &nbsp;&nbsp;
	<a href="rdelete?rbId=${rContentView.rbId}" id="contentDel" class="btn btn-primary">삭제</a> &nbsp;&nbsp;
	<a id="contentReplyView" href="replyView?rbId=${rContentView.rbId}" class="btn btn-primary">댓글</a>	
</form>

 
<script>
$(document).ready(function(){
	let username = '<c:out value="${user_id}"/>';
	let uemail = '<c:out value="${contentView.uEmail}"/>';
	
	$("#contentBoard").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#contentBoard").attr("href"),
			type : "GET",
			data : "",
			success : function(data) {
				$("#reviewContainer").html(data);
			},
			error : function() {
				alert("서버접속 실패");
			}
		});
	});
	
	$("#modiContent").submit(function(event){
		event.preventDefault();
		if(username != uemail) {
			alert("권한이 없습니다.");
			return;
		}
		else {
			$.ajax({
				url : "rmodify",
				type : "post",
				data : $("#modiContent").serialize(),
				success : function(data) {
					$("#reviewContainer").html(data);
				},
				error : function() {
					alert("서버접속 실패!.");
				}
			});
		}
	});
	
	$("#contentDel").click(function(event){
		event.preventDefault();
		if(username != uemail) {
			alert("권한이 없습니다..");
			return; 
		}
		else {
			$.ajax({
				url : $("#contentDel").attr("href"),
				type : "get",
				data : "",
				success : function(data) {
					$("#reviewContainer").html(data);
				},
				error : function() {
					alert("서버접속 실패!.");
				}
			});
		}
	});
	
	$("#contentReplyView").click(function(event){
		event.preventDefault();
		$.ajax({
			url : $("#contentReplyView").attr("href"),
			type : "get",
			data : "",
			success : function(data) {
				$("#reviewContainer").html(data);
			},
			error : function() {
				alert("서버접속 실패!.");
			}
		});
	});
});
</script>

</body>
</html>