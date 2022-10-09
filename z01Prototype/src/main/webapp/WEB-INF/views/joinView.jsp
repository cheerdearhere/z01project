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

</head>
<body>
<div style="width:100%">
	<h3 class="text-center text-dark">회원가입</h3>
	<form action="join" method="post" id="joinfrm" name="joinfrm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<p class="text-center"> 필수 입력 </p>
		<div class="form-group">
			<label for="Id">아이디</label>
			<input type="email" class="form-control" name="uEmail" placeholder="아이디로 사용할 이메일을 적어주세요." id="Id" required/>
		</div>
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" class="form-control" name="uName" placeholder="이름을 적어주세요." id="name" required/>
		</div>
		<div class="form-group">
			<label for="pw">비밀번호</label>
			<input type="password" class="form-control" name="uPw" placeholder="비밀번호를 입력하세요" id="pw" required/>
		</div>
		<div class="form-group">
			<label for="pwV">비밀번호 확인</label>
			<input type="password" class="form-control" placeholder="비밀번호를 한번 더 입력해주세요" id="pwV" required/>
		</div>
		<div class="form-group">
			<label for="uPhone1">연락처</label>
			<input type="text" class="form-control" name="uPhone1" placeholder="000-0000-0000" id="uPhone1" required/>
		</div><hr/>
		<p class="text-center"> 선택 입력 </p>
		<div class="form-group">
			<label for="uAddress">주소</label>
			<input type="text" class="form-control" name="uAddress" placeholder="주소 입력" id="uAddress"/>
		</div>
		<p class="text-dark" id="fail"></p>
		<button type="submit" class="btn btn-outline-dark">회원가입</button> &emsp;
		<button type="reset" class="btn btn-danger">초기화</button> &emsp;
		<a href="home" class="btn btn-dark">홈으로</a> &emsp;
		<a href="loginView" class="btn btn-dark">로그인</a>
	</form>
</div>
<script>
$(document).ready(function(){
	$("#joinfrm").submit(function(event){
		event.preventDefault();
		$.ajax({
			url: $("#joinfrm").attr("action"),
			type: $("#joinfrm").attr("method"),
			data: $("#joinfrm").serialize(),
			success: function(data){
				if(data.search("join-success") > -1){ 
					$("#mbody").text("가입을 축하합니다");
					$("#modal").trigger("click");	
				}
				else{
					$("#fail").text("가입 실패: 동일한 ID가 존재합니다.");
				}
			},
			error: function(){
				$("#fail").text("서버오류: 서버 접속 실패");
			}
		});
	});
	$(".mclose").click(function(){
		location.href="loginView";
	});
});
</script>
</body>
</html>