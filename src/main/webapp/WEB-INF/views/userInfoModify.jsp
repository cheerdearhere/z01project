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

<div style="width:100%">
	<form action="userInfoModify" method="post" id="userInfoModify" name="userInfoModify">
		<div class="form-group">
			<label for="joindate">가입일</label>
			<input type="text" class="form-control" name="udate" value="${userInfo.udate}" id="joindate" readonly/>
		</div>
		<input type="hidden" name="uauth" value="${userInfo.uauth}"/>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<p class="text-center"> 필수 입력 </p>
		<div class="form-group">
			<label for="Id">아이디</label>
			<input type="email" class="form-control" name="uemail" value="${userInfo.uemail}" id="Id" readonly/>
		</div>
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" class="form-control" name="uname" value="${userInfo.uname}" id="name" readonly/>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<input type="password" class="form-control" placeholder="비밀번호는 비밀번호 변경을 이용해주세요" id="pw" readonly/>
			<input type="hidden" name="upw" value="${userInfo.upw}"/>
		</div>
		<div class="form-group">
			<label for="uPhone1">기본 연락처</label>
			<input type="text" class="form-control" name="uphone1" value="${userInfo.uphone1}" id="uPhone1" required/>
		</div><hr/>
		<p class="text-center"> 선택 입력 </p>
		<div class="form-group">
			<label for="uPhone2">다른 연락처</label>
			<input type="text" class="form-control" name="uphone2" value="${userInfo.uphone2}" id="uPhone2"/>
		</div>
		<div class="form-group">
			<label for="uAddress">주소</label>
			<input type="text" class="form-control" name="uaddress" value="${userInfo.uaddress}" id="uAddress"/>
		</div>
		<button type="submit" class="btn btn-success">저장</button> &emsp;
		<button type="reset" class="btn btn-dark">초기화</button> &emsp;
		<a href="passwordmodify" class="btn btn-outline-dark">비밀번호 변경</a> &emsp;
		<a href="#" class="btn btn-danger">회원탈퇴</a>
	</form>
</div>
<script>
$(document).ready(function(){
	$("#userInfoModify").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#userInfoModify").attr("action"),
			type: $("#userInfoModify").attr("method"),
			data: $("#userInfoModify").serialize(),
			success: function(data){
				$("#myPageContent").html(data);
				$("#current").text("변경사항 저장 완료");
			},
			error: function(){
				$("#mbody").text("서버 접속 실패");
				$("#modal").trigger("click");
			}
		});

});
</script>
</body>
</html>