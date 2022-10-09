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
<body>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="user_id"/>
</sec:authorize>
<div class="container text-center">
	<p id="fail">비밀번호를 입력해주세요</p><br/>
	<form action="passwordConf" method="post" id="passwordConf">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<input type="hidden" name="uEmail" value="${user_id}"/>
		<input type="password" name="pwConfirm" id="pwConfirm"/>
		<button type="submit" class="btn btn-dark">확인</button>
	</form>
	<button type="button" id="userInfoBtn" class="d-none">ok</button>
</div>
<script>
$(document).ready(function(){
	$("#passwordConf").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#passwordConf").attr("action"),
			type: $("#passwordConf").attr("method"),
			data: $("#passwordConf").serialize(),
			success: function(data){
				if(data.search("identify-success") > -1){ 
					alert("확인되었습니다.");
					$("#userInfoBtn").trigger("click");
				}
				else{
					$("#fail").text("비밀번호를 확인해주세요.");
				}
			},
			error: function(){
				$("#fail").text("서버오류: 서버 접속 실패");
			}
		});
	});
	$("#userInfoBtn").click(function(event){
		event.preventDefault();
		let reque="myInfoModify?uEmail=${user_id}";
		$.ajax({
			url: reque,
			type:"get",
			data:"",
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("my Info");
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