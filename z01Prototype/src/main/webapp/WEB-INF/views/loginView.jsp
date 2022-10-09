<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>log in</title>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
<!--google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- loginForm -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="http://fonts.cdnfonts.com/css/helvetica-neue-9" >
<link rel="stylesheet" href="/web/upload/131/source/swiper.min.css" type="text/css" >
<link rel="stylesheet" href="/style/loginView.css" type="text/css">
<link rel="stylesheet" href="/style/header.css" type="text/css">
<style>
html {
    width: 100%;
    height: 100%;
}
li {
    list-style: none;

}
.find{
    float:left;
  } 
#join-notice {
      background-color: #000;
      padding: 1.5rem 1rem;
      display: inline-block;
      position: fixed;
      right: 20px;
      bottom: 10px;
      transition: bottom 0.2s ease;
      z-index: 10;
      border-radius: 15px;
}
.login-wrap .login ul.findInfo .find{
    width: auto;
    text-align: left;
    margin-bottom: 10px;
    float: right;
    margin-top: -3px;
}
.xans-member-login .snsArea {
    width: 100%;
    float: left;
    margin: 1rem auto;
}
.if{
  text-align: right;
       float: left;
       padding : 1px;

}
div {
    display: block;
}
.login-section {
    width: 100%;
    max-width: 400px;
    text-align: center;
    margin: 0 auto;
    padding: 0 0 50px 0;
    overflow: hidden;
}
.layout-center {
    width: 51%;
    max-width: 1300px;
    padding: 0;
    font-size: 12px;
    margin: 0 auto;
    zoom: 1;
}
</style>
</head>
<body>
<div class="col text-center tBar">
	<button id="current" type="button" class="btn btn-dark btn-sm btn-block active ">7월 쿠폰팩 최대 2만원 지급</button>
</div>
<div class="text-center">
	<a class="container text-center" href="home"><img src="media/LOGO.jpg" alt="회사 로고"></a>
</div>


<section id="layout-contents" class="layout-contents">
	<div class="container"  style="text-align: center; margin: 0, auto;">
		<hr/>
		<div class="titleArea" style="margin-bottom: 40px;">
			<h5>Login or create an account</h5>
			<div id="comment" class="text-secondary text-center"></div>
		</div>
		<div class="layout-center">
			<div class="login-section">
				<div class="login">
					<form id="loginfrm" name="loginfrm" method="post" action="login">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						<div class="form-group">
							<input type="email" class="form-control" name="uemail" id="uemail" placeholder="email 주소" required/>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="upw" id="upw" placeholder="비밀번호" required/>
						</div>
							<div class="form-group form-check find">
								<input type="checkbox" class="form-check-input" id="remeberMe" name="remember-me" checked/>
								<label class="form-check-label" for="rememberMe" aria-describedby="rememberMeHelp">remember-me</label>
							</div>
							<div class="find">
								<ul class="findInfo">
									<li class="if">
										<a href="/member/id/find_id.html" style="color: black;">아이디찾기</a>
									</li>
									<li class="if">
										<a href="/member/passwd/find_passwd_info.html" style="color: black;">
											비밀번호 찾기
										</a>
									</li>
								</ul>
							</div>
							<br/><hr/>
						<button type="submit" class="btn btn-outline-dark"><span>로그인</span></button>&emsp;
						<a href="home" class="btn btn-outline-dark"><span>회원가입</span></a>&emsp;
						<!-- home > joinView로 자동으로어떻게? -->
						<a class="btn btn-dark" style="width : 100px;" href="home"><span>home</span></a>
					</form>
					<div class="snsArea">
						<div class="snsArea-inner">
							<ul>
								<li>
									<a id="klog" href="${kakao_url}" class="btn btnKakao" style="font-size:12px; margin-top:10px; padding:5px;">
									<i class="fas fa-comment text-warning"></i>  KAKAO 로그인</a>
								</li>
								<li>
									<a id="nlog" href="${naver_url}" class="btn btnNaver" style="font-size:12px;margin-top:-6px;">
									<i class="fas fa-sharp fa-solid fa-n text-success"></i>  NAVER 로그인</a>
								</li>
								<li>
									<a id="glog" href="${google_url}" class="btn btnGoogle" style="font-size:12px;margin-top:-6px;">
									<i class="fas fab fa-google text-danger"></i>  GOOGLE 로그인</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="join-notice" class="show">
			<div class="jn-close">
				<i class="ti ti-close"> </i>
			</div>
			<a style ="color : white; font-size:15px;"href="/member/join.html">
        		- 신규 가입 혜택 최대 2만원 쿠폰팩 지급 <br><br>
		        - 멤버쉽 등급 혜택 따른 최대 10% 할인 및 구매시 최대 3% 적립
			</a>
		</div>
	</div>
    <!-- End Channel Plugin -->
</section>
<script>
$(document).ready(function(){
	<c:choose>
		<c:when test="${not empty log}">
			$("#comment").text("welcome!!");
		</c:when>
		<c:when test="${not empty logout}">
			$("#comment").text("logout");
		</c:when>
		<c:when test="${not empty error}">
			$("#comment").text("login 실패: 서버 error");
		</c:when>
		<c:otherwise>
			$("#comment").text("아이디/비밀번호를 확인해주세요.");
		</c:otherwise>
	</c:choose>
});
</script>
</body>
</html>